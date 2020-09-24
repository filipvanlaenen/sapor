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
  # The regional data for the European Union: Slovakia.
  #
  class EuropeanUnionSlovakia < Area
    include Singleton

    def area_code
      'EU[SK]'
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
    
    COALITIONS = [['Dobrá voľba (*)', 'VLASŤ (*)'],
                  ['Kotleba–Ľudová strana Naše Slovensko (NI)'],
                  ['Kresťanskodemokratické hnutie (EPP)', 'MOST–HÍD (EPP)',
                   'OBYČAJNÍ ĽUDIA a nezávislé osobnosti (EPP)',
                   'Strana maďarskej koalície–Magyar Koalíció Pártja (EPP)',
                   'Za ľudí (EPP)'],
                  ['NOVA (ECR)', 'Sloboda a Solidarita (ECR)',
                   'Slovenská národná strana (ECR)'],
                  ['Progresívne Slovensko–SPOLU–Občianska Demokracia (RE)'],
                  ['SME RODINA (ID)'],
                  ['HLAS–sociálna demokracia (S&D)',
                   'SMER–sociálna demokracia (S&D)']].freeze

    NO_OF_SEATS = 14

    # Voter turnout on 25 May 2019
    # Source: Web page with the official results of the elections of 25 May
    # 2019, downloaded on 24 June 2019,
    # https://en.wikipedia.org/wiki/2019_European_Parliament_election_in_Slovakia
    POPULATION_SIZE = 1_007_398

    THRESHOLD = 0.05

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = LargestRemainder.new(NO_OF_SEATS,
                                                 HagenbachBischoffQuota,
                                                 THRESHOLD, false, 0, false)
      end
      @electoral_system
    end
  end
end
