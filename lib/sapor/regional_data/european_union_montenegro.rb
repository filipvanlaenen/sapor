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
  # The regional data for the European Union: Montenegro.
  #
  class EuropeanUnionMontenegro < Area
    include Singleton

    def area_code
      'EU[ME]'
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

    COALITIONS = [['Građanski pokret Ujedinjena reformska akcija (Greens/EFA)'],
                  ['Demokratska partija socijalista Crne Gore (S&D)', 'Evropski savez (S&D)',
                   'Социјалистичка народна партија Црне Горе (S&D)'],
                  ['Bošnjačka stranka (EPP)', 'Demokratska Crna Gora (EPP)', 'Pokret Evropa sad (EPP)'],
                  ['Pokret za promjene (ECR)'],
                  ['Alternativa Shqiptare (NI)', 'Демократска народна партија (NI)', 'Нова српска демократија (NI)'],
                  ['Forca e Re Demokratike (*)', 'Pozitivna Crna Gora (*)', 'Pravda za sve (*)',
                   'Preokret za sigurnu Crnu Goru (*)', 'Unioni Demokratik i Shqiptarëve (*)',
                   'Покрет народног повјерења (*)', 'Уједињена Црна Гора (*)']].freeze

	ELECTORAL_ALLIANCES = [['Демократска народна партија (NI)', 'Нова српска демократија (NI)']]

    NO_OF_SEATS = 6

    # Voter turnout on 11 June 2023
    # https://en.wikipedia.org/wiki/2023_Montenegrin_parliamentary_election#Results
    POPULATION_SIZE = 302_416	

    THRESHOLD = 0.03

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(no_of_seats, DhondtDenominators, threshold, 0, false, 1, [],
                                                           [], ELECTORAL_ALLIANCES)
      end
      @electoral_system
    end
  end
end
