# Statistical Analysis of Polling Results (SAPoR)
# Copyright (C) 2020 Filip van Laenen <f.a.vanlaenen@ieee.org>
#
# This file is part of SAPoR.
#
# SAPoR is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# SAPoR is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You can find a copy of the GNU General Public License in /doc/gpl.txt
#

module Sapor
  #
  # Class representing a largest remainder electoral system with only one
  # district.
  #
  class LargestRemainder
    def initialize(no_of_seats, quota_class, party_list_threshold = 0,
                   full_quota = false, bonus = 0, other_eligible = true,
                   coalition_list_threshold = 0, coalition_lists = [], electoral_alliances = [])
      @no_of_seats = no_of_seats
      @quota_class = quota_class
      @full_quota = full_quota
      @bonus = bonus
      @other_eligible = other_eligible
      @party_list_threshold = party_list_threshold
      @coalition_list_threshold = coalition_list_threshold
      @coalition_lists = coalition_lists
      @electoral_alliances = electoral_alliances
      @electoral_alliance_members = electoral_alliances.flatten
    end

    def project(simulation)
      result = create_empty_result(simulation)
      thresholded_simulation = apply_threshold_and_alliances(simulation)
      total_votes = if @full_quota
                      simulation.values.inject(:+)
                    else
                      thresholded_simulation.values.inject(:+)
                    end
      quota = @quota_class.get(total_votes, @no_of_seats)
      add_automatic_seats(result, thresholded_simulation, quota)
      add_remaining_seats(result, thresholded_simulation, quota)
      split_alliance_seats(result, simulation)
      result[simulation.max_by(&:last)[0]] += @bonus
      result
    end

    private

    def add_automatic_seats(result, simulation, quota)
      simulation.each_pair do |choice, votes|
        result[choice] = (votes / quota).floor
      end
    end

    def add_remaining_seats(result, simulation, quota)
      remainders = calculate_remainders(simulation, quota)
      choices = simulation.keys.sort { |a, b| remainders[b] <=> remainders[a] }
      remaining_seats = @no_of_seats - result.values.inject(:+)
      choices.slice(0, remaining_seats).each { |c| result[c] += 1 }
    end

    def apply_threshold_and_alliances(simulation)
      values_sum = simulation.values.inject(:+)
      party_list_threshold = values_sum.to_f * @party_list_threshold
      coalition_list_threshold = values_sum.to_f * @coalition_list_threshold
      thresholded_simulation = {}
      simulation.each_pair do |choice, votes|
        next if @electoral_alliance_members.include?(choice)
        thresholded_simulation[choice] = if @coalition_lists.include?(choice)
                                           if votes >= coalition_list_threshold
                                             votes
                                           else
                                             0
                                           end
                                         elsif votes >= party_list_threshold
                                           votes
                                         else
                                           0
                                         end
      end
      electoral_alliance_threshold = coalition_list_threshold == 0 ? party_list_threshold : coalition_list_threshold
      @electoral_alliances.each do | electoral_alliance |
        votes = 0
        electoral_alliance.each do | member |
          if simulation.has_key?(member)
            votes += simulation[member]
          end
        end
        thresholded_simulation[electoral_alliance] = votes >= electoral_alliance_threshold ? votes : 0
      end
      thresholded_simulation[OTHER] = 0 unless @other_eligible
      thresholded_simulation
    end

    def calculate_remainders(simulation, quota)
      remainders = {}
      simulation.each_pair do |choice, votes|
        remainders[choice] = votes / quota - (votes / quota).floor
      end
      remainders
    end

    def create_empty_result(simulation)
      result = {}
      simulation.each_key do |choice|
        result[choice] = 0 unless @electoral_alliance_members.include?(choice)
      end
      @electoral_alliances.each do | electoral_alliance |
        result[electoral_alliance] = 0
      end
      result[OTHER] = 0
      result
    end
    
    def split_alliance_seats(result, simulation)
      @electoral_alliances.each do | alliance |
        if result.has_key?(alliance)
          alliance_counters = []
          alliance.each do | member |
            result[member] = 0
            alliance_counters << [member, simulation[member].to_f, 0, simulation[member].to_f]
          end
          result[alliance].times do
            next_seat = alliance_counters.max_by(&:last)
            seat = next_seat.first
            result[seat] += 1
            next_seat[2] = next_seat[2] + 1
            next_seat[3] = next_seat[1] / (next_seat[2] + 1)
          end
		  result.delete(alliance)
        end
      end
    end
  end

  #
  # Class calculating the Hare quota.
  #
  class HareQuota
    def self.get(total_votes, no_of_seats)
      total_votes.to_f / no_of_seats
    end
  end

  #
  # Class calculating the Droop quota.
  #
  class DroopQuota
    def self.get(total_votes, no_of_seats)
      1 + total_votes.to_f / (1 + no_of_seats)
    end
  end

  #
  # Class calculating the Hagenbach-Bischoff quota.
  #
  class HagenbachBischoffQuota
    def self.get(total_votes, no_of_seats)
      total_votes.to_f / (1 + no_of_seats)
    end
  end
end
