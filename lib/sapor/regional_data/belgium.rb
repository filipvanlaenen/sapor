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
  # The regional data for Belgium.
  #
  class Belgium < Area
    include Singleton
    def coalitions
      COALITIONS
    end

    def no_of_seats
      seat_distribution.values.inject(:+)
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    THRESHOLD = 0.05

    COALITIONS = [['cdH', 'CD&V', 'Ecolo', 'Groen', 'MR', 'Open Vld', 'PS',
                   'sp.a'],
                  ['cdH', 'CD&V', 'Ecolo', 'Groen', 'MR', 'Open Vld'],
                  ['cdH', 'CD&V', 'Ecolo', 'Groen', 'PS', 'PTB', 'PVDA',
                  'sp.a'],
                  ['cdH', 'CD&V', 'Ecolo', 'Groen', 'PS', 'sp.a'],
                  ['cdH', 'CD&V', 'MR', 'N-VA', 'Open Vld'],
                  ['cdH', 'CD&V', 'MR', 'Open Vld'],
                  ['cdH', 'CD&V', 'MR', 'Open Vld', 'PS', 'sp.a'],
                  ['cdH', 'CD&V', 'MR', 'Open Vld', 'PS'],
                  ['cdH', 'CD&V', 'PS', 'sp.a'],
                  ['cdH', 'Ecolo', 'Groen', 'PS', 'PTB', 'PVDA', 'sp.a'],
                  ['CD&V', 'MR', 'N-VA', 'Open Vld'],
                  ['Ecolo', 'Groen', 'MR', 'Open Vld', 'PS', 'sp.a'],
                  ['Ecolo', 'Groen', 'PS', 'PTB', 'PVDA', 'sp.a'],
                  ['MR', 'Open Vld', 'PS', 'sp.a']].freeze

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new(
          overall_election_results_of_2014,
          election_results_of_2014,
          seat_distribution,
          DhondtDenominators,
          THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
