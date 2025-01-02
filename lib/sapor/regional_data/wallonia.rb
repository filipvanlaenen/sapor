# encoding: utf-8
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
  # The regional data for Wallonia.
  #
  class Wallonia < Area
    include Singleton
    def area_code
      'BE-WAL'
    end

    LE_PARTY = 'Les Engagés'.freeze
    ECOLO_PARTY = 'Ecolo'.freeze
    MR_PARTY = 'Mouvement Réformateur'.freeze
    PS_PARTY = 'Parti Socialiste'.freeze
    PTB_PARTY = 'Parti du Travail de Belgique'.freeze

    def coalitions
      [[LE_PARTY, ECOLO_PARTY, MR_PARTY],
       [LE_PARTY, ECOLO_PARTY, PS_PARTY],
       [LE_PARTY, MR_PARTY],
       [LE_PARTY, PS_PARTY],
       [LE_PARTY, PS_PARTY, PTB_PARTY],
       [ECOLO_PARTY, MR_PARTY],
       [ECOLO_PARTY, MR_PARTY, PS_PARTY],
       [ECOLO_PARTY, PS_PARTY],
       [ECOLO_PARTY, PS_PARTY, PTB_PARTY],
       [ECOLO_PARTY, PTB_PARTY],
       [MR_PARTY, PS_PARTY],
       [PS_PARTY, PTB_PARTY]]
    end

    def no_of_seats
      SEAT_DISTRIBUTION.values.inject(:+)
    end

    def overall_election_results_of_2024
      if @overall_election_results_of_2024.nil?
        @overall_election_results_of_2024 = summarize_election_results(election_results_of_2024)
      end
      @overall_election_results_of_2024
    end

    def population_size
      # Voter turnout on 9 June 2024
      # Source: https://verkiezingsresultaten.belgium.be/nl/election-results/waals-parlement/2024/gewest/253626
      # Retrieved on 2 January 2025
       2_068_766
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    # Source: https://nl.wikipedia.org/wiki/Waals_Parlement
    # Retrieved on 21 July 2017
    SEAT_DISTRIBUTION = { 'Brabant wallon' => 8,
                          'Hainaut' => 27,
                          'Liège' => 23,
                          'Luxembourg' => 6,
                          'Namur' => 11 }.freeze

    THRESHOLD = 0.05

    def election_results_of_2024
      if @election_results_of_2024.nil?
        @election_results_of_2024 = load_election_results( \
          'wallonia-20240609.psv'
        )
      end
      @election_results_of_2024
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2024,
          election_results_of_2024,
          SEAT_DISTRIBUTION,
          DhondtDenominators,
          THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
