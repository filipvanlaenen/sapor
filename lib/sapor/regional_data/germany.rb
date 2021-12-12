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
  # The regional data for Germany.
  #
  class Germany < Area
    include Singleton

    def area_code
      'DE'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      NO_OF_SEATS + BONUS_SEATS
    end

    def population_size
      POPULATION_SIZE
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    AFD_PARTY = 'Alternative für Deutschland'.freeze
    CDU_PARTY = 'Christlich Demokratische Union Deutschlands'.freeze
    CSU_PARTY = 'Christlich-Soziale Union in Bayern'.freeze
    FDP_PARTY = 'Freie Demokratische Partei'.freeze
    GRUNEN_PARTY = 'Bündnis 90/Die Grünen'.freeze
    LINKEN_PARTY = 'Die Linke'.freeze
    SPD_PARTY = 'Sozialdemokratische Partei Deutschlands'.freeze
    SSW_PARTY = 'Südschleswigscher Wählerverband'.freeze

    COALITIONS = [[AFD_PARTY, CDU_PARTY, CSU_PARTY],
                  [AFD_PARTY, CDU_PARTY, CSU_PARTY, FDP_PARTY],
                  [CDU_PARTY, CSU_PARTY, FDP_PARTY],
                  [CDU_PARTY, CSU_PARTY, FDP_PARTY, GRUNEN_PARTY],
                  [CDU_PARTY, CSU_PARTY, FDP_PARTY, SPD_PARTY],
                  [CDU_PARTY, CSU_PARTY, GRUNEN_PARTY],
                  [CDU_PARTY, CSU_PARTY, GRUNEN_PARTY, SPD_PARTY],
                  [CDU_PARTY, CSU_PARTY, SPD_PARTY],
                  [FDP_PARTY, GRUNEN_PARTY, SPD_PARTY],
                  [FDP_PARTY, SPD_PARTY],
                  [GRUNEN_PARTY, LINKEN_PARTY, SPD_PARTY],
                  [GRUNEN_PARTY, SPD_PARTY],
                  [LINKEN_PARTY, SPD_PARTY]].freeze

    BONUS_SEATS = 3
    NO_OF_SEATS = 735 - BONUS_SEATS

    # Voter turnout on 24 September 2017
    # Source: Wikipedia page with the results of the elections of 24 September
    # 2017, downloaded on 13 March 2020,
    # https://en.wikipedia.org/wiki/2017_German_federal_election
    POPULATION_SIZE = 46_976_341

    THRESHOLD = 0.05

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = GermanSingleDistrictProportional.new(
          NO_OF_SEATS, SainteLagueDenominators, THRESHOLD, BONUS_SEATS, false,
          THRESHOLD, [].freeze, [CSU_PARTY, LINKEN_PARTY, SSW_PARTY].freeze, CSU_PARTY, 0.7
        )
      end
      @electoral_system
    end
  end

  #
  # Class representing a proportional electoral system with only one district,
  # but adjusted for the 2021 German election.
  #
  class GermanSingleDistrictProportional
    def initialize(no_of_seats, denominators_class, threshold = 0, bonus = 0,
                   other_eligible = true, coalition_list_threshold = 1,
                   coalition_lists = [], minority_lists = [], bonus_party,
                   bonus_party_cutoff)
      @no_of_seats = no_of_seats
      @denominators_class = denominators_class
      @threshold = threshold
      @bonus = bonus
      @other_eligible = other_eligible
      @coalition_list_threshold = coalition_list_threshold
      @coalition_lists = coalition_lists
      @minority_lists = minority_lists
      @denominators = @denominators_class.get(@no_of_seats)
      @bonus_party = bonus_party
      @bonus_party_cutoff = bonus_party_cutoff
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
      if simulation[@bonus_party] < simulation.values.inject(:+).to_f * @bonus_party_cutoff
        result[@bonus_party] = @bonus
      else
        result[simulation.max_by(&:last)[0]] = @bonus
      end
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
