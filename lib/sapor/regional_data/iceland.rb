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

    def no_of_seats
      NO_OF_LEVELING_SEATS + DIRECT_SEAT_DISTRIBUTION.values.inject(:+)
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

    COALITIONS = [['Sjálfstæðisflokkurinn', 'Viðreisn', 'Björt framtíð'],
                  %w(Sjálfstæðisflokkurinn Viðreisn),
                  ['Sjálfstæðisflokkurinn', 'Björt framtíð'],
                  %w(Sjálfstæðisflokkurinn Samfylkingin),
                  %w(Sjálfstæðisflokkurinn Framsóknarflokkurinn),
                  %w(Sjálfstæðisflokkurinn Framsóknarflokkurinn Miðflokkurinn),
                  %w(Sjálfstæðisflokkurinn Miðflokkurinn),
                  ['Sjálfstæðisflokkurinn',
                   'Vinstrihreyfingin – grænt framboð'],
                  ['Vinstrihreyfingin – grænt framboð', 'Framsóknarflokkurinn'],
                  ['Vinstrihreyfingin – grænt framboð', 'Framsóknarflokkurinn',
                   'Miðflokkurinn'],
                  ['Vinstrihreyfingin – grænt framboð', 'Miðflokkurinn'],
                  ['Vinstrihreyfingin – grænt framboð', 'Samfylkingin'],
                  ['Vinstrihreyfingin – grænt framboð', 'Samfylkingin',
                   'Framsóknarflokkurinn'],
                  ['Vinstrihreyfingin – grænt framboð', 'Samfylkingin',
                   'Framsóknarflokkurinn', 'Miðflokkurinn'],
                  ['Vinstrihreyfingin – grænt framboð', 'Samfylkingin',
                   'Miðflokkurinn'],
                  ['Vinstrihreyfingin – grænt framboð', 'Samfylkingin',
                   'Viðreisn', 'Björt framtíð', 'Píratar'],
                  ['Vinstrihreyfingin – grænt framboð', 'Samfylkingin',
                   'Viðreisn', 'Píratar'],
                  ['Vinstrihreyfingin – grænt framboð', 'Samfylkingin',
                   'Björt framtíð', 'Píratar'],
                  ['Vinstrihreyfingin – grænt framboð', 'Samfylkingin',
                   'Píratar'],
                  ['Vinstrihreyfingin – grænt framboð', 'Píratar']].freeze

    DIRECT_SEAT_DISTRIBUTION = { 'Norðaustur' => 9, 'Norðvestur' => 9,
                                 'Reykjavík norður' => 9,
                                 'Reykjavík suður' => 9, 'Suðvestur' => 9,
                                 'Suður' => 9 }.freeze

    NO_OF_LEVELING_SEATS = 9

    LEVELING_THRESHOLD = 0.05

    def election_results_of_2017
      if @election_results_of_2017.nil?
        @election_results_of_2017 = load_election_results(
          'iceland-20171028.psv'
        )
      end
      @election_results_of_2017
    end

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
end
