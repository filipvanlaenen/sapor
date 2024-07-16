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
  # The regional data for the European Union: Finland.
  #
  class EuropeanUnionFinland < Area
    include Singleton

    def area_code
      'EU[FI]'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      NO_OF_SEATS
    end

    def population_size
      POPULATION_SIZE
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    private

    COALITIONS = [['Kansallinen Kokoomus (EPP)', 'Kristillisdemokraatit (EPP)'],
                  ['Liike Nyt (NI)'],
                  ['Perussuomalaiset (ECR)', 'Sininen tulevaisuus (ECR)'],
                  ['Suomen Keskusta (RE)', 'Svenska folkpartiet i Finland (RE)'],
                  ['Suomen Sosialidemokraattinen Puolue (S&D)'],
                  ['Valta kuuluu kansalle (*)'],
                  ['Vasemmistoliitto (GUE/NGL)'],
                  ['Vihreä liitto (Greens/EFA)']].freeze

    NO_OF_SEATS = 15

    # Voter turnout on 9 June 2024
    # https://en.wikipedia.org/wiki/2024_European_Parliament_election_in_Finland#Results
    POPULATION_SIZE = 1_829_249

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(no_of_seats, \
                                                           DhondtDenominators)
      end
      @electoral_system
    end
  end
end
