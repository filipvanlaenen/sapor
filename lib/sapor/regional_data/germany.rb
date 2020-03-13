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
  # The regional data for Germany.
  #
  class Germany < Area
    include Singleton

    def area_code
      'DE'
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

    def threshold
      THRESHOLD
    end

    private

    AFD_PARTY = 'Alternative für Deutschland'.freeze
    CDU_PARTY = 'Christlich Demokratische Union Deutschlands'.freeze
    CSU_PARTY = 'Christlich-Soziale Union in Bayern'.freeze
    FDP_PARTY = 'Freie Demokratische Partei'.freeze
    GRUNEN_PARTY = 'Bündnis 90/Die Grünen'.freeze
    LINKEN_PARTY = 'Die Linke'.freeze
    SPD_PARTY = 'Sozialdemokratische Partei Deutschlands'.freeze

    COALITIONS = [[AFD_PARTY, CDU_PARTY, CSU_PARTY],
                  [AFD_PARTY, CDU_PARTY, CSU_PARTY, FDP_PARTY],
                  [CDU_PARTY, CSU_PARTY, FDP_PARTY],
                  [CDU_PARTY, CSU_PARTY, FDP_PARTY, GRUNEN_PARTY],
                  [CDU_PARTY, CSU_PARTY, FDP_PARTY, SPD_PARTY],
                  [CDU_PARTY, CSU_PARTY, GRUNEN_PARTY],
                  [CDU_PARTY, CSU_PARTY, GRUNEN_PARTY, SPD_PARTY],
                  [CDU_PARTY, CSU_PARTY, SPD_PARTY],
                  [FDP_PARTY, GRUNEN_PARTY, SPD_PARTY],
                  [GRUNEN_PARTY, LINKEN_PARTY, SPD_PARTY],
                  [GRUNEN_PARTY, SPD_PARTY],
                  [LINKEN_PARTY, SPD_PARTY]].freeze

    NO_OF_SEATS = 709

    # Voter turnout on 24 September 2017
    # Source: Wikipedia page with the results of the elections of 24 September
    # 2017, downloaded on 13 March 2020,
    # https://en.wikipedia.org/wiki/2017_German_federal_election
    POPULATION_SIZE = 46_976_341

    THRESHOLD = 0.05

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(
          NO_OF_SEATS, SainteLagueDenominators, THRESHOLD, 0, false
        )
      end
      @electoral_system
    end
  end
end
