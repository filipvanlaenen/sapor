
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
  # Class representing a proportional electoral system with only one district.
  #
  class SingleDistrictProportional
    def initialize(no_of_seats, denominators_class, threshold = 0, bonus = 0,
                   other_eligible = true, coalition_list_threshold = 1,
                   coalition_lists = [], minority_lists = [])
      @no_of_seats = no_of_seats
      @denominators_class = denominators_class
      @threshold = threshold
      @bonus = bonus
      @other_eligible = other_eligible
      @coalition_list_threshold = coalition_list_threshold
      @coalition_lists = coalition_lists
      @minority_lists = minority_lists
      @denominators = @denominators_class.get(@no_of_seats)
    end

    def project(simulation)
      votes_sum = simulation.values.inject(:+).to_f
      threshold = votes_sum * @threshold
      coalition_list_threshold = votes_sum * @coalition_list_threshold
      counters = create_counters(simulation, threshold, coalition_list_threshold)
      result = create_empty_result(simulation)
      fill_result(counters, result)
      result
    end

    private

    def create_counters(simulation, threshold, coalition_list_threshold)
      counters = []
      simulation.each_pair do |choice, new_value|
        next if choice == OTHER && !@other_eligible
        next unless @minority_lists.include?(choice) ||
                    @coalition_lists.include?(choice) &&
                    new_value >= coalition_list_threshold ||
                    !@coalition_lists.include?(choice) &&
                    new_value >= threshold
        counters << [choice, new_value.to_f, 0, new_value.to_f / @denominators[0]]
      end
      counters
    end

    def create_empty_result(simulation)
      result = {}
      simulation.each_key do |choice|
        result[choice] = 0
      end
      result[simulation.max_by(&:last)[0]] = @bonus
      result[OTHER] = 0
      result
    end

    def fill_result(counters, result)
      @no_of_seats.times do
        next_seat = counters.max_by(&:last)
        seat = next_seat.first
        if result.key?(seat)
          result[seat] += 1
        else
          result[seat] = 1
        end
        next_seat[2] = next_seat[2] + 1
        next_seat[3] = next_seat[1] / @denominators[next_seat[2]]
      end
    end
  end
end
