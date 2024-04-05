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
  # The regional data for the European Union: Poland.
  #
  class EuropeanUnionPoland < Area
    include Singleton

    def area_code
      'EU[PL]'
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

    COALITIONS = [['AGROunia (*)','Bezpartyjni Samorządowcy (*)', 'Centrum dla Polski (*)',
                   'Polska Jest Jedna (*)', 'Tak! Dla Polski (*)'],
                  ['Inicjatywa Polska (NI)', 'Konfederacja (NI)', 'KORWiN (NI)', 'Kukiz’15 (NI)', 'Lewica Razem (NI)', 
                   'Nowa Nadzieja (NI)'],
                  ['AGROunia–Porozumienie (EPP)', 'Koalicja Europejska (EPP)', 'Koalicja Obywatelska (EPP)',
                   'Koalicja Polska (EPP)', 'Platforma Obywatelska (EPP)', 'Polskie Stronnictwo Ludowe (EPP)',
                   'Porozumienie (EPP)'],
                  ['Konfederacja Korony Polskiej (ID)', 'Ruch Narodowy (ID)'],
                  ['Nowa Lewica (S&D)', 'Sojusz Lewicy Demokratycznej (S&D)', 'Wiosna (S&D)', 'Wiosna–Partia Razem (S&D)'],
                  ['.Nowoczesna (RE)', 'Polska 2050 (RE)', 'Trzecia Droga (RE)'],
                  ['Partia Zieloni (Greens/EFA)'],
                  ['Prawo i Sprawiedliwość (ECR)', 'Zjednoczona Prawica (ECR)']].freeze

    ELECTORAL_ALLIANCES = [['Platforma Obywatelska (EPP)', '.Nowoczesna (RE)', 'Inicjatywa Polska (NI)',
                            'Partia Zieloni (Greens/EFA)'],
                           ['Nowa Lewica (S&D)', 'Lewica Razem (NI)'],
                           ['Nowa Nadzieja (NI)', 'Konfederacja Korony Polskiej (ID)', 'Ruch Narodowy (ID)'],
                           ['Polska 2050 (RE)', 'Polskie Stronnictwo Ludowe (EPP)', 'Centrum dla Polski (*)']]

    NO_OF_SEATS = 53

    # Voter turnout on 26 May 2019
    # Source: Web page with the official results of the elections of 26 May
    # 2019, downloaded on 25 June 2019,
    # https://en.wikipedia.org/wiki/2019_European_Parliament_election_in_Poland
    POPULATION_SIZE = 13_647_311

    THRESHOLD = 0.05

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(no_of_seats, DhondtDenominators, THRESHOLD, 0, false, 1, [],
                                                           [], ELECTORAL_ALLIANCES)
      end
      @electoral_system
    end
  end
end
