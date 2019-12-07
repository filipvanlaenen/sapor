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
  # The regional data for Wallonia.
  #
  class Wallonia < Area
    include Singleton
    def area_code
      'BE-WAL'
    end

    CDH_PARTY = 'Centre démocrate humaniste'.freeze
    ECOLO_PARTY = 'Ecolo'.freeze
    MR_PARTY = 'Mouvement Réformateur'.freeze
    PS_PARTY = 'Parti Socialiste'.freeze
    PTB_PARTY = 'Parti du Travail de Belgique'.freeze

    def coalitions
      [[CDH_PARTY, ECOLO_PARTY, MR_PARTY],
       [CDH_PARTY, ECOLO_PARTY, PS_PARTY],
       [CDH_PARTY, MR_PARTY],
       [CDH_PARTY, PS_PARTY],
       [CDH_PARTY, PS_PARTY, PTB_PARTY],
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

    def overall_election_results_of_2019
      if @overall_election_results_of_2019.nil?
        @overall_election_results_of_2019 = \
          summarize_election_results(election_results_of_2019)
      end
      @overall_election_results_of_2019
    end

    def population_size
      # Voter turnout on 26 May 2019
      # Source: https://verkiezingen2019.belgium.be/nl/verkiezingen?el=WL
      # Retrieved on 7 December 2019
      2_034_813
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

    def election_results_of_2019
      if @election_results_of_2019.nil?
        @election_results_of_2019 = load_election_results( \
          'wallonia-20190526.psv'
        )
      end
      @election_results_of_2019
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2019,
          election_results_of_2019,
          SEAT_DISTRIBUTION,
          DhondtDenominators,
          THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
