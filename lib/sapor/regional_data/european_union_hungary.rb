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
  # The regional data for the European Union: Hungary.
  #
  class EuropeanUnionHungary < Area
    include Singleton

    def area_code
      'EU[HU]'
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

    COALITIONS = [['Demokratikus Koalíció (S&D)', 'Magyar Szocialista Párt (S&D)',
                   'Magyar Szocialista Párt–Párbeszéd (S&D)', 'Szocialisták és demokraták (S&D)',
                   'United Opposition (S&D)'],
                  ['Együtt (Greens/EFA)', 'Lehet Más a Politika (Greens/EFA)',
                   'Magyar Kétfarkú Kutya Párt (Greens/EFA)', 'Párbeszéd (Greens/EFA)'],
                  ['Fidesz–Kereszténydemokrata Néppárt (PfE)'],
                  ['Jobbik (NI)'],
                  ['Mi Hazánk Mozgalom (ESN)'],
                  ['HNEM (*)', 'Második Reformkor (*)', 'Nép Pártján (*)', 'SMS (*)'],
                  ['Mindenki Magyarországa Mozgalom (EPP)', 'Tisztelet és Szabadság (EPP)'],
                  ['MLP (RE)', 'Momentum Mozgalom (RE)']].freeze

    NO_OF_SEATS = 21

    # Voter turnout on 9 June 2024
    # https://en.wikipedia.org/wiki/2024_European_Parliament_election_in_Hungary#Results
    POPULATION_SIZE = 4_569_620

    THRESHOLD = 0.05

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(NO_OF_SEATS, DhondtDenominators, THRESHOLD, 0, false)
      end
      @electoral_system
    end
  end
end
