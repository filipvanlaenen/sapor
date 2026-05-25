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
  # The regional data for the European Union: the Icelandic part.
  #
  class EuropeanUnionIceland < Area
    include Singleton

    def area_code
      'EU[IS]'
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

    COALITIONS = [['Vinstrihreyfingin – grænt framboð (GUE/NGL)'],
                  ['Píratar (Greens/EFA)'],
                  ['Flokkur fólksins (S&D)', 'Samfylkingin - jafnaðarflokkur Íslands (S&D)'],
                  ['Framsóknarflokkurinn (RE)', 'Viðreisn (RE)'],
                  ['Sjálfstæðisflokkurinn (EPP)'],
                  ['Miðflokkurinn (ECR)'],
                  ['Ábyrg framtíð (*)', 'Lýðræðisflokkurinn - samtök um sjálfsákvörðunarrétt (*)',
                   'Sósíalistaflokkur Íslands (*)']].freeze

    NO_OF_SEATS = 6

    # Voter turnout on 30 November 2024 (national election)
    # https://en.wikipedia.org/wiki/2024_Icelandic_parliamentary_election#Results
    POPULATION_SIZE = 212_470

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(no_of_seats, \
                                                           DhondtDenominators)
      end
      @electoral_system
    end
  end
end
