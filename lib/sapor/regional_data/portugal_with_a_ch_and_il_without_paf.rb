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
  # The regional data for Portugal, with Portugal à Frente replaced with Partido
  # Social Democrata and CDS–Partido Popular, and Aliança added.
  #
  class PortugalWithAChAndIlWithoutPaf < Area
    include Singleton

    def area_code
      'PT∪{A,CH,IL}\{PàF}'
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

    private

    COALITIONS = Portugal.instance.coalitions

    # Voter turnout on 4 October 2015
    # https://en.wikipedia.org/wiki/2015_Portuguese_legislative_election
    POPULATION_SIZE = 5_206_113

    SEAT_DISTRIBUTION = { 'Açores' => 5, 'Aveiro' => 16, 'Beja' => 3,
                          'Braga' => 19, 'Bragança' => 3, 'Castelo Branco' => 4,
                          'Coimbra' => 9, 'Évora' => 3, 'Faro' => 9,
                          'Guarda' => 3, 'Leiria' => 10, 'Lisboa' => 48,
                          'Madeira' => 6, 'Portalegre' => 2, 'Porto' => 40,
                          'Santarém' => 9, 'Setúbal' => 18,
                          'Viana do Castelo' => 6, 'Vila Real' => 5,
                          'Viseu' => 8, 'Europa' => 2,
                          'Fora da Europa' => 2 }.freeze

    def election_results_of_2015
      if @election_results_of_2015.nil?
        @election_results_of_2015 = load_election_results(
          'portugal-20151004-with-a-ch-and-il-without-paf.psv'
        )
      end
      @election_results_of_2015
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2015, election_results_of_2015,
          SEAT_DISTRIBUTION, DhondtDenominators
        )
      end
      @electoral_system
    end
  end
end
