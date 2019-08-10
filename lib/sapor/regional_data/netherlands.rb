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
  # The regional data for Netherlands.
  #
  class Netherlands < Area
    include Singleton

    def area_code
      'NL'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      NO_OF_SEATS
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
    
    CDA_PARTY = 'Christen-Democratisch Appèl'.freeze
    CU_PARTY = 'ChristenUnie'.freeze
    D66_PARTY = 'Democraten 66'.freeze
    PVDA_PARTY = 'Partij van de Arbeid'.freeze
    PVV_PARTY = 'Partij voor de Vrijheid'.freeze
    VVD_PARTY = 'Volkspartij voor Vrijheid en Democratie'.freeze

    COALITIONS = [[CDA_PARTY, CU_PARTY, D66_PARTY, VVD_PARTY],
                  [CDA_PARTY, CU_PARTY, PVDA_PARTY],
                  [CDA_PARTY, D66_PARTY],
                  [CDA_PARTY, D66_PARTY, PVDA_PARTY],
                  [CDA_PARTY, D66_PARTY, VVD_PARTY],
                  [CDA_PARTY, PVDA_PARTY],
                  [CDA_PARTY, PVDA_PARTY, VVD_PARTY],
                  [CDA_PARTY, PVV_PARTY, VVD_PARTY],
                  [CDA_PARTY, VVD_PARTY],
                  [D66_PARTY, PVDA_PARTY, VVD_PARTY],
                  [PVDA_PARTY, VVD_PARTY]].freeze

    NO_OF_SEATS = 150

    # Voter turnout on 21 March 2017
    # Source: Web page with the official results of the elections of 21 March
    # 2017, downloaded on 10 August 2019,
    # https://nl.wikipedia.org/wiki/Tweede_Kamerverkiezingen_2017
    POPULATION_SIZE = 10_516_041

    THRESHOLD = 1 / NO_OF_SEATS.to_f

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(
          NO_OF_SEATS,
          DhondtDenominators,
          THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
