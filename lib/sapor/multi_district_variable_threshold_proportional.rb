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
  # Class representing a proportional electoral system with more than one
  # district.
  #
  class MultiDistrictVariableThresholdProportional
    def initialize(last_election_result, last_detailed_election_result,
                   seat_distribution, denominators_class,
                   party_list_threshold, coalition_list_threshold,
                   coalition_lists, minority_lists)
      @last_election_result = last_election_result
      @last_detailed_election_result = last_detailed_election_result
      @seat_distribution = seat_distribution
      @denominators_class = denominators_class
      @party_list_threshold = party_list_threshold
      @coalition_list_threshold = coalition_list_threshold
      @coalition_lists = coalition_lists
      @minority_lists = minority_lists
    end

    def project(simulation)
      allowed_parties = []
      total_votes = simulation.values.inject(:+)
      party_list_threshold = @party_list_threshold * total_votes
      coalition_list_threshold = @coalition_list_threshold * total_votes
      simulation.each_pair do |choice, votes|
        next unless @minority_lists.include?(choice) ||
                    @coalition_lists.include?(choice) &&
                    votes >= coalition_list_threshold ||
                    !@coalition_lists.include?(choice) &&
                    votes >= party_list_threshold
        allowed_parties << choice
      end
      multiplicators = calculate_multiplicators(simulation)
      result = create_empty_result(simulation)
      @last_detailed_election_result.each_pair do |name, local_last_result|
        no_of_seats = @seat_distribution[name]
        seats = local_seats(no_of_seats, local_last_result, multiplicators,
                            allowed_parties)
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

    def local_quotients(local_votes, no_of_seats, allowed_parties)
      local_quotients = []
      denominators = @denominators_class.get(no_of_seats)
      effective_threshold = local_votes.values.max.to_f / denominators.last
      local_votes.each_pair do |choice, new_value|
        next unless allowed_parties.empty? || allowed_parties.include?(choice)
        denominators.each do |d|
          break if new_value.to_f / d < effective_threshold
          local_quotients << [choice, new_value.to_f / d]
        end
      end
      local_quotients
    end

    def local_seats(no_of_seats, local_last_result, multiplicators,
                    allowed_parties)
      local_votes = local_votes(local_last_result, multiplicators)
      local_quotients = local_quotients(local_votes, no_of_seats,
                                        allowed_parties)
      sorted_quotients = local_quotients.sort { |a, b| b.last <=> a.last }
      sorted_quotients.map(&:first).slice(0, no_of_seats)
    end
  end
end
