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
      seats = electoral_system.project(simulation)
      if seats.include?(PS_SPOLU_ALLIANCE)
        if seats[PS_SPOLU_ALLIANCE] == 0
          seats[PS_PARTY] = 0
          seats[SPOLU_PARTY] = 0
        elsif seats[PS_SPOLU_ALLIANCE] == 1
          seats[PS_PARTY] = 1
          seats[SPOLU_PARTY] = 0
        else
          seats[PS_PARTY] = seats[PS_SPOLU_ALLIANCE] - 1
          seats[SPOLU_PARTY] = 1
        end
        seats.delete(PS_SPOLU_ALLIANCE)
      end
      seats
    end

    private

    PS_PARTY = 'Progresívne Slovensko (ALDE)'.freeze
    SPOLU_PARTY = 'SPOLU–Občianska Demokracia (EPP)'.freeze
    PS_SPOLU_ALLIANCE = PS_PARTY + '–' + SPOLU_PARTY

    COALITIONS = [['Kotleba–Ľudová strana Naše Slovensko (NI)'],
                  ['Kresťanskodemokratické hnutie (EPP)', 'MOST–HÍD (EPP)',
                   SPOLU_PARTY,
                   'Strana maďarskej koalície–Magyar Koalíció Pártja (EPP)'],
                  ['NOVA (ECR)', 'OBYČAJNÍ ĽUDIA a nezávislé osobnosti (ECR)',
                   'Sloboda a Solidarita (ECR)'],
                  [PS_PARTY],
                  ['Slovenská národná strana (ENF)', 'SME RODINA (ENF)'],
                  ['SMER–sociálna demokracia (S&D)']].freeze

    NO_OF_SEATS = 13

    # Voter turnout on 24 May 2014
    # Source: Web page with the official results of the elections of 24 May
    # 2014, downloaded on 9 March 2018,
    # https://en.wikipedia.org/wiki/European_Parliament_election,_2014_(Slovakia)
    POPULATION_SIZE = 560_603

    THRESHOLD = 0.05

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = LargestRemainder.new(NO_OF_SEATS,
                                                 HagenbachBischoffQuota,
                                                 THRESHOLD)
      end
      @electoral_system
    end
  end
end
