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
  # The regional data for Norway.
  #
  class Norway < Area
    include Singleton

    def area_code
      'NO'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      NO_OF_SEATS
    end

    def overall_election_results_of_2017
      if @overall_election_results_of_2017.nil?
        @overall_election_results_of_2017 = \
          summarize_election_results(election_results_of_2017)
      end
      @overall_election_results_of_2017
    end

    def population_size
      # Source: Valgresultat.no, retrieved on 1 January 2020.
      # URL: https://valgresultat.no/?type=st&year=2017
      2_926_836
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      LEVELING_THRESHOLD
    end

    private

    AP_PARTY = 'Arbeiderpartiet'
    FRP_PARTY = 'Fremskrittspartiet'
    H_PARTY = 'Høyre'
    KRF_PARTY = 'Kristelig Folkeparti'
    MDG_PARTY = 'Miljøpartiet De Grønne'
    R_PARTY = 'Rødt'
    SP_PARTY = 'Senterpartiet'
    SV_PARTY = 'Sosialistisk Venstreparti'
    V_PARTY = 'Venstre'

    COALITIONS = [[AP_PARTY, KRF_PARTY, MDG_PARTY, SP_PARTY],
                  [AP_PARTY, KRF_PARTY, MDG_PARTY, SP_PARTY, SV_PARTY],
                  [AP_PARTY, KRF_PARTY, SP_PARTY],
                  [AP_PARTY, MDG_PARTY, R_PARTY, SP_PARTY, SV_PARTY],
                  [AP_PARTY, MDG_PARTY, R_PARTY, SV_PARTY],
                  [AP_PARTY, MDG_PARTY, SP_PARTY, SV_PARTY],
                  [AP_PARTY, R_PARTY, SP_PARTY, SV_PARTY],
                  [AP_PARTY, SP_PARTY, SV_PARTY],
                  [AP_PARTY, SP_PARTY],
                  [AP_PARTY, SV_PARTY],
                  [FRP_PARTY, H_PARTY],
                  [FRP_PARTY, H_PARTY, KRF_PARTY, MDG_PARTY, V_PARTY],
                  [FRP_PARTY, H_PARTY, KRF_PARTY, SP_PARTY, V_PARTY],
                  [FRP_PARTY, H_PARTY, KRF_PARTY, V_PARTY],
                  [FRP_PARTY, H_PARTY, V_PARTY],
                  [H_PARTY, KRF_PARTY, V_PARTY],
                  [KRF_PARTY, SP_PARTY, V_PARTY]].freeze

    # Source: Stortingsvalget 2021, Valgdistrikt, Wikipedia, retrieved on 12
    # November 2020.
    # URL: https://no.wikipedia.org/wiki/Stortingsvalget_2021#Valgdistrikt
    DIRECT_SEAT_DISTRIBUTION = { 'Akershus' => 18, 'Aust-Agder' => 3,
                                 'Buskerud' => 7, 'Finnmark Finnmárku' => 4,
                                 'Hedmark' => 6, 'Hordaland' => 15,
                                 'Møre og Romsdal' => 7, 'Nord-Trøndelag' => 4,
                                 'Nordland' => 8, 'Oppland' => 5, 'Oslo' => 19,
                                 'Rogaland' => 13, 'Sogn og Fjordane' => 3,
                                 'Sør-Trøndelag' => 9, 'Telemark' => 5,
                                 'Troms Romsa' => 5, 'Vest-Agder' => 5,
                                 'Vestfold' => 6, 'Østfold' => 8 }.freeze

    LEVELING_THRESHOLD = 0.04

    # Source: Valg i Norge, Valgkretser, Wikipedia, retrieved on 16 April 2015.
    # URL: http://no.wikipedia.org/wiki/Valg_i_Norge#Valgkretser
    NO_OF_LEVELING_SEATS = 19

    NO_OF_SEATS = NO_OF_LEVELING_SEATS + \
                  DIRECT_SEAT_DISTRIBUTION.values.inject(:+)

    def election_results_of_2017
      if @election_results_of_2017.nil?
        @election_results_of_2017 = load_election_results(
          'norway-20170911.psv'
        )
      end
      @election_results_of_2017
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictLeveledProportional.new(
          overall_election_results_of_2017, election_results_of_2017,
          DIRECT_SEAT_DISTRIBUTION, NO_OF_LEVELING_SEATS, LEVELING_THRESHOLD,
          SainteLague14Denominators
        )
      end
      @electoral_system
    end
  end
end
