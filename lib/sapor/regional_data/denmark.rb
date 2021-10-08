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
  # The regional data for Denmark.
  #
  class Denmark < Area
    include Singleton

    def area_code
      'DK'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      NO_OF_SEATS
    end

    def overall_election_results_of_2015
      if @overall_election_results_of_2015.nil?
        @overall_election_results_of_2015 = \
          summarize_election_results(election_results_of_2015)
      end
      @overall_election_results_of_2015
    end

    def population_size
      POPULATION_SIZE
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    private

    A_PARTY = 'Socialdemokraterne'.freeze
    B_PARTY = 'Radikale Venstre'.freeze
    C_PARTY = 'Det Konservative Folkeparti'.freeze
    D_PARTY = 'Nye Borgerlige'.freeze
    E_PARTY = 'Borgerlisten'.freeze
    F_PARTY = 'Socialistisk Folkeparti'.freeze
    I_PARTY = 'Liberal Alliance'.freeze
    K_PARTY = 'Kristendemokraterne'.freeze
    M_PARTY = 'Moderaterne'.freeze
    O_PARTY = 'Dansk Folkeparti'.freeze
    P_PARTY = 'Stram Kurs'.freeze
    V_PARTY = 'Venstre'.freeze
    OE_PARTY = 'Enhedslisten–De Rød-Grønne'.freeze
    AA_PARTY = 'Alternativet'.freeze

    COALITIONS = [[A_PARTY, B_PARTY],
                  [A_PARTY, B_PARTY, F_PARTY],
                  [A_PARTY, B_PARTY, F_PARTY, OE_PARTY],
                  [A_PARTY, B_PARTY, F_PARTY, OE_PARTY, AA_PARTY],
                  [A_PARTY, F_PARTY, OE_PARTY],
                  [A_PARTY, F_PARTY, OE_PARTY, AA_PARTY],
                  [C_PARTY, D_PARTY, E_PARTY, I_PARTY, K_PARTY, O_PARTY,
                   P_PARTY, V_PARTY],
                  [C_PARTY, D_PARTY, E_PARTY, I_PARTY, K_PARTY, M_PARTY,
                   O_PARTY, V_PARTY],
                  [C_PARTY, D_PARTY, E_PARTY, I_PARTY, K_PARTY, O_PARTY,
                   V_PARTY],
                  [C_PARTY, D_PARTY, E_PARTY, I_PARTY, O_PARTY, V_PARTY],
                  [C_PARTY, D_PARTY, I_PARTY, K_PARTY, O_PARTY, V_PARTY],
                  [C_PARTY, D_PARTY, I_PARTY, O_PARTY, V_PARTY],
                  [C_PARTY, I_PARTY, K_PARTY, O_PARTY, V_PARTY],
                  [C_PARTY, I_PARTY, O_PARTY, V_PARTY],
                  [C_PARTY, I_PARTY, V_PARTY],
                  [C_PARTY, V_PARTY],
                  [V_PARTY]].freeze

    # Voter turnout on 18 June 2015
    # http://www.dst.dk/valg/Valg1487635/valgopg/valgopgHL.htm
    POPULATION_SIZE = 3_518_987

    DIRECT_SEAT_DISTRIBUTION = { 'Københavns Storkreds' => 16,
                                 'Københavns Omegns Storkreds' => 11,
                                 'Nordsjællands Storkreds' => 10,
                                 'Bornholms Storkreds' => 2,
                                 'Sjællands Storkreds' => 20,
                                 'Fyns Storkreds' => 12,
                                 'Sydjyllands Storkreds' => 18,
                                 'Østjyllands Storkreds' => 18,
                                 'Vestjyllands Storkreds' => 13,
                                 'Nordjyllands Storkreds' => 15 }.freeze

    LEVELING_THRESHOLD = 0.02

    NO_OF_LEVELING_SEATS = 40

    NO_OF_SEATS = NO_OF_LEVELING_SEATS + \
                  DIRECT_SEAT_DISTRIBUTION.values.inject(:+)

    def election_results_of_2015
      if @election_results_of_2015.nil?
        @election_results_of_2015 = load_election_results(
          'denmark-20150618.psv'
        )
      end
      @election_results_of_2015
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = LargestRemainder.new(NO_OF_SEATS, HareQuota,
                                                 LEVELING_THRESHOLD)

      end
      @electoral_system
    end
  end
end
