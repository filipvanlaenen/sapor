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
  # The regional data for the United Kingdom.
  #
  class UnitedKingdom < Area
    include Singleton

    def area_code
      'GB'
    end

    CON_PARTY = 'Conservative Party'
    GREEN_PARTY = 'Green Party'
    LAB_PARTY = 'Labour Party'
    LD_PARTY = 'Liberal Democrats'
    PC_PARTY = 'Plaid Cymru'
    SNP_PARTY = 'Scottish National Party'

    def coalitions
      [[CON_PARTY],
       [CON_PARTY, LD_PARTY],
       [CON_PARTY, PC_PARTY],
       [CON_PARTY, PC_PARTY, SNP_PARTY],
       [CON_PARTY, SNP_PARTY],
       [LAB_PARTY],
       [LAB_PARTY, GREEN_PARTY, LD_PARTY, PC_PARTY, SNP_PARTY],
       [LAB_PARTY, LD_PARTY],
       [LAB_PARTY, LD_PARTY, PC_PARTY],
       [LAB_PARTY, LD_PARTY, PC_PARTY, SNP_PARTY],
       [LAB_PARTY, LD_PARTY, SNP_PARTY],
       [LAB_PARTY, PC_PARTY],
       [LAB_PARTY, PC_PARTY, SNP_PARTY],
       [LAB_PARTY, SNP_PARTY]]
    end

    def election_results_of_2019
      if @election_results_of_2019.nil?
        @election_results_of_2019 = load_election_results(
          'united_kingdom-20191212.psv'
        )
      end
      @election_results_of_2019
    end

    def no_of_seats
      election_results_of_2019.size
    end

    def overall_election_results_of_2019
      if @overall_election_results_of_2019.nil?
        @overall_election_results_of_2019 = \
          summarize_election_results(election_results_of_2019)
      end
      @overall_election_results_of_2019
    end

    def population_size
      # Source: Wikipedia article the general election in the United Kingdom,
      # retrieved on 12 August 2020.
      # URL: https://en.wikipedia.org/wiki/2019_United_Kingdom_general_election
      32_014_110
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      nil
    end

    private

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = FirstPastThePost.new(
          overall_election_results_of_2019,
          election_results_of_2019
        )
      end
      @electoral_system
    end
  end

  # Extension of the United Kingdom to Great Britain without the Speaker.
  class GreatBritainWithoutSpeaker < UnitedKingdom
    def area_code
      'GB[GBN]\{Speaker}'
    end

    def election_results_of_2019
      if @election_results_of_2019.nil?
        @election_results_of_2019 = load_election_results(
          'great_britain-20191212-without-speaker.psv'
        )
      end
      @election_results_of_2019
    end

    def population_size
      31_215_076
    end
  end
end
