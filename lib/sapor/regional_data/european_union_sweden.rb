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
  # The regional data for the European Union: Sweden.
  #
  class EuropeanUnionSweden < Area
    include Singleton

    def area_code
      'EU[SE]'
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

    COALITIONS = [['Centerpartiet (RE)', 'Liberalerna (RE)'],
                  ['Feministiskt initiativ (S&D)',
                   'Sveriges socialdemokratiska arbetareparti (S&D)'],
                  ['Kristdemokraterna (EPP)', 'Moderata samlingspartiet (EPP)'],
                  ['Miljöpartiet de gröna (Greens/EFA)'],
                  ['Sverigedemokraterna (ECR)'],
                  ['Vänsterpartiet (GUE/NGL)']].freeze

    NO_OF_SEATS = 21

    # Voter turnout on 26 May 2019
    # Source: Web page with the official results of the elections of 26 May
    # 2019, downloaded on 15 June 2019,
    # https://de.wikipedia.org/wiki/Europawahl_in_Schweden_2019
    POPULATION_SIZE = 4_151_470

    THRESHOLD = 0.04

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(
          NO_OF_SEATS, SainteLague12Denominators, THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
