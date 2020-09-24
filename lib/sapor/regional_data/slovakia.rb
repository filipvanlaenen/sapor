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
  # The regional data for Slovakia.
  #
  class Slovakia < Area
    include Singleton

    def area_code
      'SK'
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
      PARTY_LIST_THRESHOLD
    end

    private

    HLAS_SD_PARTY = 'HLAS–sociálna demokracia'.freeze
    KDH_PARTY = 'Kresťanskodemokratické hnutie'.freeze
    LSNS_PARTY = 'Kotleba–Ľudová strana Naše Slovensko'.freeze
    MH_PARTY = 'MOST–HÍD'.freeze
    OLANO_PARTY = 'OBYČAJNÍ ĽUDIA a nezávislé osobnosti'.freeze
    PS_SPOLU_PARTY = 'Progresívne Slovensko–SPOLU–Občianska Demokracia'.freeze
    SAS_PARTY = 'Sloboda a Solidarita'.freeze
    SMER_SD_PARTY = 'SMER–sociálna demokracia'.freeze
    SMK_MKP_PARTY = 'Strana maďarskej koalície–Magyar Koalíció Pártja'.freeze
    SNS_PARTY = 'Slovenská národná strana'.freeze
    SR_PARTY = 'SME RODINA'.freeze
    ZL_PARTY = 'Za ľudí'.freeze

    COALITIONS = [[HLAS_SD_PARTY, LSNS_PARTY, SMER_SD_PARTY, SNS_PARTY,
                   SR_PARTY],
                  [HLAS_SD_PARTY, LSNS_PARTY, SNS_PARTY, SR_PARTY],
                  [HLAS_SD_PARTY, MH_PARTY, SMER_SD_PARTY, SNS_PARTY],
                  [HLAS_SD_PARTY, MH_PARTY, SNS_PARTY],
                  [HLAS_SD_PARTY, SMER_SD_PARTY, SNS_PARTY],
                  [HLAS_SD_PARTY, SMER_SD_PARTY, SNS_PARTY, SR_PARTY],
                  [HLAS_SD_PARTY, SMER_SD_PARTY, SR_PARTY],
                  [HLAS_SD_PARTY, SNS_PARTY],
                  [HLAS_SD_PARTY, SNS_PARTY, SR_PARTY],
                  [HLAS_SD_PARTY, SR_PARTY],
                  [KDH_PARTY, OLANO_PARTY, PS_SPOLU_PARTY, SAS_PARTY, SR_PARTY,
                   ZL_PARTY],
                  [KDH_PARTY, MH_PARTY, OLANO_PARTY, PS_SPOLU_PARTY, SAS_PARTY,
                   SMK_MKP_PARTY, SR_PARTY, ZL_PARTY],
                  [KDH_PARTY, MH_PARTY, OLANO_PARTY, PS_SPOLU_PARTY, SAS_PARTY,
                   SMK_MKP_PARTY, ZL_PARTY],
                  [KDH_PARTY, MH_PARTY, OLANO_PARTY, PS_SPOLU_PARTY, SAS_PARTY,
                   SR_PARTY, ZL_PARTY],
                  [KDH_PARTY, MH_PARTY, OLANO_PARTY, PS_SPOLU_PARTY, SAS_PARTY,
                   ZL_PARTY],
                  [KDH_PARTY, OLANO_PARTY, PS_SPOLU_PARTY, SAS_PARTY,
                   SMK_MKP_PARTY, SR_PARTY, ZL_PARTY],
                  [KDH_PARTY, OLANO_PARTY, PS_SPOLU_PARTY, SAS_PARTY,
                   SMK_MKP_PARTY, ZL_PARTY],
                  [KDH_PARTY, OLANO_PARTY, PS_SPOLU_PARTY, SAS_PARTY, ZL_PARTY],
                  [KDH_PARTY, PS_SPOLU_PARTY, SAS_PARTY, ZL_PARTY],
                  [LSNS_PARTY, SMER_SD_PARTY, SNS_PARTY, SR_PARTY],
                  [MH_PARTY, SMER_SD_PARTY, SNS_PARTY],
                  [OLANO_PARTY, PS_SPOLU_PARTY, SAS_PARTY, ZL_PARTY],
                  [PS_SPOLU_PARTY, SAS_PARTY, ZL_PARTY],
                  [SMER_SD_PARTY],
                  [SMER_SD_PARTY, SNS_PARTY],
                  [SMER_SD_PARTY, SNS_PARTY, SR_PARTY],
                  [SMER_SD_PARTY, SR_PARTY]].freeze

    NO_OF_SEATS = 150

    # Voter turnout on 5 March 2016
    # Source: Web page with the official results of the elections of 5 March
    # 2916, downloaded on 12 october 2019,
    # https://en.wikipedia.org/wiki/2016_Slovak_parliamentary_election
    POPULATION_SIZE = 2_627_386

    PARTY_LIST_THRESHOLD = 0.05
    COALITION_LIST_THRESHOLD = 0.07
    COALITION_LISTS = [PS_SPOLU_PARTY].freeze

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = LargestRemainder.new(NO_OF_SEATS,
                                                 HagenbachBischoffQuota,
                                                 PARTY_LIST_THRESHOLD,
                                                 false, 0, false,
                                                 COALITION_LIST_THRESHOLD,
                                                 COALITION_LISTS)
      end
      @electoral_system
    end
  end
end
