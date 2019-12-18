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
  # The regional data for the European Union: Luxembourg.
  #
  class EuropeanUnionLuxembourg < Area
    include Singleton

    def area_code
      'EU[LU]'
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

    COALITIONS = [['Alternativ Demokratesch Reformpartei (ECR)'],
                  ['Chrëschtlech-Sozial Vollekspartei (EPP)'],
                  ['déi gréng (Greens/EFA)',
                   'Piratepartei Lëtzebuerg (Greens/EFA)'],
                  ['Déi Lénk (GUE/NGL)'],
                  ['Demokratesch Partei (RE)'],
                  ['Kommunistesch Partei Lëtzebuerg (*)',
                   'Partei fir Integral Demokratie (*)'],
                  ['Lëtzebuerger Sozialistesch Aarbechterpartei (S&D)']].freeze

    NO_OF_SEATS = 6

    # Voter turnout on 26 May 2019
    # Source: Web page with the official results of the elections of 26 May
    # 2019, downloaded on 18 December 2019,
    # https://lb.wikipedia.org/wiki/Wale_fir_d%27Europ%C3%A4escht_Parlament_2019_(L%C3%ABtzebuerg)
    POPULATION_SIZE = 1_254_363

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(NO_OF_SEATS, \
                                                           DhondtDenominators)
      end
      @electoral_system
    end
  end
end
