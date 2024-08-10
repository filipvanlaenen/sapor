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

    def overall_election_results_of_2024
      if @overall_election_results_of_2024.nil?
        @overall_election_results_of_2024 = \
          summarize_election_results(election_results_of_2024)
      end
      @overall_election_results_of_2024
    end

    def population_size
      # Voter turnout on 9 June 2024
      # Source: Official page with the results of the elections of 9 June 2024
      #         in Flanders, downloaded on 10 August 2024
      # https://verkiezingsresultaten.belgium.be/nl/election-results/vlaams-parlement/2024/gewest/251714
      4_379_440
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
    VOORUIT_PARTY = 'Vooruit'.freeze
    VB_PARTY = 'Vlaams Belang'.freeze
    VLD_PARTY = 'Open Vlaamse Liberalen en Democraten'.freeze

    COALITIONS = [[CDV_PARTY, GROEN_PARTY, PVDA_PARTY, VOORUIT_PARTY],
                  [CDV_PARTY, GROEN_PARTY, VOORUIT_PARTY],
                  [CDV_PARTY, GROEN_PARTY, VOORUIT_PARTY, VLD_PARTY],
                  [CDV_PARTY, GROEN_PARTY, VLD_PARTY],
                  [CDV_PARTY, NVA_PARTY],
                  [CDV_PARTY, NVA_PARTY, VOORUIT_PARTY],
                  [CDV_PARTY, NVA_PARTY, VOORUIT_PARTY, VLD_PARTY],
                  [CDV_PARTY, NVA_PARTY, VB_PARTY],
                  [CDV_PARTY, NVA_PARTY, VLD_PARTY],
                  [CDV_PARTY, VOORUIT_PARTY],
                  [CDV_PARTY, VOORUIT_PARTY, VLD_PARTY],
                  [CDV_PARTY, VLD_PARTY],
                  [GROEN_PARTY, VOORUIT_PARTY, VLD_PARTY],
                  [NVA_PARTY, VOORUIT_PARTY, VLD_PARTY],
                  [NVA_PARTY, VB_PARTY],
                  [NVA_PARTY, VLD_PARTY],
                  [VOORUIT_PARTY, VLD_PARTY]].freeze    

    SEAT_DISTRIBUTION = { 'Antwerpen' => 33, 'Brussel' => 6,
                          'Limburg' => 16, 'Oost-Vlaanderen' => 27,
                          'Vlaams-Brabant' => 21,
                          'West-Vlaanderen' => 21 }

    THRESHOLD = 0.05

    def election_results_of_2024
      if @election_results_of_2024.nil?
        @election_results_of_2024 = load_election_results( \
          'flanders-20240609.psv')
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
          THRESHOLD)
      end
      @electoral_system
    end
  end
end
