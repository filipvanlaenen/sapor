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
  # The regional data for Flanders.
  #
  class Flanders < Area
    include Singleton
    def area_code
      'BE-VLG'
    end

    def coalitions
      [['N-VA', 'CD&V'],
       ['N-VA', 'CD&V', 'Open Vld'],
       ['N-VA', 'CD&V', 'sp.a'],
       ['CD&V', 'Open Vld'],
       ['CD&V', 'sp.a'],
       ['CD&V', 'Open Vld', 'sp.a'],
       ['CD&V', 'Open Vld', 'sp.a', 'Groen'],
       ['Open Vld', 'sp.a'],
       ['Open Vld', 'sp.a', 'Groen'],
       ['CD&V', 'sp.a', 'Groen'],
       ['CD&V', 'sp.a', 'Groen', 'PVDA'],
       ['N-VA', 'Vlaams Belang']]
    end

    def no_of_seats
      SEAT_DISTRIBUTION.values.inject(:+)
    end

    def overall_election_results_of_2014
      if @overall_election_results_of_2014.nil?
        @overall_election_results_of_2014 = \
          summarize_election_results(election_results_of_2014)
      end
      @overall_election_results_of_2014
    end

    def population_size
      # Voter turnout on 25 May 2014
      # Source: Wikipedia page about the elections of 25 May 2014 in
      # Flanders, downloaded on 19 March 2016,
      # https://nl.wikipedia.org/wiki/Vlaamse_verkiezingen_2014
      4_202_462
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    SEAT_DISTRIBUTION = { 'Antwerpen' => 33, 'Brussel' => 6,
                          'Limburg' => 16, 'Oost-Vlaanderen' => 27,
                          'Vlaams-Brabant' => 20,
                          'West-Vlaanderen' => 22 }

    THRESHOLD = 0.05

    def election_results_of_2014
      if @election_results_of_2014.nil?
        @election_results_of_2014 = load_election_results( \
          'flanders-2014.psv')
      end
      @election_results_of_2014
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2014,
          election_results_of_2014,
          SEAT_DISTRIBUTION,
          DhondtDenominators,
          THRESHOLD)
      end
      @electoral_system
    end
  end
end
