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
  # The regional data for the European Union: France.
  #
  class EuropeanUnionFrance < Area
    include Singleton

    def area_code
      'EU[FR]'
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

    COALITIONS = [['Agir, la droite constructive–Union des démocrates et' \
                   ' indépendants (RE)',
                   'La République en marche–Mouvement démocrate (RE)'],
                  ['Debout la France (ECR)'],
                  ['Europe Écologie Les Verts (Greens/EFA)'],
                  ['Rassemblement national (ID)'],
                  ['Génération·s, le mouvement (S&D)',
                   'Parti socialiste (S&D)'],
                  ['La France insoumise (GUE/NGL)',
                   'Nouveau Parti anticapitaliste (GUE/NGL)',
                   'Parti communiste français (GUE/NGL)'],
                  ['Les Républicains (EPP)'],
                  ['Les Patriotes (*)', 'Lutte Ouvrière (*)',
                   'Mouvement des gilets jaunes (*)', 'Résistons! (*)',
                   'Union populaire républicaine (*)']].freeze

    NO_OF_SEATS = 74

    # Voter turnout on 26 May 2019
    # Source: Web page with the official results of the elections of 25-26 May
    # 2019, downloaded on 30 December 2019,
    # https://en.wikipedia.org/wiki/2019_European_Parliament_election_in_France
    POPULATION_SIZE = 22_655_174

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
