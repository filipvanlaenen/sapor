
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
  # The regional data for Greece.
  #
  class Greece < Area
    include Singleton
    def area_code
      'GR'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      NO_OF_PROPORTIONAL_SEATS + NO_OF_BONUS_SEATS
    end

    def population_size
      POPULATION_SIZE
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    ANEL_PARTY = 'Ανεξάρτητοι Έλληνες'.freeze
    EL_PARTY = 'Ελληνική Λύση'.freeze
    KINAL_PARTY = 'Κίνημα Αλλαγής'.freeze
    LE_PARTY = 'Λαϊκή Ενότητα'.freeze
    MERA_PARTY = 'Μέτωπο Ευρωπαϊκής Ρεαλιστικής Ανυπακοής'.freeze
    ND_PARTY = 'Νέα Δημοκρατία'.freeze
    POTAMI_PARTY = 'Το Ποτάμι'.freeze
    SYRIZA_PARTY = 'Συνασπισμός Ριζοσπαστικής Αριστεράς'.freeze

    COALITIONS = [[ANEL_PARTY, LE_PARTY, SYRIZA_PARTY],
                  [ANEL_PARTY, SYRIZA_PARTY],
                  [KINAL_PARTY, ND_PARTY, POTAMI_PARTY],
                  [KINAL_PARTY, ND_PARTY],
                  [LE_PARTY, SYRIZA_PARTY],
                  [MERA_PARTY, SYRIZA_PARTY],
                  [ND_PARTY],
                  [ND_PARTY, POTAMI_PARTY],
                  [SYRIZA_PARTY]].freeze

    NO_OF_PROPORTIONAL_SEATS = 250

    NO_OF_BONUS_SEATS = 50

    # Number of registered voters on 7 July 2019
    # Source: Greek legislative election, 7 July 2019, retrieved on 27
    # December 2019.
    # URL: https://en.wikipedia.org/wiki/2019_Greek_legislative_election
    POPULATION_SIZE = 5_769_542

    THRESHOLD = 0.03

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = LargestRemainder.new(NO_OF_PROPORTIONAL_SEATS,
                                                 HareQuota, THRESHOLD, false,
                                                 NO_OF_BONUS_SEATS, false)
      end
      @electoral_system
    end
  end
end
