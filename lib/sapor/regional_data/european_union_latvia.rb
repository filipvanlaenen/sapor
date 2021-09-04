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
  # The regional data for the European Union: Latvia.
  #
  class EuropeanUnionLatvia < Area
    include Singleton

    def area_code
      'EU[LV]'
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

    COALITIONS = [['Attīstībai/Par! (RE)'],
                  ['Jaunā Saskaņa (GUE/NGL)'],
                  ['Jaunā VIENOTĪBA (EPP)', 'Jaunā konservatīvā partija (EPP)',
                   'Politiskā partija „KPV LV” (EPP)',
                   'Zaļo un Zemnieku savienība (EPP)'],
                  ['Latvijas Krievu savienība (Greens/EFA)',
                   'PROGRESĪVIE (Greens/EFA)'],
                  ['Latvijas Reģionu Apvienība (ECR)',
                   'Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un ' \
                     'Brīvībai/LNNK” (ECR)'],
                  ['Latvija pirmajā vietā (*)', 'Likums un kārtība (*)',
                   'No sirds Latvijai (*)', 'Republika (*)',
                   'Vienoti Latvijai (*)'],
                  ['Sociāldemokrātiskā partija “Saskaņa” (S&D)']].freeze

    NO_OF_SEATS = 8

    # Voter turnout on 25 May 2019
    # Source: Web page with the official results of the elections of 25 May
    # 2019, downloaded on 13 June 2019,
    # https://es.wikipedia.org/wiki/Elecciones_al_Parlamento_Europeo_de_2019_(Letonia)
    POPULATION_SIZE = 470_460

    THRESHOLD = 0.05

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(
          NO_OF_SEATS, SainteLagueDenominators, THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
