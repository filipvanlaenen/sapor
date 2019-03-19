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
  # The regional data for the European Union: Northern Ireland.
  #
  class EuropeanUnionNorthernIreland < Area
    include Singleton

    def area_code
      'EU[GB-NIR]'
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

    COALITIONS = [['Alliance Party of Northern Ireland (ALDE)'],
                  ['Democratic Unionist Party (NI)'],
                  ['Green Party in Northern Ireland (Greens/EFA)'],
                  ['NI21 (*)', 'Traditional Unionist Voice (*)'],
                  ['Sinn Féin (GUE/NGL)'],
                  ['Social Democratic and Labour Party (S&D)'],
                  ['UK Independence Party (ENF)'],
                  ['Northern Ireland Conservatives (ECR)',
                   'Ulster Unionist Party (ECR)']].freeze

    NO_OF_SEATS = 3

    # Voter turnout on 25 May 2014
    # Source: Web page with the official results of the elections of 22 May
    # 2014, downloaded on 19 March 2019,
    # https://en.wikipedia.org/wiki/Northern_Ireland_(European_Parliament_constituency)#2014
    POPULATION_SIZE = 626_125

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(NO_OF_SEATS, \
                                                           DhondtDenominators)
      end
      @electoral_system
    end
  end
end
