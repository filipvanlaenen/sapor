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
  # The regional data for Portugal.
  #
  class Portugal < Area
    include Singleton

    def area_code
      'PT'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      SEAT_DISTRIBUTION.values.inject(:+)
    end

    def overall_election_results_of_2019
      if @overall_election_results_of_2019.nil?
        @overall_election_results_of_2019 = \
          summarize_election_results(election_results_of_2019)
      end
      @overall_election_results_of_2019
    end

    def population_size
      POPULATION_SIZE
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    private

    BE_PARTY = 'Bloco de Esquerda'.freeze
    CDS_PP_PARTY = 'CDS–Partido Popular'.freeze
    CDU_PARTY = 'Coligação Democrática Unitária'.freeze
    PS_PARTY = 'Partido Socialista'.freeze
    PSD_PARTY = 'Partido Social Democrata'.freeze

    COALITIONS = [[BE_PARTY, CDU_PARTY, PS_PARTY],
                  [BE_PARTY, PS_PARTY],
                  [CDS_PP_PARTY, PSD_PARTY],
                  [CDU_PARTY, PS_PARTY],
                  [PS_PARTY]].freeze

    # Voter turnout on 6 October 2019
    # https://en.wikipedia.org/wiki/2019_Portuguese_legislative_election
    POPULATION_SIZE = 4_982_609

    SEAT_DISTRIBUTION = { 'Açores' => 5, 'Aveiro' => 16, 'Beja' => 3,
                          'Braga' => 19, 'Bragança' => 3, 'Castelo Branco' => 4,
                          'Coimbra' => 9, 'Évora' => 3, 'Faro' => 9,
                          'Guarda' => 3, 'Leiria' => 10, 'Lisboa' => 48,
                          'Madeira' => 6, 'Portalegre' => 2, 'Porto' => 40,
                          'Santarém' => 9, 'Setúbal' => 18,
                          'Viana do Castelo' => 6, 'Vila Real' => 5,
                          'Viseu' => 8, 'Europa' => 2,
                          'Fora da Europa' => 2 }.freeze

    def election_results_of_2019
      if @election_results_of_2019.nil?
        @election_results_of_2019 = load_election_results(
          'portugal-20191006.psv'
        )
      end
      @election_results_of_2019
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2019, election_results_of_2019,
          SEAT_DISTRIBUTION, DhondtDenominators
        )
      end
      @electoral_system
    end
  end
end
