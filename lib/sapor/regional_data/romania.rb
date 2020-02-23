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
  # The regional data for Romania.
  #
  class Romania < Area
    include Singleton

    def area_code
      'RO'
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

    A2020_COALITION = 'Alianța 2020 USR-PLUS'.freeze
    ALDE_PARTY = 'Alianța Liberalilor și Democraților'.freeze
    # PLUS_PARTY = 'Partidul Libertății, Unității și Solidarității'.freeze
    PMP_PARTY = 'Partidul Mișcarea Populară'.freeze
    PNL_PARTY = 'Partidul Național Liberal'.freeze
    PRO_PARTY = 'PRO România'.freeze
    PSD_PARTY = 'Partidul Social Democrat'.freeze
    UDMR_PARTY = 'Uniunea Democrată Maghiară din România'.freeze
    # USR_PARTY = 'Uniunea Salvați România'.freeze

    COALITIONS = [[A2020_COALITION, ALDE_PARTY, PMP_PARTY, PNL_PARTY],
                  [A2020_COALITION, ALDE_PARTY, PMP_PARTY, PNL_PARTY,
                   UDMR_PARTY],
                  [A2020_COALITION, ALDE_PARTY, PNL_PARTY],
                  [A2020_COALITION, ALDE_PARTY, PNL_PARTY, UDMR_PARTY],
                  [A2020_COALITION, PMP_PARTY],
                  [A2020_COALITION, PMP_PARTY, PNL_PARTY],
                  [A2020_COALITION, PMP_PARTY, PNL_PARTY, UDMR_PARTY],
                  [A2020_COALITION, PNL_PARTY],
                  [A2020_COALITION, PNL_PARTY, UDMR_PARTY],
                  [ALDE_PARTY, PMP_PARTY, PNL_PARTY, UDMR_PARTY],
                  [ALDE_PARTY, PNL_PARTY, UDMR_PARTY],
                  [ALDE_PARTY, PRO_PARTY, PSD_PARTY],
                  [ALDE_PARTY, PSD_PARTY],
                  [PMP_PARTY, PNL_PARTY],
                  [PMP_PARTY, PNL_PARTY, UDMR_PARTY],
                  [PNL_PARTY, UDMR_PARTY],
                  # [ALDE_PARTY, PLUS_PARTY, PMP_PARTY, PNL_PARTY, UDMR_PARTY,
                  #  USR_PARTY],
                  [PNL_PARTY],
                  [PRO_PARTY, PSD_PARTY]].freeze

    NO_OF_SEATS = 312

    # Voter turnout on 11 December 2016
    # Source: Web page with the official results of the elections of 11 December
    # 2016, downloaded on 22 February 2020,
    # https://en.wikipedia.org/wiki/2016_Romanian_legislative_election
    POPULATION_SIZE = 7_047_384

    THRESHOLD = 0.05
    COALITION_LIST_THRESHOLD = 0.08
    COALITION_LISTS = [A2020_COALITION].freeze
    MINORITY_LISTS = [UDMR_PARTY].freeze

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(
          NO_OF_SEATS, DhondtDenominators, THRESHOLD, 0,
          COALITION_LIST_THRESHOLD, COALITION_LISTS, MINORITY_LISTS
        )
      end
      @electoral_system
    end
  end
end
