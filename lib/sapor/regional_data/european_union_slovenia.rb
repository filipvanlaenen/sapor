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
  # The regional data for the European Union: Slovenia.
  #
  class EuropeanUnionSlovenia < Area
    include Singleton

    def area_code
      'EU[SI]'
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

    COALITIONS = [['Levica (GUE/NGL)'],
                  ['Piratska stranka Slovenije (Greens/EFA)', 'VESNA–Zelena stranka (Greens/EFA)'],
                  ['Socialni demokrati (S&D)'],
                  ['Demokratična stranka upokojencev Slovenije (RE)', 'Državljanska lista (RE)',
                   'Gibanje Svoboda (RE)', 'Konkretno (RE)',
                   'Lista Marjana Šarca (RE)', 'Stranka Alenke Bratušek (RE)', 'Stranka modernega centra (RE)'],
                  ['Demokrati (EPP)', 'Nova Slovenija–Krščanski demokrati (EPP)', 'Povežimo Slovenijo (EPP)',
                   'Slovenska demokratska stranka (EPP)', 'Slovenska ljudska stranka (EPP)'],
                  ['Slovenska nacionalna stranka (PfE)'],
                  ['Resni.ca (NI)'],
                  ['Dobra država (*)', 'Glas za otroke in družine (*)',
                   'Glas za otroke in družine–Nova ljudska stranka Slovenije (*)', 'Liberalni demokrati (*)',
                   'Lista Roberta Goloba (*)', 'Naša dežela (*)', 'Naša prihodnost (*)',
                   'Nova ljudska stranka Slovenije (*)', 'Pozitivna Slovenija (*)', 'Zeleni Slovenije (*)']].freeze

    NO_OF_SEATS = 9

    # Voter turnout on 9 June 2024
    # https://en.wikipedia.org/wiki/2024_European_Parliament_election_in_Slovenia
    POPULATION_SIZE = 674_111

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(no_of_seats,
                                                           DhondtDenominators)
      end
      @electoral_system
    end
  end
end
