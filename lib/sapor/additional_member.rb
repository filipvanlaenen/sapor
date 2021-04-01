# frozen_string_literal: true

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
  # Class representing an additional member system.
  #
  class AdditionalMember
    def initialize(last_election_result, last_detailed_election_result,
                   seat_distribution, denominators_class,
                   last_constituency_election_result,
                   last_detailed_constituency_election_result,
                   regions_per_constituency, constituency_coefficients)
      @last_election_result = last_election_result
      @last_detailed_election_result = last_detailed_election_result
      @seat_distribution = seat_distribution
      @denominators_class = denominators_class
      @last_constituency_election_result = last_constituency_election_result
      @last_detailed_constituency_election_result = last_detailed_constituency_election_result
      @regions_per_constituency = regions_per_constituency
      @constituency_coefficients = constituency_coefficients
    end

    def project(simulation)
      result = create_empty_result(simulation)
      results_per_region = {}
      constituency_simulation = convert_simulation_to_constituency(simulation)
      constituency_multiplicators = calculate_multiplicators(constituency_simulation, @last_constituency_election_result)
      @last_detailed_constituency_election_result.each_pair do |constituency, local_last_result|
        winner = local_winner(local_last_result, constituency_multiplicators)
        if result.key?(winner)
          result[winner] += 1
        else
          result[winner] = 1
        end
        region = @regions_per_constituency[constituency]
        results_per_region[region] = {} unless results_per_region.key?(region)
        if results_per_region[region].key?(winner)
          results_per_region[region][winner] += 1
        else
          results_per_region[region][winner] = 1
        end
      end
      multiplicators = calculate_multiplicators(simulation,
                                                @last_election_result)
      @last_detailed_election_result.each_pair do |region, local_last_result|
        no_of_seats = @seat_distribution[region]
        seats = local_seats(no_of_seats, local_last_result, multiplicators,
                            results_per_region[region])
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

    def calculate_multiplicators(simulation, last_election_result)
      simulation_sum = simulation.values.inject(:+)
      last_election_sum = last_election_result.values.inject(:+)
      multiplicators = {}
      simulation.each_key do |choice|
        new_fraction = simulation[choice].to_f / simulation_sum
        last_fraction = last_election_result[choice].to_f / last_election_sum
        multiplicators[choice] = new_fraction / last_fraction
      end
      multiplicators
    end

    def convert_simulation_to_constituency(simulation)
      constituency_simulation = simulation.dup
      @constituency_coefficients.each_pair do |party, coefficient|
        if constituency_simulation.key?(party)
          constituency_simulation[party] *= coefficient
        end
      end
      constituency_simulation
    end

    def create_empty_result(simulation)
      result = {}
      simulation.each_key do |choice|
        result[choice] = 0
      end
      result[OTHER] = 0
      result
    end

    def local_quotients(local_votes, no_of_seats, region_results)
      local_quotients = []
      effective_no_of_seats = no_of_seats + region_results.values.max
      denominators = @denominators_class.get(effective_no_of_seats)
      effective_threshold = local_votes.values.max.to_f / denominators.last
      local_votes.each_pair do |choice, new_value|
        denominators.each_with_index do |d, i|
          break if new_value.to_f / d < effective_threshold
          next if region_results.key?(choice) && i < region_results[choice]

          local_quotients << [choice, new_value.to_f / d]
        end
      end
      local_quotients
    end

    def local_seats(no_of_seats, local_last_result, multiplicators,
                    region_results)
      local_votes = local_votes(local_last_result, multiplicators)
      local_quotients = local_quotients(local_votes, no_of_seats,
                                        region_results)
      sorted_quotients = local_quotients.sort { |a, b| b.last <=> a.last }
      sorted_quotients.map(&:first).slice(0, no_of_seats)
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

    def local_winner(local_last_result, multiplicators)
      new_local_result = {}
      local_last_result.each_pair do |choice, votes|
        new_local_result[choice] = if multiplicators.key?(choice)
                                     votes * multiplicators[choice]
                                   else
                                     votes
                                   end
      end
      max_votes = new_local_result.values.max
      winner = new_local_result.select { |_k, v| v.equal?(max_votes) }.keys.first
      multiplicators.key?(winner) ? winner : OTHER
    end
  end
end
