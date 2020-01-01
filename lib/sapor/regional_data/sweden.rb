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
  # The regional data for Sweden.
  #
  class Sweden < Area
    include Singleton

    def area_code
      'SE'
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

    private
    
    C_PARTY = 'Centerpartiet'.freeze
    FI_PARTY = 'Feministiskt initiativ'.freeze
    KD_PARTY = 'Kristdemokraterna'.freeze
    L_PARTY = 'Liberalerna'.freeze
    M_PARTY = 'Moderata samlingspartiet'.freeze
    MP_PARTY = 'Miljöpartiet de gröna'.freeze
    S_PARTY = 'Sveriges socialdemokratiska arbetareparti'.freeze
    SD_PARTY = 'Sverigedemokraterna'.freeze
    V_PARTY = 'Vänsterpartiet'.freeze

    COALITIONS = [[C_PARTY, KD_PARTY, L_PARTY, M_PARTY],
                  [C_PARTY, L_PARTY, M_PARTY],
                  [C_PARTY, L_PARTY, MP_PARTY, S_PARTY],
                  [C_PARTY, L_PARTY, MP_PARTY, S_PARTY, V_PARTY],
                  [C_PARTY, KD_PARTY, M_PARTY],
                  [C_PARTY, M_PARTY],
                  [C_PARTY, M_PARTY, S_PARTY],
                  [FI_PARTY, MP_PARTY, S_PARTY, V_PARTY],
                  [KD_PARTY, M_PARTY, SD_PARTY],
                  [MP_PARTY, S_PARTY],
                  [MP_PARTY, S_PARTY, V_PARTY],
                  [M_PARTY, SD_PARTY],
                  [M_PARTY, S_PARTY],
                  [S_PARTY, V_PARTY]].freeze

    NO_OF_SEATS = 349

    # Voter turnout on 14 September 2014
    # Source: Web page with the official results of the elections of 14
    # September 2014, downloaded on 11 June 2018,
    # https://sv.wikipedia.org/wiki/Riksdagsvalet_i_Sverige_2014#Valresultat_partir%C3%B6ster
    POPULATION_SIZE = 6_231_573

    THRESHOLD = 0.04

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(
          NO_OF_SEATS, SainteLague12Denominators, THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
