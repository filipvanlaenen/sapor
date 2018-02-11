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
  # The regional data for the European Union: Italy.
  #
  class EuropeanUnionItaly < Area
    include Singleton

    def area_code
      'EU[IT]'
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
      seats = electoral_system.project(simulation)
      seats['Südtiroler Volkspartei (EPP)'] = NO_OF_SVP_SEATS
      seats['Partito Democratico (S&D)'] -= NO_OF_SVP_SEATS
      seats
    end

    private

    COALITIONS = [['CasaPound Italia (—)', 'Civica Popolare (—)',
                   'Fratelli d’Italia (—)', 'Insieme (—)',
                   'Noi con l’Italia (—)', 'Più Europa (—)'],
                  ['Forza Italia (EPP)', 'Südtiroler Volkspartei (EPP)'],
                  ['Lega Nord (ENF)'],
                  ['Liberi e Uguali (S&D)', 'Partito Democratico (S&D)'],
                  ['Movimento 5 Stelle (EFDD)'],
                  ['Potere al Popolo (GUE/NGL)']].freeze

    NO_OF_SEATS = 73

    NO_OF_SVP_SEATS = 1

    # Voter turnout on 25 May 2014
    # Source: Web page with the official results of the elections of 25 May
    # 2014, downloaded on 11 February 2018,
    # https://en.wikipedia.org/wiki/European_Parliament_election,_2014_(Italy)
    POPULATION_SIZE = 27_448_906

    THRESHOLD = 0.04

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = LargestRemainder.new(NO_OF_SEATS, HareQuota,
                                                 THRESHOLD)
      end
      @electoral_system
    end
  end
end
