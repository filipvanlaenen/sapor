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
  # The regional data for the European Union: Great-Britain.
  #
  class EuropeanUnionGreatBritain < Area
    include Singleton

    def area_code
      'EU[GB-GBN]'
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

    def overall_election_results_of_2014
      if @overall_election_results_of_2014.nil?
        @overall_election_results_of_2014 = \
          summarize_election_results(election_results_of_2014)
      end
      @overall_election_results_of_2014
    end

    private

    COALITIONS = [['Conservative Party (ECR)'],
                  ['Green Party (Greens/EFA)',
                   'Plaid Cymru (Greens/EFA)',
                   'Scottish National Party (Greens/EFA)'],
                  ['Labour Party (S&D)'],
                  ['Liberal Democrats (ALDE)'],
                  ['UK Independence Party (ENF)']].freeze

    # Voter turnout on 22 May 2014
    # Source: Web page with the official results of the elections of 22 May
    # 2014, downloaded on 5 April 2019,
    # https://en.wikipedia.org/wiki/2014_European_Parliament_election_in_the_United_Kingdom
    POPULATION_SIZE = 15_828_825

    SEAT_DISTRIBUTION = { 'East Midlands' => 5, 'East of England' => 7,
                          'London' => 8, 'North East England' => 3,
                          'North West England' => 8, 'South East England' => 10,
                          'South West England' => 6, 'West Midlands' => 7,
                          'Yorkshire and the Humber' => 6, 'Scotland' => 6,
                          'Wales' => 4}

    def election_results_of_2014
      if @election_results_of_2014.nil?
        @election_results_of_2014 = load_election_results( \
          'european-union-great-britain-20140522.psv')
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
  end
end
