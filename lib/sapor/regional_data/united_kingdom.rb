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
  # The regional data for the United Kingdom.
  #
  class UnitedKingdom
    include Singleton

    # Source: BBC News Election 2010 Results, retrieved on 3 April 2015.
    # URL: http://news.bbc.co.uk/2/shared/election2010/results/
    LAST_ELECTION_RESULT = { 'Conservative' => 10_726_614,
                             'Labour' => 8_609_527,
                             'Liberal Democrat' => 6_836_824,
                             'Democratic Unionist Party' => 168_216,
                             'Scottish National Party' => 491_386,
                             'Sinn Féin' => 171_942,
                             'Plaid Cymru' => 165_394,
                             'Social Democratic & Labour Party' => 110_970,
                             'Green' => 285_616,
                             'Alliance Party' => 42_762,
                             'UK Independence Party' => 919_546,
                             'British National Party' => 564_331,
                             'Ulster Conservatives and Unionists - New Force' => 102_361,
                             'English Democrats' => 64_826,
                             'Respect-Unity Coalition' => 33_251,
                             'Traditional Unionist Voice' => 26_300,
                             'Christian Party' => 18_623,
                             'Independent Community and Health Concern' => 16_150,
                             'Trade Unionist and Socialist Coalition' => 12_275,
                             'Scottish Socialist Party' => 3_157,
                             OTHER => 321_309 }

    LAST_DETAILED_ELECTION_RESULT = { 'Cardiff North' => { 'Conservative' => 17_860,
                                                           'Labour' => 17_666,
                                                           'Liberal Democrat' => 8_724,
                                                           'Plaid Cymru' => 1_588,
                                                           'UK Independence Party' => 1_130,
                                                           'Green' => 362,
                                                           'Christian Party' => 300} }

    ELECTORAL_SYSTEM = FirstPastThePost.new(LAST_ELECTION_RESULT,
                                            LAST_DETAILED_ELECTION_RESULT)

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
  end
end
