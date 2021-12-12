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
  # The regional data for Latvia.
  #
  class Latvia < Area
    include Singleton
    def area_code
      'LV'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      SEAT_DISTRIBUTION.values.inject(:+)
    end

    def overall_election_results_of_2018
      if @overall_election_results_of_2018.nil?
        @overall_election_results_of_2018 = \
          summarize_election_results(election_results_of_2018)
      end
      @overall_election_results_of_2018
    end

    def population_size
      # Voter turnout on 6 October 2018
      839_000
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    AP_PARTY = 'Attīstībai/Par!'.freeze
    JKP_PARTY = 'Jaunā konservatīvā partija'.freeze
    JV_PARTY = 'Jaunā VIENOTĪBA'.freeze
    KPVLV_PARTY = 'Politiskā partija „KPV LV”'.freeze
    NA_PARTY = 'Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un ' \
               'Brīvībai/LNNK”'.freeze
    SDPS_PARTY = 'Sociāldemokrātiskā partija “Saskaņa”'.freeze
    ZZS_PARTY = 'Zaļo un Zemnieku savienība'.freeze

    COALITIONS = [[AP_PARTY, JKP_PARTY, JV_PARTY, KPVLV_PARTY],
                  [AP_PARTY, JKP_PARTY, JV_PARTY, KPVLV_PARTY, NA_PARTY],
                  [AP_PARTY, JKP_PARTY, JV_PARTY, NA_PARTY],
                  [AP_PARTY, JKP_PARTY, JV_PARTY, NA_PARTY, ZZS_PARTY],
                  [AP_PARTY, JKP_PARTY, KPVLV_PARTY, NA_PARTY],
                  [AP_PARTY, JKP_PARTY, NA_PARTY, ZZS_PARTY],
                  [AP_PARTY, JKP_PARTY, SDPS_PARTY],
                  [AP_PARTY, JV_PARTY, KPVLV_PARTY, NA_PARTY],
                  [AP_PARTY, JV_PARTY, NA_PARTY, ZZS_PARTY],
                  [AP_PARTY, NA_PARTY, ZZS_PARTY],
                  [AP_PARTY, SDPS_PARTY],
                  [JKP_PARTY, JV_PARTY, KPVLV_PARTY, NA_PARTY],
                  [JKP_PARTY, JV_PARTY, NA_PARTY, ZZS_PARTY],
                  [JKP_PARTY, NA_PARTY, ZZS_PARTY],
                  [KPVLV_PARTY, SDPS_PARTY],
                  [KPVLV_PARTY, SDPS_PARTY, ZZS_PARTY],
                  [NA_PARTY, JV_PARTY, ZZS_PARTY]].freeze

    SEAT_DISTRIBUTION = { 'Kurzeme' => 12, 'Latgale' => 14, 'Rīga' => 35,
                          'Vidzeme' => 25, 'Zemgale' => 14 }.freeze

    THRESHOLD = 0.05

    def election_results_of_2018
      if @election_results_of_2018.nil?
        @election_results_of_2018 = load_election_results(
          'latvia-20181006.psv'
        )
      end
      @election_results_of_2018
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2018, election_results_of_2018,
          SEAT_DISTRIBUTION, SainteLagueDenominators, 0, THRESHOLD
        )
      end
      @electoral_system
    end
  end

  # Extension of Latvia with LPV and LuK
  class LatviaWithLpvAndLuk < Latvia
    def area_code
      'LV∪{LPV,LuK}'
    end

    def election_results_of_2018
      if @election_results_of_2018.nil?
        @election_results_of_2018 = load_election_results(
          'latvia-20181006-with-lpv-and-luk.psv'
        )
      end
      @election_results_of_2018
    end
  end

  # Extension of Latvia with LPV, LuK and R
  class LatviaWithLpvLukAndR < Latvia
    def area_code
      'LV∪{LPV,LuK,R}'
    end

    def election_results_of_2018
      if @election_results_of_2018.nil?
        @election_results_of_2018 = load_election_results(
          'latvia-20181006-with-lpv-luk-and-r.psv'
        )
      end
      @election_results_of_2018
    end
  end

  # Extension of Latvia with LuK
  class LatviaWithLuk < Latvia
    def area_code
      'LV∪{LuK}'
    end

    def election_results_of_2018
      if @election_results_of_2018.nil?
        @election_results_of_2018 = load_election_results(
          'latvia-20181006-with-luk.psv'
        )
      end
      @election_results_of_2018
    end
  end
end
