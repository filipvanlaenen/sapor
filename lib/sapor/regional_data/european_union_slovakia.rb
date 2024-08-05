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
  # The regional data for the European Union: Slovakia.
  #
  class EuropeanUnionSlovakia < Area
    include Singleton

    def area_code
      'EU[SK]'
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
    
    COALITIONS = [['Progresívne Slovensko (RE)'],
                  ['Demokrati (EPP)', 'Kresťanskodemokratické hnutie (EPP)', 'Magyar Fórum (EPP)',
                   'MODRÍ–Európske Slovensko (EPP)', 'MODRÍ–Európske Slovensko–MOST–HÍD (EPP)', 'MOST–HÍD (EPP)',
                   'Slovensko (EPP)', 'Slovensko–Za ľudí (EPP)', 'Magyar Szövetség (EPP)', 'Za ľudí (EPP)'],
                  ['Kresťanská únia (ECR)', 'NOVA (ECR)', 'Sloboda a Solidarita (ECR)'],
                  ['Slovenská národná strana (PfE)', 'SME RODINA (PfE)'],
                  ['REPUBLIKA (ESN)'], 
                  ['HLAS–sociálna demokracia (NI)', 'HLAS–sociálna demokracia–Dobrá voľba (NI)',
                   'Kotleba–Ľudová strana Naše Slovensko (NI)', 'SMER–sociálna demokracia (NI)'],
                  ['Dobrá voľba (*)', 'VLASŤ (*)', 'ZDRAVÝ ROZUM (*)']].freeze

    NO_OF_SEATS = 15

    # Voter turnout on 8 June 2024
    # https://en.wikipedia.org/wiki/2024_European_Parliament_election_in_Slovakia#Results
    POPULATION_SIZE = 1_476_968

    THRESHOLD = 0.05

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = LargestRemainder.new(no_of_seats,
                                                 HagenbachBischoffQuota,
                                                 THRESHOLD, false, 0, false)
      end
      @electoral_system
    end
  end
end
