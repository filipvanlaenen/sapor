#
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
  # Class representing a largest remainder electoral system with more than one
  # district.
  #
  class MultiDistrictLargestRemainder
    def initialize(last_election_result, last_detailed_election_result,
                   seat_distribution, quota_class, threshold = 0,
                   national_threshold = 0, full_quota = false)
      @last_election_result = last_election_result
      @last_detailed_election_result = last_detailed_election_result
      @seat_distribution = seat_distribution
      @quota_class = quota_class
      @threshold = threshold
      @national_threshold = national_threshold
      @full_quota = full_quota
    end

    def project(simulation)
      allowed_parties = []
      unless @national_threshold.zero?
        threshold = @national_threshold * simulation.values.inject(:+)
        simulation.each_pair do |choice, votes|
          allowed_parties << choice if votes >= threshold
        end
      end
      multiplicators = calculate_multiplicators(simulation)
      result = create_empty_result(simulation)
      no_of_seats_allocated = 0
      @last_detailed_election_result.each_pair do |name, local_last_result|
        no_of_seats = @seat_distribution[name]
        local_votes = local_votes(local_last_result, multiplicators)
        thresholded_local_votes = apply_threshold(local_votes, allowed_parties)
        total_votes = if @full_quota
                local_votes.values.inject(:+)
              else
                thresholded_local_votes.values.inject(:+)
              end
        quota = @quota_class.get(total_votes, no_of_seats)
        add_automatic_seats(result, thresholded_local_votes, quota)
        remaining_seats = no_of_seats_allocated + no_of_seats - result.values.inject(:+)
        add_remaining_seats(result, thresholded_local_votes, quota, remaining_seats)
        no_of_seats_allocated += no_of_seats
      end
      result
    end

    private

    def add_automatic_seats(result, simulation, quota)
      simulation.each_pair do |choice, votes|
        result[choice] += (votes / quota).floor
      end
    end

    def add_remaining_seats(result, simulation, quota, remaining_seats)
      remainders = calculate_remainders(simulation, quota)
      choices = simulation.keys.sort { |a, b| remainders[b] <=> remainders[a] }
      choices.slice(0, remaining_seats).each { |c| result[c] += 1 }
    end

    def add_seats_to_result(result, seats)
      seats.each do |seat|
        if result.key?(seat)
          result[seat] += 1
        else
          result[seat] = 1
        end
      end
    end

    def apply_threshold(simulation, allowed_parties)
      values_sum = simulation.values.inject(:+)
      local_threshold = values_sum.to_f * @threshold
      thresholded_simulation = {}
      simulation.each_pair do |choice, votes|
        thresholded_simulation[choice] = if votes >= local_threshold and allowed_parties.include?(choice)
                                           votes
                                         else
                                           0
                                         end
      end
      thresholded_simulation
    end

    def calculate_multiplicators(simulation)
      simulation_sum = simulation.values.inject(:+)
      last_election_sum = @last_election_result.values.inject(:+)
      multiplicators = {}
      simulation.each_key do |choice|
        new_fraction = simulation[choice].to_f / simulation_sum
        last_fraction = @last_election_result[choice].to_f / last_election_sum
        multiplicators[choice] = new_fraction / last_fraction
      end
      multiplicators
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
        result[choice] = 0
      end
      result[OTHER] = 0
      result
    end

    def local_votes(local_last_result, multiplicators)
      local_votes = {}
      local_last_result.each_pair do |choice, votes|
        local_votes[choice] = if multiplicators.key?(choice)
                                votes * multiplicators[choice]
                              else
                                votes
                              end
      end
      local_votes
    end
  end
end
