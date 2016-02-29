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
  # The regional data for Oslo.
  #
  class NorwegianMunicipality < Area
    attr_reader :area_code, :no_of_seats, :population_size

    def initialize(municipality_key, population_size, no_of_seats)
      @area_code = 'NO-' + municipality_key
      @population_size = population_size
      @no_of_seats = no_of_seats
      @electoral_system  = SingleDistrictProportional.new( \
        no_of_seats, SainteLague14Denominators)
    end

    # Population sizes are equal to the electorate of 2013.
    # Source: https://www.regjeringen.no/html/kmd/valgresultat/2013/bss.html
    # Exception: Oslo, for which there is a projection for 2015.
    # Source:
    # https://www.ssb.no/valg/statistikker/stemmerettkomm/hvert-4-aar-forelopige/2015-04-13?fane=tabell&sort=nummer&tabell=223755
    BERGEN = NorwegianMunicipality.new('1201', 193_348, 67)
    OSLO = NorwegianMunicipality.new('0301', 511_400, 59)
    TRONDHEIM = NorwegianMunicipality.new('1601', 131_524, 67)

    def coalitions
      [['Høyre', 'Kristelig Folkeparti', 'Venstre'],
       %w(Fremskrittspartiet Høyre),
       ['Fremskrittspartiet', 'Høyre', 'Kristelig Folkeparti', 'Venstre'],
       ['Fremskrittspartiet', 'Høyre', 'Kristelig Folkeparti',
        'Miljøpartiet de Grønne', 'Venstre'],
       ['Fremskrittspartiet', 'Høyre', 'Kristelig Folkeparti', 'Senterpartiet',
        'Venstre'],
       ['Arbeiderpartiet', 'Senterpartiet', 'Sosialistisk Venstreparti'],
       ['Arbeiderpartiet', 'Miljøpartiet de Grønne', 'Rødt', 'Senterpartiet',
        'Sosialistisk Venstreparti'],
       ['Arbeiderpartiet', 'Kristelig Folkeparti', 'Miljøpartiet de Grønne',
        'Senterpartiet', 'Sosialistisk Venstreparti'],
       ['Arbeiderpartiet', 'Miljøpartiet de Grønne', 'Senterpartiet',
        'Sosialistisk Venstreparti'],
       ['Arbeiderpartiet', 'Rødt', 'Senterpartiet',
        'Sosialistisk Venstreparti'],
       ['Kristelig Folkeparti', 'Senterpartiet', 'Venstre']]
    end

    def seats(simulation)
      @electoral_system.project(simulation)
    end
  end
end
