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
  # The regional data for Belgium.
  #
  class Belgium < Area
    include Singleton
    def area_code
      'BE'
    end

    def coalitions
      [['N-VA', 'CD&V', 'Open Vld', 'MR']]
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
      # Source: Web page with the official results of the elections of 25 May
      # 2014, downloaded on 3 November 2016,
      # http://verkiezingen2014.belgium.be/nl/cha/results/results_tab_CKR00000.html
      6_744_547
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    SEAT_DISTRIBUTION = { 'Antwerpen' => 24, 'Brabant wallon' => 5,
                          'Brussel-Hoofdstad' => 0, 'Bruxelles-Capitale' => 15,
                          'Hainaut' => 18, 'Liège' => 15, 'Limburg' => 12,
                          'Luxembourg' => 4, 'Namur' => 6,
                          'Oost-Vlaanderen' => 20, 'Vlaams-Brabant' => 15,
                          'West-Vlaanderen' => 16 }

    THRESHOLD = 0.05

    def election_results_of_2014
      if @election_results_of_2014.nil?
        @election_results_of_2014 = load_election_results( \
          'belgium-2014.psv')
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
