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

    COALITIONS = [['Gibanje Svoboda (*)', 'Dobra država (*)',
                   'Glas za otroke in družine (*)',
                   'Glas za otroke in družine–Nova ljudska stranka Slovenije (*)', 'Naša dežela (*)',
                   'Nova ljudska stranka Slovenije (*)',
                   'Pozitivna Slovenija (*)', 'Lista Roberta Goloba (*)', 'Zelena dejanja (*)'],
                  ['Demokratična stranka upokojencev Slovenije (RE)',
                   'Državljanska lista (RE)', 'Konkretno (RE)',
                   'Lista Marjana Šarca (RE)',
                   'Stranka Alenke Bratušek (RE)',
                   'Stranka modernega centra (RE)'],
                  ['Levica (GUE/NGL)'],
                  ['Nova Slovenija–Krščanski demokrati (EPP)', 'Povežimo Slovenijo (EPP)',
                   'Slovenska demokratska stranka (EPP)',
                   'Slovenska ljudska stranka (EPP)'],
                  ['Piratska stranka Slovenije (Greens/EFA)'],
                  ['Slovenska nacionalna stranka (NI)'],
                  ['Socialni demokrati (S&D)']].freeze

    NO_OF_SEATS = 8

    # Voter turnout on 26 May 2019
    # Source: Web page with the official results of the elections of 26 May
    # 2019, downloaded on 24 June 2019,
    # https://en.wikipedia.org/wiki/2019_European_Parliament_election_in_Slovenia#Results
    POPULATION_SIZE = 471_525

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
