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
  # The regional data for Slovakia.
  #
  class Slovakia < Area
    include Singleton

    def area_code
      'SK'
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
      PARTY_LIST_THRESHOLD
    end

    private
    
    KDH_PARTY = 'Kresťanskodemokratické hnutie'.freeze
    MH_PARTY = 'MOST–HÍD'.freeze
    SMER_SD_PARTY = 'SMER–sociálna demokracia'.freeze
    SNS_PARTY = 'Slovenská národná strana'.freeze
    
    COALITIONS = [[MH_PARTY, SMER_SD_PARTY, SNS_PARTY],
                  [SMER_SD_PARTY]].freeze

    NO_OF_SEATS = 150

    # Voter turnout on 5 March 2016
    # Source: Web page with the official results of the elections of 5 March
    # 2916, downloaded on 12 october 2019,
    # https://en.wikipedia.org/wiki/2016_Slovak_parliamentary_election
    POPULATION_SIZE = 2_627_386

    PARTY_LIST_THRESHOLD = 0.05
    COALITION_LIST_THRESHOLD = 0.07

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = LargestRemainder.new(NO_OF_SEATS,
                                                 HagenbachBischoffQuota,
                                                 PARTY_LIST_THRESHOLD)
      end
      @electoral_system
    end
  end
end
