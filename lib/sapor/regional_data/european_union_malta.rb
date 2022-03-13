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
  # The regional data for the European Union: Malta.
  #
  class EuropeanUnionMalta < Area
    include Singleton

    def area_code
      'EU[MT]'
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

    COALITIONS = [['Alternattiva Demokratika (Greens/EFA)', 'Alternattiva Demokratika–Partit Demokratiku (Greens/EFA)'],
                  ['Moviment Patrijotti Maltin (ID)'],
                  ['Partit Demokratiku (RE)'],
                  ['Partit Laburista (S&D)'],
                  ['Partit Nazzjonalista (EPP)']].freeze

    NO_OF_SEATS = 6

    # Voter turnout on 25 May 2019
    # Source: Web page with the official results of the elections of 25 May
    # 2019, downloaded on 25 September 2019,
    # https://en.wikipedia.org/wiki/2019_European_Parliament_election_in_Malta
    POPULATION_SIZE = 260_160

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(NO_OF_SEATS, \
                                                           DhondtDenominators)
      end
      @electoral_system
    end
  end
end
