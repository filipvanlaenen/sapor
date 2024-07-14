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
  # The regional data for the European Union: Denmark.
  #
  class EuropeanUnionDenmark < Area
    include Singleton

    def area_code
      'EU[DK]'
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

    COALITIONS = [['Alternativet (Greens/EFA)',
                   'Socialistisk Folkeparti (Greens/EFA)'],
                  ['Borgerlisten (*)', 'Frie Grønne (*)', 'Stram Kurs (*)', 'Veganerpartiet (*)'],
                  ['Danmarksdemokraterne (ECR)'],
                  ['Dansk Folkeparti (ID)'],
                  ['Det Konservative Folkeparti (EPP)', 'Kristendemokraterne (EPP)', 'Liberal Alliance (EPP)'],
                  ['Enhedslisten–De Rød-Grønne (GUE/NGL)'],
                  ['Moderaterne (RE)', 'Radikale Venstre (RE)', 'Venstre (RE)'],
                  ['Nye Borgerlige (NI)'],
                  ['Socialdemokraterne (S&D)']].freeze

    NO_OF_SEATS = 15

    # Voter turnout on 9 June 2024
    # https://en.wikipedia.org/wiki/2024_European_Parliament_election_in_Denmark#Results
    POPULATION_SIZE = 2_447_587

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(no_of_seats, DhondtDenominators, 0, 0, false)
      end
      @electoral_system
    end
  end
end
