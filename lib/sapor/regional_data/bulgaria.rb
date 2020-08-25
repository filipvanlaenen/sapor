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
      SEAT_DISTRIBUTION.values.inject(:+)
    end

    def overall_election_results_of_2017
      if @overall_election_results_of_2017.nil?
        @overall_election_results_of_2017 = \
          summarize_election_results(election_results_of_2017)
      end
      @overall_election_results_of_2017
    end

    def population_size
      # Voter turnout on 26 March 2017
      3_513_490
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    COALITIONS = [].freeze

    SEAT_DISTRIBUTION = { 'Благоевград' => 11, 'Бургас' => 14, 'Варна' => 15 }.freeze

    THRESHOLD = 0.04

    def election_results_of_2017
      if @election_results_of_2017.nil?
        @election_results_of_2017 = load_election_results(
          'bulgaria-20170326.psv'
        )
      end
      @election_results_of_2017
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2017, election_results_of_2017,
          SEAT_DISTRIBUTION, DhondtDenominators, 0, THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
