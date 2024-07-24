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
  # The regional data for the European Union: Romania.
  #
  class EuropeanUnionRomania < Area
    include Singleton

    def area_code
      'EU[RO]'
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

    COALITIONS = [['Alianța 2020 USR-PLUS (RE)', 'Partidul Libertății, Unității și Solidarității (RE)',
                   'Reînnoim Proiectul European al României (RE)', 'Uniunea Salvați România (RE)'],
                  ['Alianța pentru Patrie (*)', 'Blocul Suveranist Român (*)',
                   'Partidul Alianța Liberalilor și Democraților (*)', 'Partidul Ecologist Român (*)'],
                  ['Alianța pentru Unirea Românilor (ECR)'], 
                  ['Forța Dreptei (EPP)', 'Partidul Mișcarea Populară (EPP)', 'Partidul Național Liberal (EPP)',
                   'Uniunea Democrată Maghiară din România (EPP)'],
                  ['Partidul Puterii Umaniste (social-liberal) (S&D)', 'Partidul Social Democrat (S&D)',
                   'PRO România (S&D)'],
                  ['Partidul S.O.S. România (NI)'],
                  ['Alianța AER pentru România (Greens/EFA)', 'Partidul Verde (Greens/EFA)']].freeze

    NO_OF_SEATS = 33

    # Voter turnout on 9 June 2024
    # https://en.wikipedia.org/wiki/2024_European_Parliament_election_in_Romania#Results
    POPULATION_SIZE = 8_942_099

    THRESHOLD = 0.05

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(NO_OF_SEATS, DhondtDenominators, THRESHOLD, 0, false)
      end
      @electoral_system
    end
  end
end
