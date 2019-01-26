# Statistical Analysis of Polling Results (SAPoR)
# Copyright (C) 2016 Filip van Laenen <f.a.vanlaenen@ieee.org>
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
    def initialize(no_of_seats, quota_class, threshold = 0, full_quota = false,
                   bonus = 0, other_eligible = true)
      @no_of_seats = no_of_seats
      @quota_class = quota_class
      @threshold = threshold
      @full_quota = full_quota
      @bonus = bonus
      @other_eligible = other_eligible
    end

    def project(simulation)
      result = create_empty_result(simulation)
      thresholded_simulation = apply_threshold(simulation)
      total_votes = if @full_quota
                      simulation.values.inject(:+)
                    else
                      thresholded_simulation.values.inject(:+)
                    end
      quota = @quota_class.get(total_votes, @no_of_seats)
      add_automatic_seats(result, thresholded_simulation, quota)
      add_remaining_seats(result, thresholded_simulation, quota)
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

    def apply_threshold(simulation)
      threshold = simulation.values.inject(:+).to_f * @threshold
      thresholded_simulation = {}
      simulation.each_pair do |choice, votes|
        thresholded_simulation[choice] = votes >= threshold ? votes : 0
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
        result[choice] = 0
      end
      result[OTHER] = 0
      result
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
