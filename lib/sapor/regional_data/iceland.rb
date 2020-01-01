
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
  # The regional data for Iceland.
  #
  class Iceland < Area
    include Singleton

    def area_code
      'IS'
    end

    def coalitions
      COALITIONS
    end

    def election_results_of_2017
      if @election_results_of_2017.nil?
        @election_results_of_2017 = load_election_results(
          'iceland-20171028.psv'
        )
      end
      @election_results_of_2017
    end

    def no_of_seats
      NO_OF_SEATS
    end

    def overall_election_results_of_2017
      if @overall_election_results_of_2017.nil?
        @overall_election_results_of_2017 = \
          summarize_election_results(election_results_of_2017)
      end
      @overall_election_results_of_2017
    end

    def population_size
      # Voter turnout on 28 October 2017
      # Source: Wikipedia, Icelandic parliamentary election, 2017, downloaded
      # on 20 November 2017,
      # https://en.wikipedia.org/wiki/Icelandic_parliamentary_election,_2017
      196_246
    end

    def seat_distribution
      SEAT_DISTRIBUTION
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      LEVELING_THRESHOLD
    end

    private

    COALITIONS = [['Björt framtíð', 'Píratar', 'Samfylkingin', 'Viðreisn',
                   'Vinstrihreyfingin – grænt framboð'],
                  ['Björt framtíð', 'Píratar', 'Samfylkingin',
                   'Vinstrihreyfingin – grænt framboð'],
                  ['Björt framtíð', 'Sjálfstæðisflokkurinn'],
                  ['Björt framtíð', 'Sjálfstæðisflokkurinn', 'Viðreisn'],
                  ['Framsóknarflokkurinn', 'Miðflokkurinn', 'Samfylkingin',
                   'Vinstrihreyfingin – grænt framboð'],
                  %w[Framsóknarflokkurinn Miðflokkurinn Sjálfstæðisflokkurinn],
                  ['Framsóknarflokkurinn', 'Miðflokkurinn',
                   'Vinstrihreyfingin – grænt framboð'],
                  ['Framsóknarflokkurinn', 'Samfylkingin',
                   'Vinstrihreyfingin – grænt framboð'],
                  %w[Framsóknarflokkurinn Sjálfstæðisflokkurinn],
                  ['Framsóknarflokkurinn', 'Sjálfstæðisflokkurinn',
                   'Vinstrihreyfingin – grænt framboð'],
                  ['Framsóknarflokkurinn', 'Vinstrihreyfingin – grænt framboð'],
                  ['Miðflokkurinn', 'Samfylkingin',
                   'Vinstrihreyfingin – grænt framboð'],
                  %w[Miðflokkurinn Sjálfstæðisflokkurinn],
                  ['Miðflokkurinn', 'Vinstrihreyfingin – grænt framboð'],
                  %w[Samfylkingin Sjálfstæðisflokkurinn],
                  ['Píratar', 'Samfylkingin', 'Viðreisn',
                   'Vinstrihreyfingin – grænt framboð'],
                  ['Píratar', 'Samfylkingin',
                   'Vinstrihreyfingin – grænt framboð'],
                  ['Píratar', 'Vinstrihreyfingin – grænt framboð'],
                  ['Samfylkingin', 'Vinstrihreyfingin – grænt framboð'],
                  %w[Sjálfstæðisflokkurinn Viðreisn],
                  ['Sjálfstæðisflokkurinn',
                   'Vinstrihreyfingin – grænt framboð']].freeze

    DIRECT_SEAT_DISTRIBUTION = { 'Norðaustur' => 9, 'Norðvestur' => 9,
                                 'Reykjavík norður' => 9,
                                 'Reykjavík suður' => 9, 'Suðvestur' => 9,
                                 'Suður' => 9 }.freeze

    NO_OF_LEVELING_SEATS = 9

    LEVELING_THRESHOLD = 0.05

    NO_OF_SEATS = NO_OF_LEVELING_SEATS + \
                  DIRECT_SEAT_DISTRIBUTION.values.inject(:+)

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictLeveledProportional.new(
          overall_election_results_of_2017, election_results_of_2017,
          DIRECT_SEAT_DISTRIBUTION, NO_OF_LEVELING_SEATS, LEVELING_THRESHOLD,
          DhondtDenominators
        )
      end
      @electoral_system
    end
  end

  # Extension of Iceland with J
  class IcelandWithJ < Iceland
    def area_code
      'IS∪{J}'
    end

    def election_results_of_2017
      if @election_results_of_2017.nil?
        @election_results_of_2017 = load_election_results(
          'iceland-20171028-with-j.psv'
        )
      end
      @election_results_of_2017
    end
  end
end
