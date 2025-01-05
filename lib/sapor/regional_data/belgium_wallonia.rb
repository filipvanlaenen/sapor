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
  # The regional data for Belgium: the Walloon part.
  #
  class BelgiumWallonia < Belgium
    def area_code
      'BE[WAL]'
    end

    def overall_election_results_of_2024
      if @overall_election_results_of_2024.nil?
        @overall_election_results_of_2024 = \
          summarize_election_results(election_results_of_2024)
      end
      @overall_election_results_of_2024
    end

    # Voter turnout on 9 June 2024
    # Source: Web page with the official results of the elections of 9 June 2024, downloaded on 5 January 2025,
    # https://verkiezingsresultaten.belgium.be/nl/search/kamer-van-volksvertegenwoordigers/2024/kieskring
    def population_size
       739_851 + 631_915 + 175_409 + 312_175 + 256_272
    end

    def seat_distribution
      SEAT_DISTRIBUTION
    end

    private

    SEAT_DISTRIBUTION = { 'Brabant wallon' => 5, 'Hainaut' => 17, 'Liège' => 14, 'Luxembourg' => 4,
                          'Namur' => 7 }.freeze

    def election_results_of_2024
      if @election_results_of_2024.nil?
        @election_results_of_2024 = load_election_results(
          'belgium-wallonia-20240609.psv'
        )
      end
      @election_results_of_2024
    end
  end
end
