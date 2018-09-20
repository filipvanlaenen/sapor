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
  # The regional data for Luxembourg.
  #
  class Luxembourg < Area
    include Singleton
    def area_code
      'LU'
    end

    def coalitions
      [['Chrëschtlech-Sozial Vollekspartei'],
       ['Chrëschtlech-Sozial Vollekspartei',
        'Lëtzebuerger Sozialistesch Aarbechterpartei'],
       ['Chrëschtlech-Sozial Vollekspartei', 'Demokratesch Partei'],
       ['déi gréng', 'Demokratesch Partei',
        'Lëtzebuerger Sozialistesch Aarbechterpartei']]
    end

    def no_of_seats
      SEAT_DISTRIBUTION.values.inject(:+)
    end

    def overall_election_results_of_2013
      if @overall_election_results_of_2013.nil?
        @overall_election_results_of_2013 = \
          summarize_election_results(election_results_of_2013)
      end
      @overall_election_results_of_2013
    end

    def population_size
      # Voter turnout on 20 October 2013 (note: multiple votes per voter)
      3_276_692
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    private

    SEAT_DISTRIBUTION = { 'Centre' => 21, 'Est' => 7, 'Nord' => 9, 'Sud' => 23 }.freeze

    def election_results_of_2013
      if @election_results_of_2013.nil?
        @election_results_of_2013 = load_election_results(
          'luxembourg-20131020.psv'
        )
      end
      @election_results_of_2013
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2013, election_results_of_2013,
          SEAT_DISTRIBUTION, DhondtDenominators
        )
      end
      @electoral_system
    end
  end
end
