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
  # The regional data for the European Union: Italy.
  #
  class EuropeanUnionItaly < Area
    include Singleton

    def area_code
      'EU[IT]'
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
      seats = electoral_system.project(simulation)
      if seats['Forza Italia (EPP)'] > 0
		seats['Südtiroler Volkspartei (EPP)'] = NO_OF_SVP_SEATS
		seats['Forza Italia (EPP)'] -= NO_OF_SVP_SEATS
	  end
      seats
    end

    private

    COALITIONS = [['Articolo Uno (S&D)', 'Liberi e Uguali (S&D)',
                   'Partito Democratico (S&D)'],
                  ['Cambiamo! (ECR)', 'Coraggio Italia (ECR)',
                   'Fratelli d’Italia (ECR)', 'Noi con l’Italia (ECR)'],
                  ['CasaPound Italia (NI)', 'Democrazia Sovrana e Popolare (NI)', 'Impegno Civico (NI)',
                   'Insieme per il Futuro (NI)', 'Italia Sovrana e Popolare (NI)', 'Movimento 5 Stelle (NI)'],
                  ['Azione (RE)', 'Azione–Italia Viva (RE)', 'Civica Popolare (RE)', 'Italia Viva (RE)',
                   'Più Europa (RE)', 'Più Europa–Azione (RE)'],
                  ['Alleanza Verdi e Sinistra (Greens/EFA)', 'Europa Verde (Greens/EFA)'],
                  ['Forza Italia (EPP)', 'Noi Moderati (EPP)', 'Südtiroler Volkspartei (EPP)'],
                  ['Insieme (*)', 'Italexit–Per l’Italia con Paragone (*)', 'Partito Progressista (*)'],
                  ['Lega Nord (ID)'],
                  ['Potere al Popolo (GUE/NGL)', 'Sinistra Italiana (GUE/NGL)', 'Unione Popolare (GUE/NGL)']].freeze

    NO_OF_SEATS = 76

    NO_OF_SVP_SEATS = 1

    # Voter turnout on 26 May 2019
    # Source: Web page with the official results of the elections of 26 May
    # 2019, downloaded on 12 June 2019,
    # https://en.wikipedia.org/wiki/2019_European_Parliament_election_in_Italy
    POPULATION_SIZE = 26_783_732

    THRESHOLD = 0.04

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = LargestRemainder.new(NO_OF_SEATS, HareQuota,
                                                 THRESHOLD)
      end
      @electoral_system
    end
  end
end
