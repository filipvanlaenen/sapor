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
  # The regional data for Estonia.
  #
  class Estonia < Area
    include Singleton

    def area_code
      'EE'
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

    EKRE_PARTY = 'Eesti Konservatiivne Rahvaerakond'.freeze
    EVA_PARTY = 'Eesti Vabaerakond'.freeze
    I_PARTY = 'Erakond Isamaa'.freeze
    KESK_PARTY = 'Eesti Keskerakond'.freeze
    REF_PARTY = 'Eesti Reformierakond'.freeze
    SDE_PARTY = 'Sotsiaaldemokraatlik Erakond'.freeze

    COALITIONS = [[EKRE_PARTY, I_PARTY, KESK_PARTY],
                  [EKRE_PARTY, I_PARTY, REF_PARTY],
                  [EKRE_PARTY, KESK_PARTY],
                  [EKRE_PARTY, KESK_PARTY, REF_PARTY],
                  [EKRE_PARTY, REF_PARTY],
                  [EKRE_PARTY, SDE_PARTY],
                  [EVA_PARTY, I_PARTY, REF_PARTY, SDE_PARTY],
                  [I_PARTY, KESK_PARTY, SDE_PARTY],
                  [I_PARTY, REF_PARTY],
                  [I_PARTY, REF_PARTY, SDE_PARTY],
                  [KESK_PARTY, REF_PARTY],
                  [KESK_PARTY, SDE_PARTY],
                  [REF_PARTY, SDE_PARTY]].freeze

    NO_OF_SEATS = 101

    # Voter turnout on 1 March 2015
    # https://en.wikipedia.org/wiki/Estonian_parliamentary_election,_2015
    POPULATION_SIZE = 577_910

    THRESHOLD = 0.05

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(
          NO_OF_SEATS,
          Dhondt09Denominators,
          THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
