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
  # The regional data for Belgium: the Walloon part.
  #
  class BelgiumWallonia < Belgium
    def area_code
      'BE[WAL]'
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
      738_490 + 626_365 + 169_717 + 299_512 + 239_869
    end

    def seat_distribution
      SEAT_DISTRIBUTION
    end

    private

    SEAT_DISTRIBUTION = { 'Brabant wallon' => 5, 'Hainaut' => 18, 'Liège' => 15,
                          'Luxembourg' => 4, 'Namur' => 6 }.freeze

    def election_results_of_2014
      if @election_results_of_2014.nil?
        @election_results_of_2014 = load_election_results(
          'belgium-wallonia-2014.psv'
        )
      end
      @election_results_of_2014
    end
  end
end
