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
  # The regional data for the European Union: Ireland.
  #
  class EuropeanUnionIreland < Area
    include Singleton

    def area_code
      'EU[IE]'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      SEAT_DISTRIBUTION.values.inject(:+)
    end

    def population_size
      POPULATION_SIZE
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    private

    COALITIONS = [['Catholic Democrats (*)', 'Direct Democracy Ireland (*)',
                   'Fís Nua (*)', 'Independent Alliance (*)',
                   'Renua Ireland (*)', 'Social Democrats (*)'],
                  ['Fianna Fáil (ALDE)'],
                  ['Fine Gael (EPP)'],
                  ['Green Party (Greens/EFA)'],
                  ['Independents (GUE/NGL)',
                   'Solidarity–People Before Profit (GUE/NGL)',
                   'Sinn Féin (GUE/NGL)', 'Socialist Party (GUE/NGL)'],
                  ['Labour Party (S&D)']].freeze

    # Voter turnout on 25 May 2014
    # Source: Web page with the official results of the elections of 25 May
    # 2014, downloaded on 7 July 2018,
    # https://en.wikipedia.org/wiki/European_Parliament_election,_2014_(Ireland)
    POPULATION_SIZE = 1_656_518

    SEAT_DISTRIBUTION = { 'Dublin' => 3, 'Midlands–North-West' => 4,
                          'South' => 4 }

    def election_results_of_2014
      if @election_results_of_2014.nil?
        @election_results_of_2014 = load_election_results( \
          'european-union-ireland-2014.psv')
      end
      @election_results_of_2014
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2014,
          election_results_of_2014,
          SEAT_DISTRIBUTION,
          DhondtDenominators)
      end
      @electoral_system
    end

    def overall_election_results_of_2014
      if @overall_election_results_of_2014.nil?
        @overall_election_results_of_2014 = \
          summarize_election_results(election_results_of_2014)
      end
      @overall_election_results_of_2014
    end
  end
end
