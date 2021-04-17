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
  # The regional data for Flanders.
  #
  class Flanders < Area
    include Singleton
    def area_code
      'BE-VLG'
    end

    def coalitions
      COALITIONS
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
      # Source: Official page with the results of the elections of 26 May 2019
      #         in Flanders, downloaded on 2 November 2019
      # https://verkiezingen2019.belgium.be/nl/verkiezingen?el=VL
      4_238_274
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private
    
    CDV_PARTY = 'Christen-Democratisch en Vlaams'.freeze
    GROEN_PARTY = 'Groen'.freeze
    NVA_PARTY = 'Nieuw-Vlaamse Alliantie'.freeze
    PVDA_PARTY = 'Partij van de Arbeid van België'.freeze
    SPA_PARTY = 'Vooruit'.freeze
    VB_PARTY = 'Vlaams Belang'.freeze
    VLD_PARTY = 'Open Vlaamse Liberalen en Democraten'.freeze

    COALITIONS = [[CDV_PARTY, GROEN_PARTY, PVDA_PARTY, SPA_PARTY],
                  [CDV_PARTY, GROEN_PARTY, SPA_PARTY],
                  [CDV_PARTY, GROEN_PARTY, SPA_PARTY, VLD_PARTY],
                  [CDV_PARTY, GROEN_PARTY, VLD_PARTY],
                  [CDV_PARTY, NVA_PARTY],
                  [CDV_PARTY, NVA_PARTY, SPA_PARTY],
                  [CDV_PARTY, NVA_PARTY, SPA_PARTY, VLD_PARTY],
                  [CDV_PARTY, NVA_PARTY, VB_PARTY],
                  [CDV_PARTY, NVA_PARTY, VLD_PARTY],
                  [CDV_PARTY, SPA_PARTY],
                  [CDV_PARTY, SPA_PARTY, VLD_PARTY],
                  [CDV_PARTY, VLD_PARTY],
                  [GROEN_PARTY, SPA_PARTY, VLD_PARTY],
                  [NVA_PARTY, SPA_PARTY, VLD_PARTY],
                  [NVA_PARTY, VB_PARTY],
                  [NVA_PARTY, VLD_PARTY],
                  [SPA_PARTY, VLD_PARTY]].freeze    

    SEAT_DISTRIBUTION = { 'Antwerpen' => 33, 'Brussel' => 6,
                          'Limburg' => 16, 'Oost-Vlaanderen' => 27,
                          'Vlaams-Brabant' => 20,
                          'West-Vlaanderen' => 22 }

    THRESHOLD = 0.05

    def election_results_of_2019
      if @election_results_of_2019.nil?
        @election_results_of_2019 = load_election_results( \
          'flanders-20190526.psv')
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
          THRESHOLD)
      end
      @electoral_system
    end
  end
end
