# encoding: utf-8
#
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
  # The regional data for Hungary.
  #
  class Hungary < Area
    include Singleton

    def area_code
      'HU'
    end

    def coalitions
      COALITIONS
    end

    def individual_constituencies_seats(simulation)
      individual_constituencies_electoral_system.project(simulation)
    end

    def no_of_seats
      NO_OF_PROPORTIONAL_SEATS + \
        individual_constituencies_election_results_of_2014.size
    end

    def overall_individual_constituencies_election_results_of_2014
      if @overall_individual_constituencies_election_results_of_2014.nil?
        @overall_individual_constituencies_election_results_of_2014 = \
          summarize_election_results( \
            individual_constituencies_election_results_of_2014
          )
      end
      @overall_individual_constituencies_election_results_of_2014
    end

    def party_list_seats(simulation)
      PARTY_LIST_ELECTORAL_SYSTEM.project(simulation)
    end

    def population_size
      # Voter turnout on 6 April 2014
      # Source: Wikipedia, Hungarian parliamentary election, 2014, downloaded
      # on 10 November 2017,
      # https://en.wikipedia.org/wiki/Hungarian_parliamentary_election,_2014
      5_047_363
    end

    def seats(simulation)
      individual_seats = individual_constituencies_seats(simulation)
      party_seats = party_list_seats(simulation)
      join_seats(individual_seats, party_seats)
    end

    def threshold
      THRESHOLD
    end

    private

    NO_OF_PROPORTIONAL_SEATS = 93
    THRESHOLD = 0.05
    PARTY_LIST_ELECTORAL_SYSTEM = SingleDistrictProportional.new(\
      NO_OF_PROPORTIONAL_SEATS, DhondtDenominators, THRESHOLD
    )

    COALITIONS = [%w(DK Együtt MLP MSZP Párbeszéd), ['Fidesz–KDNP']].freeze

    def individual_constituencies_election_results_of_2014
      if @individual_constituencies_election_results_of_2014.nil?
        @individual_constituencies_election_results_of_2014 = \
          load_election_results('hungary-2014.psv')
      end
      @individual_constituencies_election_results_of_2014
    end

    def individual_constituencies_electoral_system
      if @individual_constituencies_electoral_system.nil?
        @individual_constituencies_electoral_system = FirstPastThePost.new(
          overall_individual_constituencies_election_results_of_2014,
          individual_constituencies_election_results_of_2014
        )
      end
      @individual_constituencies_electoral_system
    end

    def join_seats(seats1, seats2)
      results = seats1.dup
      seats2.each_pair do |party, result|
        if results.key?(party)
          results[party] += result
        else
          results[party] = result
        end
      end
      results
    end
  end
end
