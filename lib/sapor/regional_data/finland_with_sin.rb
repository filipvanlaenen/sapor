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
  # The regional data for Finland extended with SIN.
  #
  class FinlandWithSin < Area
    include Singleton

    def area_code
      'FI∪{SIN}'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      SEAT_DISTRIBUTION.values.inject(:+)
    end

    def overall_election_results_of_2015
      if @overall_election_results_of_2015.nil?
        @overall_election_results_of_2015 = \
          summarize_election_results(election_results_of_2015)
      end
      @overall_election_results_of_2015
    end

    def population_size
      POPULATION_SIZE
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    private

    KD_PARTY = 'Kristillisdemokraatit'.freeze
    KESK_PARTY = 'Suomen Keskusta'.freeze
    KOK_PARTY = 'Kansallinen Kokoomus'.freeze
    PS_PARTY = 'Perussuomalaiset'.freeze
    SDP_PARTY = 'Suomen Sosialidemokraattinen Puolue'.freeze
    SFP_PARTY = 'Svenska folkpartiet i Finland'.freeze
    SIN_PARTY = 'Sininen tulevaisuus'.freeze
    VAS_PARTY = 'Vasemmistoliitto'.freeze
    VIHR_PARTY = 'Vihreä liitto'.freeze

    COALITIONS = [[KD_PARTY, KESK_PARTY, KOK_PARTY, SFP_PARTY],
                  [KD_PARTY, KOK_PARTY, SDP_PARTY, SFP_PARTY],
                  [KD_PARTY, KOK_PARTY, SDP_PARTY, SFP_PARTY, VAS_PARTY,
                   VIHR_PARTY],
                  [KD_PARTY, KOK_PARTY, SDP_PARTY, SFP_PARTY, VIHR_PARTY],
                  [KESK_PARTY, KOK_PARTY, PS_PARTY],
                  [KESK_PARTY, KOK_PARTY, SIN_PARTY],
                  [SDP_PARTY, SFP_PARTY, VAS_PARTY, VIHR_PARTY],
                  [SDP_PARTY, VAS_PARTY, VIHR_PARTY]].freeze

    # Voter turnout on 19 April 2015
    # https://en.wikipedia.org/wiki/Finnish_parliamentary_election,_2015
    POPULATION_SIZE = 2_968_459

    SEAT_DISTRIBUTION = { '01 Helsinki' => 22, '02 Uusimaa' => 36,
                          '03 Varsinais-Suomi' => 17, '04 Satakunta' => 8,
                          '05 Ahvenanmaa' => 1, '06 Häme' => 14,
                          '07 Pirkanmaa' => 19, '08 Kaakkois-Suomi' => 17,
                          '09 Savo-Karjala' => 15, '10 Vaasa' => 16,
                          '11 Keski-Suomi' => 10, '12 Oulu' => 18,
                          '13 Lappi' => 7 }.freeze

    def election_results_of_2015
      if @election_results_of_2015.nil?
        @election_results_of_2015 = load_election_results(
          'finland-20150419-with-sin.psv'
        )
      end
      @election_results_of_2015
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2015, election_results_of_2015,
          SEAT_DISTRIBUTION, DhondtDenominators
        )
      end
      @electoral_system
    end
  end
end
