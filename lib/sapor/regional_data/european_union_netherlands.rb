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
  # The regional data for the European Union: the Netherlands.
  #
  class EuropeanUnionNetherlands < Area
    include Singleton

    def area_code
      'EU[NL]'
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

	def threshold
	  1 / no_of_seats.to_f
	end

    private

    COALITIONS = [['Partij voor de Dieren (GUE/NGL)', 'Socialistische Partij (GUE/NGL)'],
                  ['GroenLinks (Greens/EFA)', 'Volt Europa (Greens/EFA)'],
                  ['Partij van de Arbeid (S&D)'],
                  ['Democraten 66 (RE)', 'Volkspartij voor Vrijheid en Democratie (RE)'],
                  ['50Plus (EPP)', 'BoerBurgerBeweging (EPP)', 'Christen-Democratisch Appèl (EPP)',
                   'ChristenUnie (EPP)', 'Nieuw Sociaal Contract (EPP)'],
                  ['Staatkundig Gereformeerde Partij (ECR)', 'Juiste Antwoord 2021 (ECR)'],
                  ['Partij voor de Vrijheid (PfE)'],
                  ['Forum voor Democratie (ESN)'],
                  ['Belang van Nederland (*)', 'Bij1 (*)', 'Code Oranje (*)', 'DENK (*)', 'Partij voor de Toekomst (*)',
                   'Piratenpartij (*)', 'Splinter (*)']].freeze

    ELECTORAL_ALLIANCES = [['GroenLinks (Greens/EFA)', 'Partij van de Arbeid (S&D)']]

    NO_OF_SEATS = 31

    # Voter turnout on 6 June 2024
    # https://en.wikipedia.org/wiki/2024_European_Parliament_election_in_the_Netherlands#Results
    POPULATION_SIZE = 6_232_198

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(no_of_seats, DhondtDenominators, threshold, 0, false, 1, [],
                                                           [], ELECTORAL_ALLIANCES)
      end
      @electoral_system
    end
  end
end
