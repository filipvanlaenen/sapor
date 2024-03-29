# frozen_string_literal: true

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
  # The regional data for Bulgaria.
  #
  class Bulgaria < Area
    include Singleton
    def area_code
      'BG'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      NO_OF_SEATS
    end

    def population_size
      # Voter turnout on 11 July 2021
      2_766_853
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    BSP_PARTY = 'БСП за България'
    DPS_PARTY = 'Движение за права и свободи'
    GERB_PARTY = 'Граждани за европейско развитие на България'
    ISB_PARTY = 'Изправи се БГ! Ние идваме!'
    ITN_PARTY = 'Има такъв народ'
    
    COALITIONS = [[BSP_PARTY, DPS_PARTY],
                  [BSP_PARTY, DPS_PARTY, ISB_PARTY],
                  [BSP_PARTY, DPS_PARTY, ISB_PARTY, ITN_PARTY],
                  [BSP_PARTY, DPS_PARTY, ITN_PARTY]].freeze

    NO_OF_SEATS = 240

    THRESHOLD = 0.04

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = LargestRemainder.new(no_of_seats, HareQuota,
                                                 THRESHOLD, false, 0, false)
      end
      @electoral_system
    end
  end
end
