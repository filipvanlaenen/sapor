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
  # The regional data for Sweden, using the electoral system used in the 2014
  # election.
  #
  class Sweden20140914 < Area
    include Singleton

    def area_code
      'SE@20140914'
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

    COALITIONS = [['Centerpartiet', 'Kristdemokraterna', 'Liberalerna',
                   'Moderata samlingspartiet'],
                  ['Centerpartiet', 'Liberalerna', 'Moderata samlingspartiet'],
                  ['Centerpartiet', 'Kristdemokraterna',
                   'Moderata samlingspartiet'],
                  ['Centerpartiet', 'Moderata samlingspartiet'],
                  ['Feministiskt initiativ', 'Miljöpartiet de gröna',
                   'Sveriges socialdemokratiska arbetareparti',
                   'Vänsterpartiet'],
                  ['Miljöpartiet de gröna',
                   'Sveriges socialdemokratiska arbetareparti'],
                  ['Miljöpartiet de gröna',
                   'Sveriges socialdemokratiska arbetareparti',
                   'Vänsterpartiet'],
                  ['Moderata samlingspartiet',
                   'Sverigedemokraterna'],
                  ['Moderata samlingspartiet',
                   'Sveriges socialdemokratiska arbetareparti'],
                  ['Sveriges socialdemokratiska arbetareparti',
                   'Vänsterpartiet']].freeze

    NO_OF_SEATS = 349

    # Voter turnout on 14 September 2014
    # Source: Web page with the official results of the elections of 14
    # September 2014, downloaded on 11 June 2018,
    # https://sv.wikipedia.org/wiki/Riksdagsvalet_i_Sverige_2014#Valresultat_partir%C3%B6ster
    POPULATION_SIZE = 6_231_573

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
