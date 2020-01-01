# encoding: utf-8
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
  # The regional data for Belgium: the Flemish part.
  #
  class BelgiumFlanders < Belgium
    def area_code
      'BE[VLG]'
    end

    def overall_election_results_of_2019
      if @overall_election_results_of_2019.nil?
        @overall_election_results_of_2019 = \
          summarize_election_results(election_results_of_2019)
      end
      @overall_election_results_of_2019
    end

    def population_size
      # Voter turnout on 26 May 2019
      # Source: Web page with the official results of the elections of 26 May
      # 2019, downloaded on 6 August 2019,
      # https://verkiezingen2019.belgium.be/nl/verkiezingen?el=CK
      1_156_127 + 554_838 + 998_917 + 690_028 + 806_395 	
    end

    def seat_distribution
      SEAT_DISTRIBUTION
    end

    private

    SEAT_DISTRIBUTION = { 'Antwerpen' => 24, 'Limburg' => 12,
                          'Oost-Vlaanderen' => 20, 'Vlaams-Brabant' => 15,
                          'West-Vlaanderen' => 16 }.freeze

    def election_results_of_2019
      if @election_results_of_2019.nil?
        @election_results_of_2019 = load_election_results(
          'belgium-flanders-20190526.psv'
        )
      end
      @election_results_of_2019
    end
  end
end
