# frozen_string_literal: true

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
  # The regional data for Cyprus.
  #
  class Cyprus < Area
    include Singleton
    def area_code
      'CY'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      NO_OF_SEATS
    end

    def population_size
      # Voter turnout on 22 May 2016
      351_389
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    AKEL_PARTY = 'Ανορθωτικό Κόμμα Εργαζόμενου Λαού'
    DIKO_PARTY = 'Δημοκρατικό Κόμμα'
    DISY_PARTY = 'Δημοκρατικός Συναγερμός'
    EDEK_PARTY = 'Κίνημα Σοσιαλδημοκρατών'
    ELAM_PARTY = 'Εθνικό Λαϊκό Μέτωπο'
    KA_PARTY = 'Κίνημα Αλληλεγγύη'
    KOSP_PARTY = 'Κίνημα Οικολόγων–Συνεργασία Πολιτών'
    SYPOL_PARTY = 'Συμμαχία Πολιτών'

    COALITIONS = [[]].freeze

    NO_OF_SEATS = 56

    THRESHOLD = 0.036

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = LargestRemainder.new(no_of_seats, HareQuota,
                                                 THRESHOLD, false, 0, false)
      end
      @electoral_system
    end
  end
end
