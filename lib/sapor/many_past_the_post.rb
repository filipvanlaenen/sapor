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
  # Class representing an electoral system with more than one
  # district where parties only have a limited number of candidates in each of
  # the constituencies.
  #
  class ManyPastThePost
    def initialize(last_election_result, last_detailed_election_result,
                   seat_distribution, caps = {}, weights = {})
      @last_election_result = last_election_result
      @last_detailed_election_result = last_detailed_election_result
      @seat_distribution = seat_distribution
      @caps = caps
      @weights = weights
    end

    def project(simulation)
      multiplicators = calculate_multiplicators(simulation)
      result = create_empty_result(simulation)
      @last_detailed_election_result.each_pair do |name, local_last_result|
        no_of_seats = @seat_distribution[name]
        caps = @caps.empty? ? {} : @caps[name]
        seats = local_seats(no_of_seats, local_last_result, multiplicators,
                            caps, @weights)
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
        local_votes[choice] = if multiplicators.key?(choice)
                                votes * multiplicators[choice]
                              else
                                votes
                              end
      end
      local_votes
    end

    def local_quotients(local_votes, no_of_seats, caps, weights)
      local_quotients = []
      local_votes.each_pair do |choice, new_value|
        actual_no_of_seats = caps.empty? ? no_of_seats : [caps[choice], no_of_seats].min
        actual_weights = weights[actual_no_of_seats - 1]
        actual_weights.each do |w|
          local_quotients << [choice, new_value.to_f * w]
        end
      end
      local_quotients
    end

    def local_seats(no_of_seats, local_last_result, multiplicators, caps,
                    weights)
      local_votes = local_votes(local_last_result, multiplicators)
      local_quotients = local_quotients(local_votes, no_of_seats, caps, weights)
      sorted_quotients = local_quotients.sort { |a, b| b.last <=> a.last }
      sorted_quotients.map(&:first).slice(0, no_of_seats)
    end
  end
end
