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
  # The regional data for Catalonia.
  #
  class Catalonia < Area
    include Singleton
    def area_code
      'ES-CT'
    end

    def coalitions
      [['Junts pel Sí'],
       ['Junts pel Sí',
        "Candidatura d'Unitat Popular – Alternativa d'Esquerres"]]
    end

    def no_of_seats
      SEAT_DISTRIBUTION.values.inject(:+)
    end

    def overall_election_results_of_2012_adapted_to_2015
      if @overall_election_results_of_2012_adapted_to_2015.nil?
        @overall_election_results_of_2012_adapted_to_2015 = \
          summarize_election_results(election_results_of_2012_adapted_to_2015)
      end
      @overall_election_results_of_2012_adapted_to_2015
    end

    def population_size
      # Voter turnout in 2012
      # Source: Catalonian parliamentary election, 2012, Wikipedia, retrieved on
      # 22 July 2015.
      # URL: https://en.wikipedia.org/wiki/Catalonian_parliamentary_election,_2012
      3_668_310
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    SEAT_DISTRIBUTION = { 'Barcelona' => 85, 'Girona' => 17, 'Lleida' => 15,
                          'Tarragona' => 18 }

    THRESHOLD = 0.03

    def election_results_of_2012_adapted_to_2015
      if @election_results_of_2012_adapted_to_2015.nil?
        @election_results_of_2012_adapted_to_2015 = load_election_results( \
          'catalonia-2012-2015.psv')
      end
      @election_results_of_2012_adapted_to_2015
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2012_adapted_to_2015,
          election_results_of_2012_adapted_to_2015,
          SEAT_DISTRIBUTION,
          DhondtDenominators,
          THRESHOLD)
      end
      @electoral_system
    end
  end
end
