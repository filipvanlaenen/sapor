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
  # The regional data for the European Union: Czech Republic.
  #
  class EuropeanUnionCzechRepublic < Area
    include Singleton

    def area_code
      'EU[CZ]'
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

    COALITIONS = [['ANO 2011 (RE)'],
                  ['Česká pirátská strana (Greens/EFA)',
                   'Strana zelených (Greens/EFA)'],
                  ['Česká strana sociálně demokratická (S&D)'],
                  ['Komunistická strana Čech a Moravy (GUE/NGL)'],
                  ['Křesťanská a demokratická unie–Československá strana' \
                     ' lidová (EPP)',
                   'Starostové a nezávislí (EPP)',
                   'TOP 09 (EPP)'],
                  ['Občanská demokratická strana (ECR)'],
                  ['Svoboda a přímá demokracie (ID)'],
                  ['Strana svobodných občanů (NI)'],
                  ['Trikolóra hnutí občanů (*)']].freeze

    NO_OF_SEATS = 21

    # Voter turnout on 24 and 25 May 2019
    # Source: Web page with the official results of the elections of 24 and 25
    # May 2019, downloaded on 15 June 2019,
    # https://en.wikipedia.org/wiki/2019_European_Parliament_election_in_the_Czech_Republic#Results
    POPULATION_SIZE = 1_007_398

    THRESHOLD = 0.05

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(NO_OF_SEATS,
                                                           DhondtDenominators,
                                                           THRESHOLD)
      end
      @electoral_system
    end
  end
end
