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
  # The regional data for Utopia, an area for testing purposes.
  #
  class Utopia
    include Singleton

    LAST_ELECTION_RESULT = { 'Red' => 91_811, 'Green' => 190_934,
                             'Blue' => 290_647, 'Yellow' => 356_473 }

    LAST_DETAILED_ELECTION_RESULT = { 'North' => { 'Red' => 50, 'Green' => 70
                                                 },
                                      'South' => { 'Red' => 70, 'Green' => 50,
                                                   'Blue' => 100 },
                                      'East' => { 'Red' => 90, 'Green' => 70,
                                                  'Blue' => 90 },
                                      'West' => { 'Red' => 110, 'Green' => 50,
                                                  'Yellow' => 120 } }

    ELECTORAL_SYSTEM = FirstPastThePost.new(LAST_ELECTION_RESULT,
                                            LAST_DETAILED_ELECTION_RESULT)

    def area_code
      'UT'
    end

    def population_size
      1_000_000
    end

    def threshold
      nil
    end

    def no_of_seats
      LAST_DETAILED_ELECTION_RESULT.size
    end

    def seats(simulation)
      ELECTORAL_SYSTEM.project(simulation)
    end
  end
end
