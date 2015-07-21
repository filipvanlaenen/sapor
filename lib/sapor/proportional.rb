# encoding: utf-8
#
# Statistical Analysis of Polling Results (SAPoR)
# Copyright (C) 2014 Filip van Laenen <f.a.vanlaenen@ieee.org>
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
  # Class representing a proportional electoral system.
  #
  class Proportional
    def initialize(last_election_result, last_detailed_election_result,
                   seat_distribution, denominators_class, threshold = 0)
      @last_election_result = last_election_result
      @last_detailed_election_result = last_detailed_election_result
      @seat_distribution = seat_distribution
      @denominators_class = denominators_class
      @threshold = threshold
    end

    def project(simulation)
      multiplicators = calculate_multiplicators(simulation)
      result = create_empty_result(simulation)
      @last_detailed_election_result.each_pair do |name, local_last_result|
        no_of_seats = @seat_distribution[name]
        seats = local_seats(no_of_seats, local_last_result, multiplicators)
        add_seats_to_result(result, seats)
      end
      result
    end

    private

    def add_seats_to_result(result, seats)
      seats.each do |seat|
        if result.key?(seat)
          result[seat] += 1
        else
          result[seat] = 1
        end
      end
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
        if multiplicators.key?(choice)
          local_votes[choice] = votes * multiplicators[choice]
        else
          local_votes[choice] = votes
        end
      end
      local_votes
    end

    def local_quotients(local_votes, local_threshold, no_of_seats)
      local_quotients = []
      local_votes.each_pair do |choice, new_value|
        next if new_value < local_threshold
        @denominators_class.get(no_of_seats).each do |d|
          local_quotients << [choice, new_value.to_f / d]
        end
      end
      local_quotients
    end

    def local_seats(no_of_seats, local_last_result, multiplicators)
      local_votes = local_votes(local_last_result, multiplicators)
      local_threshold = local_votes.values.inject(:+).to_f * @threshold
      local_quotients = local_quotients(local_votes, local_threshold,
                                        no_of_seats)
      sorted_quotients = local_quotients.sort { |a, b| b.last <=> a.last }
      sorted_quotients.map(&:first).slice(0, no_of_seats)
    end
  end

  #
  # Class building the denominators for D'Hondt.
  #
  class DhondtDenominators
    def self.get(size)
      Range.new(1, size)
    end
  end

  #
  # Class building the denominators for modified Sainte-Lague.
  #
  class SainteLague14Denominators
    def self.get(size)
      Range.new(1, size).map { |a| a.equal?(1) ? 1.4 : a * 2 - 1 }
    end
  end
end
