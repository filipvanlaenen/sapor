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
  # The regional data for Belgium: the Flemish part.
  #
  class BelgiumFlanders < Belgium
    def area_code
      'BE[VLG]'
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
      1_141_541 + 554_454 + 988_820 + 679_125 + 807_929 	
    end

    def seat_distribution
      SEAT_DISTRIBUTION
    end

    private

    SEAT_DISTRIBUTION = { 'Antwerpen' => 24, 'Limburg' => 12,
                          'Oost-Vlaanderen' => 20, 'Vlaams-Brabant' => 15,
                          'West-Vlaanderen' => 16 }.freeze

    def election_results_of_2014
      if @election_results_of_2014.nil?
        @election_results_of_2014 = load_election_results(
          'belgium-flanders-2014.psv'
        )
      end
      @election_results_of_2014
    end
  end
end
