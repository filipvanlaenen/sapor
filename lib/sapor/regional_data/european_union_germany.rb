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

    COALITIONS = [['Alternative für Deutschland (ID)'],
                  ['AUF (ECR)', 'Partei Bibeltreuer Christen (ECR)'],
                  ['Bayernpartei (Greens/EFA)',
                   'Bündnis 90/Die Grünen (Greens/EFA)',
                   'Ökologisch-Demokratische Partei (Greens/EFA)',
                   'Piratenpartei Deutschland (Greens/EFA)',
                   'Volt Europa (Greens/EFA)'],
                  ['Basisdemokratische Partei Deutschland (*)', 'Bündnis Sahra Wagenknecht (*)',
                   'Bürgerbewegung pro NRW (*)', 'BüSo (*)', 'Christliche Mitte (*)', 'Die Republikaner (*)',
                   'MLPD (*)', 'NPD (*)', 'Sozialistische Gleichheitspartei (*)', 'Volksabstimmung (*)'],
                  ['Christlich Demokratische Union Deutschlands (EPP)',
                   'Christlich-Soziale Union in Bayern (EPP)', 'Familienpartei Deutschlands (EPP)'],
                  ['Die Linke (GUE/NGL)', 'DKP (GUE/NGL)',
                   'Partei Mensch Umwelt Tierschutz (GUE/NGL)'],
                  ['Die PARTEI (NI)'],
                  ['Freie Demokratische Partei (RE)', 'Freie Wähler (RE)'],
                  ['Sozialdemokratische Partei Deutschlands (S&D)']].freeze

    NO_OF_SEATS = 96

    # Voter turnout on 26 May 2019
    # Source: Wikipedia page with the results of the elections of 26 May 2019,
    # downloaded on 9 June 2019,
    # https://en.wikipedia.org/wiki/2019_European_Parliament_election_in_Germany
    POPULATION_SIZE = 37_389_231

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
