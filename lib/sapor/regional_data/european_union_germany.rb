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
  # The regional data for the European Union: Germany.
  #
  class EuropeanUnionGermany < Area
    include Singleton

    def area_code
      'EU[DE]'
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

    COALITIONS = [['Alternative für Deutschland (EFDD)'],
                  ['AUF (ECR)', 'Familien-Partei Deutschlands (ECR)',
                   'Partei Bibeltreuer Christen (ECR)'],
                  ['Bayernpartei (Greens/EFA)',
                   'BÜNDNIS 90/DIE GRÜNEN (Greens/EFA)', 'ÖDP (Greens/EFA)',
                   'PIRATEN (Greens/EFA)'],
                  ['Bürgerbewegung pro NRW (—)', 'BüSo (—)',
                   'Christliche Mitte (—)', 'Die PARTEI (—)',
                   'Die Republikaner (—)', 'MLPD (—)', 'NPD (—)',
                   'Sozialistische Gleichheitspartei (—)',
                   'Volksabstimmung (—)'],
                  ['CDU (EPP)', 'CSU (EPP)'],
                  ['DIE LINKE (GUE/NGL)', 'DKP (GUE/NGL)',
                   'Partei Mensch Umwelt Tierschutz (GUE/NGL)'],
                  ['FDP (ALDE)', 'FREIE WÄHLER (ALDE)'],
                  ['SPD (S&D)']].freeze

    NO_OF_SEATS = 96

    # Voter turnout on 25 May 2014
    # Source: Wikipedia page with the results of the elections of 25 May 2014,
    # downloaded on 2 February 2018,
    # https://en.wikipedia.org/wiki/European_Parliament_election,_2014_(Germany)
    POPULATION_SIZE = 29_340_700

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(
          NO_OF_SEATS, SainteLagueDenominators
        )
      end
      @electoral_system
    end
  end
end
