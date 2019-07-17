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
  # The regional data for Poland, without Zjednoczona Lewica but with Sojusz
  # Lewicy Demokratycznej and Wiosna.
  #
  class PolandWithSldAndWiWithoutZL < Area
    include Singleton

    def area_code
      'PL∪{SLD,Wi}\{ZL}'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      SEAT_DISTRIBUTION.values.inject(:+)
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

    def threshold
      PARTY_LIST_THRESHOLD
    end

    private

    MN_PARTY = 'Mniejszość Niemiecka'.freeze
    N_PARTY = '.Nowoczesna'.freeze
    PIS_PARTY = 'Prawo i Sprawiedliwość'.freeze
    PO_PARTY = 'Platforma Obywatelska'.freeze
    PSL_PARTY = 'Polskie Stronnictwo Ludowe'.freeze
    R_PARTY = 'Lewica Razem'.freeze
    SLD_PARTY = 'Sojusz Lewicy Demokratycznej'.freeze
    ZL_PARTY = 'Zjednoczona Lewica'.freeze

    COALITIONS = [[N_PARTY, PO_PARTY],
                  [N_PARTY, PO_PARTY, PSL_PARTY],
                  [N_PARTY, PO_PARTY, PSL_PARTY, R_PARTY, SLD_PARTY],
                  [N_PARTY, PO_PARTY, PSL_PARTY, SLD_PARTY],
                  [N_PARTY, PO_PARTY, SLD_PARTY],
                  [PIS_PARTY],
                  [PO_PARTY]].freeze

    # Voter turnout on 25 October 2015
    # Source: Web page with the official results of the elections of 25 October
    # 2015, downloaded on 17 July 2019,
    # https://en.wikipedia.org/wiki/2015_Polish_parliamentary_election
    POPULATION_SIZE = 15_200_671

    SEAT_DISTRIBUTION = { 'Legnica' => 12, 'Wałbrzych' => 8, 'Wrocław' => 14,
                          'Bydgoszcz' => 12, 'Toruń' => 13, 'Lublin' => 15,
                          'Chełm' => 12, 'Zielona Góra' => 12, 'Łódź' => 10,
                          'Piotrków Trybunalski' => 9, 'Sieradz' => 12,
                          'Kraków I (południe)' => 8,
                          'Kraków II (północ)' => 14, 'Nowy Sącz' => 10,
                          'Tarnów' => 9, 'Płock' => 10, 'Radom' => 9,
                          'Siedlce' => 12, 'Warszawa I (miasto)' => 20,
                          'Warszawa II (okręg)' => 12, 'Opole' => 12,
                          'Krosno' => 11, 'Rzeszów' => 15, 'Białystok' => 14,
                          'Gdańsk' => 12, 'Gdynia' => 14, 'Bielsko-Biała' => 9,
                          'Częstochowa' => 7, 'Gliwice' => 9, 'Rybnik' => 9,
                          'Katowice' => 12, 'Sosnowiec' => 9, 'Kielce' => 16,
                          'Elbląg' => 8, 'Olsztyn' => 10, 'Kalisz' => 12,
                          'Konin' => 9, 'Piła' => 9, 'Poznań' => 10,
                          'Koszalin' => 8, 'Szczecin' => 12 }.freeze

    PARTY_LIST_THRESHOLD = 0.05
    COALITION_LIST_THRESHOLD = 0.08
    COALITION_LISTS = [].freeze
    MINORITY_LISTS = [MN_PARTY].freeze

    def election_results_of_2015
      if @election_results_of_2015.nil?
        @election_results_of_2015 = load_election_results(
          'poland-20151025-with-sld-and-wi-without-zl.psv'
        )
      end
      @election_results_of_2015
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictVariableThresholdProportional.new( \
          overall_election_results_of_2015, election_results_of_2015,
          SEAT_DISTRIBUTION, DhondtDenominators, PARTY_LIST_THRESHOLD,
          COALITION_LIST_THRESHOLD, COALITION_LISTS, MINORITY_LISTS
        )
      end
      @electoral_system
    end
  end
end
