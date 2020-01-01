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
  # The regional data for Austria.
  #
  class Austria < Area
    include Singleton

    def area_code
      'AT'
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

    FPO_PARTY = 'Freiheitliche Partei Österreichs'.freeze
    GRUENE_PARTY = 'Die Grünen–Die Grüne Alternative'.freeze
    NEOS_PARTY = 'NEOS–Das Neue Österreich und Liberales Forum'.freeze
    OVP_PARTY = 'Österreichische Volkspartei'.freeze
    SPO_PARTY = 'Sozialdemokratische Partei Österreichs'.freeze

    COALITIONS = [[FPO_PARTY, OVP_PARTY],
                  [FPO_PARTY, SPO_PARTY],
                  [GRUENE_PARTY, NEOS_PARTY, OVP_PARTY],
                  [GRUENE_PARTY, NEOS_PARTY, SPO_PARTY],
                  [GRUENE_PARTY, OVP_PARTY],
                  [GRUENE_PARTY, SPO_PARTY],
                  [NEOS_PARTY, OVP_PARTY],
                  [OVP_PARTY],
                  [OVP_PARTY, SPO_PARTY],
                  [SPO_PARTY]].freeze

    NO_OF_SEATS = 183

    # Voter turnout on 15 October 2017
    # Source: Web page with the official results of the elections of 15 October
    # 2017, downloaded on 29 May 2019,
    # https://en.wikipedia.org/wiki/2017_Austrian_legislative_election
    POPULATION_SIZE = 5_069_929

    THRESHOLD = 0.04

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(
          NO_OF_SEATS, DhondtDenominators, THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
