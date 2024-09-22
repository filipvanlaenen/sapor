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
  # The regional data for the European Union: the Flemish part.
  #
  class EuropeanUnionFlanders < Area
    include Singleton

    def area_code
      'EU[BE-VLG]'
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

    COALITIONS = [['Partij van de Arbeid van België (GUE/NGL)'],
                  ['Groen (Greens/EFA)', 'Piratenpartij (Greens/EFA)'],
                  ['Vooruit (S&D)'],
                  ['Open Vlaamse Liberalen en Democraten (RE)'],
                  ['Christen-Democratisch en Vlaams (EPP)'],
                  ['Lijst Dedecker (ECR)', 'Nieuw-Vlaamse Alliantie (ECR)'],
                  ['Vlaams Belang (PfE)']].freeze

    NO_OF_SEATS = 13

    # Voter turnout on 9 June 2024
    # https://nl.wikipedia.org/wiki/Europese_Parlementsverkiezingen_2014_in_Belgi%C3%AB
    POPULATION_SIZE = 4_508_780

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(no_of_seats, \
                                                           DhondtDenominators)
      end
      @electoral_system
    end
  end
end
