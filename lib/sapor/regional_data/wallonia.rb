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
  # The regional data for Wallonia.
  #
  class Wallonia < Area
    include Singleton
    def area_code
      'BE-WAL'
    end

    def coalitions
      [%w(cdH Ecolo MR), %w(cdH Ecolo PS), %w(cdH MR), %w(cdH PS),
       %w(cdH PS PTB), %w(Ecolo MR), %w(Ecolo MR PS), %w(Ecolo PS),
       %w(Ecolo PS PTB), %w(Ecolo PTB), %w(MR PS), %w(PS PTB)]
    end

    def no_of_seats
      SEAT_DISTRIBUTION.values.inject(:+)
    end

    def overall_election_results_of_2014
      if @overall_election_results_of_2014.nil?
        @overall_election_results_of_2014 = \
          summarize_election_results(election_results_of_2014)
      end
      @overall_election_results_of_2014
    end

    def population_size
      # Voter turnout on 25 May 2014
      # Source: http://elections2014.belgium.be/fr/wal/results/results_tab_WLR00000.html
      # Retrieved on 21 July 2017
      2_047_387
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    # Source: https://nl.wikipedia.org/wiki/Waals_Parlement
    # Retrieved on 21 July 2017
    SEAT_DISTRIBUTION = { 'Brabant Wallon' => 8,
                          'Hainaut' => 28,
                          'Liège' => 23,
                          'Luxembourg' => 5,
                          'Namur' => 11 }.freeze

    THRESHOLD = 0.05

    def election_results_of_2014
      if @election_results_of_2014.nil?
        @election_results_of_2014 = load_election_results( \
          'wallonia-2014.psv'
        )
      end
      @election_results_of_2014
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2014,
          election_results_of_2014,
          SEAT_DISTRIBUTION,
          DhondtDenominators,
          THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
