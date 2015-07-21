# encoding: utf-8
#
# Statistical Analysis of Polling Results (SAPoR)
# Copyright (C) 2014 Filip van Laenen <f.a.vanlaenen@ieee.org>
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
  # The regional data for Catalonia.
  #
  class Catalonia < Area
    def election_results_of_2012
      if @election_results_of_2012.nil?
        @election_results_of_2012 = load_election_results('catalonia-2012.psv')
      end
      @election_results_of_2012
    end

    def overall_election_results_of_2012
      if @overall_election_results_of_2012.nil?
        @overall_election_results_of_2012 = \
          summarize_election_results(election_results_of_2012)
      end
      @overall_election_results_of_2012
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    private

    SEAT_DISTRIBUTION = { 'Barcelona' => 85, 'Girona' => 17, 'Lleida' => 15,
                          'Tarragona' => 18 }

    THRESHOLD = 0.03

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = Proportional.new(overall_election_results_of_2012,
                                             election_results_of_2012,
                                             SEAT_DISTRIBUTION,
                                             DhondtDenominators,
                                             THRESHOLD)
      end
      @electoral_system
    end
  end
end
