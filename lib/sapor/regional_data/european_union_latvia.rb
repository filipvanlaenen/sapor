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

    COALITIONS = [['Jaunā Saskaņa (GUE/NGL)'],
                  ['PROGRESĪVIE (Greens/EFA)'],
                  ['Sociāldemokrātiskā partija “Saskaņa” (S&D)'],
                  ['Attīstībai/Par! (RE)', 'Kustība Par! (RE)', 'Latvijas attīstībai (RE)',
                   'Zaļo un Zemnieku savienība (RE)'],
                  ['Jaunā VIENOTĪBA (EPP)', 'Jaunā konservatīvā partija (EPP)',
                   'Latvijas Reģionu Apvienība (EPP)', 'Politiskā partija „KPV LV” (EPP)'],
                  ['Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un Brīvībai/LNNK” (ECR)', 'Suverēnā vara (ECR)'],
                  ['Latvija pirmajā vietā (PfE)'],
                  ['Centra partija (NI)', 'Latvijas Krievu savienība (NI)', 'Stabilitātei! (NI)'],
                  ['Apvienība Jaunlatvieši (*)', 'Austošā Saule Latvijai (*)', 'Nacionālā Savienība Taisnīgums (*)',
                   'No sirds Latvijai (*)', 'Platforma 21 (*)', 'Politiskā kustība „Bez partijām“ (*)', 'Republika (*)',
                   'Vienoti Latvijai (*)']].freeze

    NO_OF_SEATS = 9

    # Voter turnout on 8 June 2024
    # https://en.wikipedia.org/wiki/2024_European_Parliament_election_in_Latvia#Results
    POPULATION_SIZE = 514_585

    THRESHOLD = 0.05

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(
          no_of_seats, SainteLagueDenominators, THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
