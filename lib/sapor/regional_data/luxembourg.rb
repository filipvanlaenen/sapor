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
  # The regional data for Luxembourg.
  #
  class Luxembourg < Area
    include Singleton
    def area_code
      'LU'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      SEAT_DISTRIBUTION.values.inject(:+)
    end

    def overall_election_results_of_2018
      if @overall_election_results_of_2018.nil?
        @overall_election_results_of_2018 = \
          summarize_election_results(election_results_of_2018)
      end
      @overall_election_results_of_2018
    end

    def population_size
      # Voter turnout on 14 October 2018 (note: multiple votes per voter)
      3_529_969
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    private

    CSV_PARTY = 'Chrëschtlech-Sozial Vollekspartei'.freeze
    DG_PARTY = 'déi gréng'.freeze
    DP_PARTY = 'Demokratesch Partei'.freeze
    LSAP_PARTY = 'Lëtzebuerger Sozialistesch Aarbechterpartei'.freeze

    COALITIONS = [[CSV_PARTY],
                  [CSV_PARTY, LSAP_PARTY],
                  [CSV_PARTY, DP_PARTY],
                  [DG_PARTY, DP_PARTY, LSAP_PARTY]].freeze

    SEAT_DISTRIBUTION = { 'Centre' => 21, 'Est' => 7, 'Nord' => 9,
                          'Sud' => 23 }.freeze

    def election_results_of_2018
      if @election_results_of_2018.nil?
        @election_results_of_2018 = load_election_results(
          'luxembourg-20181014.psv'
        )
      end
      @election_results_of_2018
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2018, election_results_of_2018,
          SEAT_DISTRIBUTION, DhondtDenominators
        )
      end
      @electoral_system
    end
  end
end
