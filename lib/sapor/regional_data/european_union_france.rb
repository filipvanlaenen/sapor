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

    COALITIONS = [['La France insoumise (GUE/NGL)', 'Lutte Ouvrière–Nouveau Parti anticapitaliste (GUE/NGL)',
                   'Nouveau Parti anticapitaliste (GUE/NGL)', 'Parti animaliste (GUE/NGL)',
                   'Parti communiste français (GUE/NGL)'],
                  ['Écologie au centre (Greens/EFA)', 'Les Écologistes – Europe Écologie Les Verts (Greens/EFA)'],
                  ['Génération·s, le mouvement (S&D)', 'Parti radical de gauche (S&D)',
                   'Parti radical de gauche–La Convention (S&D)', 'Parti socialiste–Place Publique (S&D)'],
                  ['Agir, la droite constructive–Union des démocrates et indépendants (RE)',
                   'Renaissance–Mouvement démocrate–Horizons (RE)'],
                  ['Les Républicains (EPP)'],
                  ['Debout la France (ECR)'],
                  ['Rassemblement national (PfE)'],
                  ['Reconquête (ESN)'],
                  ['Les Patriotes (NI)'],
                  ['Alliance Rurale (*)', 'La France humaniste (*)', 'L’Engagement (*)', 'Lutte Ouvrière (*)',
                   'Mouvement des gilets jaunes (*)', 'Résistons! (*)', 'Union populaire républicaine (*)',
                   'Walwari (*)']].freeze

    NO_OF_SEATS = 81

    # Voter turnout on 9 June 2024
    # https://en.wikipedia.org/wiki/2024_European_Parliament_election_in_France#Results
    POPULATION_SIZE = 24_655_839

    THRESHOLD = 0.05

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(no_of_seats, DhondtDenominators, THRESHOLD)
      end
      @electoral_system
    end
  end
end
