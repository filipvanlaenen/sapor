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
  # The regional data for the European Union: Ireland.
  #
  class EuropeanUnionIreland < Area
    include Singleton

    def area_code
      'EU[IE]'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      seat_distribution.values.inject(:+)
    end

    def population_size
      POPULATION_SIZE
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    private

    COALITIONS = [['Independents (GUE/NGL)', 'Independents 4 Change (GUE/NGL)', 'Sinn Féin (GUE/NGL)',
                   'Socialist Party (GUE/NGL)', 'Solidarity–People Before Profit (GUE/NGL)'],
                  ['Green Party (Greens/EFA)'],
                  ['Labour Party (S&D)', 'Social Democrats (S&D)'],
                  ['Fianna Fáil (RE)', 'Independent Ireland (RE)', 'Independents (RE)'],
                  ['Fine Gael (EPP)'],
                  ['Aontú (*)', 'Catholic Democrats (*)', 'Direct Democracy Ireland (*)', 'Fís Nua (*)',
                   'Independent Alliance (*)', 'Independents (*)', 'Renua Ireland (*)']].freeze

    # Voter turnout on 7 June 2024
    # https://en.wikipedia.org/wiki/2024_European_Parliament_election_in_Ireland#Results
    POPULATION_SIZE = 1_745_230

    WEIGHTS = [ [1.0],
                [0.643, 0.357],
                [0.498, 0.297, 0.205],
                [0.354, 0.300, 0.214, 0.132],
                [0.328, 0.279, 0.198, 0.122, 0.073] ].freeze

    def seat_distribution
      { 'Dublin' => 4, 'Midlands–North-West' => 5, 'South' => 5 }.freeze
    end

    #def election_results_of_2024
      #if @election_results_of_2024.nil?
        #@election_results_of_2024 = load_election_results( \
          #'european-union-ireland-20240607.psv'
        #)
      #end
      #@election_results_of_2024
    #end

    def election_results_of_2024
      if @election_results_of_2024.nil?
        @election_results_of_2024, @candidates_of_2024 = load_capped_election_results(
          'european-union-ireland-20240607.psv'
        )
      end
      @election_results_of_2024
    end

    #def electoral_system
      #if @electoral_system.nil?
        #@electoral_system = MultiDistrictProportional.new( \
          #overall_election_results_of_2024,
          #election_results_of_2024,
          #seat_distribution,
          #DhondtDenominators
        #)
      #end
      #@electoral_system
    #end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = ManyPastThePost.new( \
          overall_election_results_of_2024, election_results_of_2024,
          seat_distribution, @candidates_of_2024, WEIGHTS
        )
      end
      @electoral_system
    end

    def overall_election_results_of_2024
      if @overall_election_results_of_2024.nil?
        @overall_election_results_of_2024 = summarize_election_results(election_results_of_2024)
      end
      @overall_election_results_of_2024
    end
  end
end
