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
  # The regional data for the European Union: Bulgaria.
  #
  class EuropeanUnionBulgaria < Area
    include Singleton

    def area_code
      'EU[BG]'
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

    COALITIONS = [['Алтернатива за българско възраждане (S&D)', 'Българска социалистическа партия (S&D)',
                   'БСП – обединена левица (S&D)'],
                  ['Алианс за права и свободи (RE)', 'Движение за права и свободи (RE)',
                   'Движение за права и свободи – Ново начало (RE)', 'Продължаваме промяната (RE)',
                   'Национално движение за стабилност и възход (RE)'],
                  ['Да, България! (EPP)', 'Демократи за силна България (EPP)', 'Демократична България (EPP)',
                   'Граждани за европейско развитие на България (EPP)', 'Изправи се Бг (EPP)',
                   'Реформаторски блок (EPP)'],
                  ['Българските патриоти (ECR)', 'ВМРО–Българско Национално Движение (ECR)', 'Има такъв народ (ECR)',
                   'Обединени Патриоти (ECR)', 'Синя България (ECR)'],
                  ['Воля (PfE)', 'Воля–Национален фронт за спасение на България (PfE)'],
                  ['Възраждане (ESN)'],
                  ['Атака (NI)', 'Български възход (NI)'],
                  ['Левицата! (*)', 'Морал, Единство, Чест (*)', 'Национален фронт за спасение на България (*)',
                   'Републиканци за България (*)']].freeze

    ELECTORAL_ALLIANCES = [['Да, България! (EPP)', 'Демократична България (EPP)', 'Продължаваме промяната (RE)']]

    NO_OF_SEATS = 17

    # Voter turnout on 9 June 2024
    # https://en.wikipedia.org/wiki/2024_European_Parliament_election_in_Bulgaria#Results
    POPULATION_SIZE = 2_013_060

    THRESHOLD = 1 / NO_OF_SEATS.to_f

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = LargestRemainder.new(NO_OF_SEATS, HareQuota, THRESHOLD, false, 0, true, 0, [],
                                                 ELECTORAL_ALLIANCES)
      end
      @electoral_system
    end
  end
end
