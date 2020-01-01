# encoding: utf-8
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
  # The regional data for the United Kingdom.
  #
  class UnitedKingdom < Area
    include Singleton

    def area_code
      'UK'
    end

    def coalitions
      [['Conservative Party'], ['Conservative Party', 'Liberal Democrats'],
       ['Conservative Party', 'Plaid Cymru'],
       ['Conservative Party', 'Plaid Cymru', 'Scottish National Party'],
       ['Conservative Party', 'Scottish National Party'],
       ['Labour Party'], ['Labour Party', 'Liberal Democrats'],
       ['Labour Party', 'Liberal Democrats', 'Plaid Cymru'],
       ['Labour Party', 'Liberal Democrats', 'Plaid Cymru',
        'Scottish National Party'],
       ['Labour Party', 'Liberal Democrats', 'Scottish National Party'],
       ['Labour Party', 'Plaid Cymru'],
       ['Labour Party', 'Plaid Cymru', 'Scottish National Party'],
       ['Labour Party', 'Scottish National Party']]
    end

    def no_of_seats
      election_results_of_2017.size
    end

    def overall_election_results_of_2017
      if @overall_election_results_of_2017.nil?
        @overall_election_results_of_2017 = \
          summarize_election_results(election_results_of_2017)
      end
      @overall_election_results_of_2017
    end

    def population_size
      # Source: Wikipedia article the general election in the United Kingdom,
      # retrieved on 17 November 2018.
      # URL: https://en.wikipedia.org/wiki/United_Kingdom_general_election,_2017
      32_204_124
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      nil
    end

    private

    def election_results_of_2017
      if @election_results_of_2017.nil?
        @election_results_of_2017 = load_election_results(
          'united_kingdom-20170608.psv'
        )
      end
      @election_results_of_2017
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = FirstPastThePost.new(
          overall_election_results_of_2017,
          election_results_of_2017
        )
      end
      @electoral_system
    end
  end
end
