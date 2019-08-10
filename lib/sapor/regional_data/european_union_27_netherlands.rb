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
  # The regional data for the European Union (27): the Netherlands.
  #
  class EuropeanUnion27Netherlands < Area
    include Singleton

    def area_code
      'EU27[NL]'
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

    COALITIONS = [['50Plus (EPP)', 'Christen-Democratisch Appèl (EPP)',
                   'ChristenUnie (EPP)'],
                  ['Bij1 (*)', 'DENK (*)', 'Piratenpartij (*)'],
                  ['Democraten 66 (RE)',
                   'Volkspartij voor Vrijheid en Democratie (RE)'],
                  ['Staatkundig Gereformeerde Partij (ECR)',
                   'Forum voor Democratie (ECR)'],
                  ['GroenLinks (Greens/EFA)'],
                  ['Partij van de Arbeid (S&D)'],
                  ['Partij voor de Dieren (GUE/NGL)',
                   'Socialistische Partij (GUE/NGL)'],
                  ['Partij voor de Vrijheid (ID)']].freeze

    NO_OF_SEATS = 29

    # Voter turnout on 23 May 2019
    # Source: Web page with the official results of the elections of 23 May
    # 2019, downloaded on 13 June 2019,
    # https://en.wikipedia.org/wiki/2019_European_Parliament_election_in_the_Netherlands
    POPULATION_SIZE = 5_497_813

    THRESHOLD = 1 / NO_OF_SEATS.to_f

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
