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
  # The regional data for Greece.
  #
  class Greece < Area
    include Singleton
    def area_code
      'GR'
    end

    def coalitions
      [['ΣΥΡΙΖΑ'], %w(ΣΥΡΙΖΑ ΑΝΕΛ), %w(ΣΥΡΙΖΑ ΝΔ), %w(ΣΥΡΙΖΑ ΛΕ), %w(ΣΥΡΙΖΑ ΛΕ ΑΝΕΛ), ['ΝΔ', 'ΠΑΣΟΚ-ΔΗΜΑΡ', 'Το Ποτάμι']]
    end

    def no_of_seats
      NO_OF_PROPORTIONAL_SEATS + NO_OF_BONUS_SEATS
    end

    def population_size
      # Number of registered voters on 25 January 2015
      # Source: Greek legislative election, January 2015, retrieved on 31
      # August 2015.
      # URL: https://en.wikipedia.org/wiki/Greek_legislative_election,_January_2015
      9_949_684
    end

    def seats(simulation)
      SIMPLIFIED_ELECTORAL_SYSTEM.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    NO_OF_PROPORTIONAL_SEATS = 250
    NO_OF_BONUS_SEATS = 50

    THRESHOLD = 0.03

    SIMPLIFIED_ELECTORAL_SYSTEM = SingleDistrictProportional.new(\
      NO_OF_PROPORTIONAL_SEATS, SainteLague14Denominators, THRESHOLD,
      NO_OF_BONUS_SEATS)
  end
end
