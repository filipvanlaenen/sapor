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
  # The regional data for Slovenia.
  #
  class Slovenia < Area
    include Singleton

    def area_code
      'SI'
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
      seats['Hungarian and Italian minorities'] = \
        NO_OF_HUNGARIAN_AND_ITALIAN_SEATS
      seats
    end

    private

    COALITIONS = [['Demokratična stranka upokojencev Slovenije',
                   'Državljanska lista', 'Nova Slovenija–Krščanski demokrati',
                   'Slovenska demokratska stranka',
                   'Slovenska ljudska stranka'],
                  ['Demokratična stranka upokojencev Slovenije',
                   'Državljanska lista', 'Pozitivna Slovenija',
                   'Socialni demokrati'],
                  ['Demokratična stranka upokojencev Slovenije',
                   'Lista Marjana Šarca', 'Slovenska demokratska stranka'],
                  ['Demokratična stranka upokojencev Slovenije',
                   'Lista Marjana Šarca', 'Socialni demokrati'],
                  ['Demokratična stranka upokojencev Slovenije',
                   'Lista Marjana Šarca', 'Nova Slovenija–Krščanski demokrati',
                   'Socialni demokrati'],
                  ['Demokratična stranka upokojencev Slovenije',
                   'Lista Marjana Šarca', 'Nova Slovenija–Krščanski demokrati',
                   'Socialni demokrati', 'Stranka Alenke Bratušek',
                   'Stranka modernega centra'],
                  ['Demokratična stranka upokojencev Slovenije',
                   'Lista Marjana Šarca', 'Nova Slovenija–Krščanski demokrati',
                   'Socialni demokrati', 'Stranka modernega centra'],
                  ['Demokratična stranka upokojencev Slovenije',
                   'Lista Marjana Šarca', 'Socialni demokrati',
                   'Stranka Alenke Bratušek', 'Stranka modernega centra'],
                  ['Demokratična stranka upokojencev Slovenije',
                   'Lista Marjana Šarca', 'Socialni demokrati',
                   'Stranka modernega centra'],
                  ['Demokratična stranka upokojencev Slovenije',
                   'Socialni demokrati', 'Stranka modernega centra'],
                  ['Pozitivna Slovenija', 'Socialni demokrati',
                   'Stranka modernega centra'],
                  ['Lista Marjana Šarca', 'Nova Slovenija–Krščanski demokrati',
                   'Socialni demokrati'],
                  ['Lista Marjana Šarca', 'Nova Slovenija–Krščanski demokrati',
                   'Socialni demokrati', 'Stranka modernega centra'],
                  ['Lista Marjana Šarca', 'Slovenska demokratska stranka'],
                  ['Lista Marjana Šarca', 'Socialni demokrati'],
                  ['Lista Marjana Šarca', 'Socialni demokrati',
                   'Stranka modernega centra']].freeze

    NO_OF_SEATS = 90
    NO_OF_HUNGARIAN_AND_ITALIAN_SEATS = 2

    # Voter turnout on 13 July 2014
    # Source: Web page with the official results of the elections of 13 July
    # 2014, downloaded on 28 April 2018,
    # https://en.wikipedia.org/wiki/Slovenian_parliamentary_election,_2014
    POPULATION_SIZE = 874_291

    THRESHOLD = 0.04

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(
          NO_OF_SEATS - NO_OF_HUNGARIAN_AND_ITALIAN_SEATS,
          DhondtDenominators,
          THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
