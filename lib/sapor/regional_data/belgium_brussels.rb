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
  # The regional data for Belgium: the Brussels part.
  #
  class BelgiumBrussels < Belgium
    def area_code
      'BE[BRU]'
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
    # https://verkiezingsresultaten.belgium.be/nl/election-results/kamer-van-volksvertegenwoordigers/2024/kieskring/250990
    def population_size
       518_926
    end

    def seat_distribution
      SEAT_DISTRIBUTION
    end

    private

    SEAT_DISTRIBUTION = { 'Bruxelles-Capitale / Brussel-Hoofdstad' => 16 }.freeze

    def election_results_of_2024
      if @election_results_of_2024.nil?
        @election_results_of_2024 = load_election_results(
          'belgium-brussels-20240609.psv'
        )
      end
      @election_results_of_2024
    end
  end
end
