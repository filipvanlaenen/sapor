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
  # The regional data for the United Kingdom.
  #
  class UnitedKingdom < Area
    include Singleton

    #    LAST_DETAILED_ELECTION_RESULT = load_election_results('uk-2015.psv')
    #    LAST_ELECTION_RESULT = summarize_election_results(LAST_DETAILED_ELECTION_RESULT)

    #    ELECTORAL_SYSTEM = FirstPastThePost.new(LAST_ELECTION_RESULT,
    #                                            LAST_DETAILED_ELECTION_RESULT)

    def area_code
      'UK'
    end

    def population_size
      # Source: BBC News Election 2010 Results, retrieved on 3 April 2015.
      # URL: http://news.bbc.co.uk/2/shared/election2010/results/
      29_691_380
    end

    def no_of_seats
      LAST_DETAILED_ELECTION_RESULT.size
    end

    def seats(simulation)
      ELECTORAL_SYSTEM.project(simulation)
    end

    def threshold
      nil
    end
  end
end
