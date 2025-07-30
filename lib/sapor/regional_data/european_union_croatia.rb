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
  # The regional data for the European Union: Croatia.
  #
  class EuropeanUnionCroatia < Area
    include Singleton

    def area_code
      'EU[HR]'
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

    COALITIONS = [['Radnička fronta (GUE/NGL)'],
                  ['Možemo! (Greens/EFA)'],
                  ['Socijaldemokrati (S&D)', 'Socijaldemokratska partija Hrvatske (S&D)'],
                  ['Amsterdamska koalicija (RE)', 'Centar (RE)', 'Fokus na bitno (RE)',
                   'Hrvatska narodna stranka–liberalni demokrati (RE)', 'Hrvatska socijalno-liberalna stranka (RE)',
                   'Pametno (RE)'],
                  ['Hrvatska demokratska zajednica (EPP)'],
                  ['Dom i Nacionalno Okupljanje (ECR)', 'Domovinski pokret (ECR)',
                   'Hrvatska konzervativna stranka (ECR)', 'Hrvatski rast (ECR)', 'Hrvatski suverenisti (ECR)',
                   'Most nezavisnih lista (ECR)', 'NL Marija Selak Raspudić (ECR)'],
                  ['Neovisni za Hrvatsku (PfE)'],
                  ['Ključ Hrvatske (NI)', 'Nezavisna lista Mislava Kolakušića (NI)', 'Pravo i Pravda (NI)',
                   'Živi zid (NI)'],
                  ['Akcija za promjene (*)', 'Bandić Milan 365–Stranka rada i solidarnosti (*)',
                   'Hrvatska seljačka stranka (*)', 'Hrvatska stranka umirovljenika (*)',
                   'Nezavisna Platforma Sjever (*)', 'Odlučnost i Pravednost (*)',
                   'Stranka antikorupcije, razvoja i transparentnosti (*)']].freeze

    NO_OF_SEATS = 12

    # Voter turnout on 9 June 2024
    # https://en.wikipedia.org/wiki/2024_European_Parliament_election_in_Croatia#Results
    POPULATION_SIZE = 752_661

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
