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

    COALITIONS = [['Centerpartiet (ALDE)', 'Liberalerna (ALDE)'],
                  ['Feministiskt initiativ (S&D)',
                   'Sveriges socialdemokratiska arbetareparti (S&D)'],
                  ['Kristdemokraterna (EPP)', 'Moderata samlingspartiet (EPP)'],
                  ['Miljöpartiet de gröna (Greens/EFA)'],
                  ['Sverigedemokraterna (ECR)'],
                  ['Vänsterpartiet (GUE/NGL)']].freeze

    NO_OF_SEATS = 20

    # Voter turnout on 25 May 2014
    # Source: Web page with the official results of the elections of 25 May
    # 2014, downloaded on 8 March 2018,
    # https://en.wikipedia.org/wiki/European_Parliament_election,_2014_(Sweden)
    POPULATION_SIZE = 3_758_951

    THRESHOLD = 0.04

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(
          NO_OF_SEATS, SainteLague14Denominators, THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
