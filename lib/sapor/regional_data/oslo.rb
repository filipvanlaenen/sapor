# encoding: utf-8
#
# Statistical Analysis of Polling Results (SAPoR)
# Copyright (C) 2014 Filip van Laenen <f.a.vanlaenen@ieee.org>
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
  class Oslo
    include Singleton

    NO_OF_SEATS = 59

    ELECTORAL_SYSTEM = SingleDistrictProportional.new(NO_OF_SEATS,
                                                      SainteLague14Denominators)

    def area_code
      'NO-0301'
    end

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
       ['Arbeiderpartiet', 'Miljøpartiet de Grønne', 'Senterpartiet',
        'Sosialistisk Venstreparti'],
       ['Arbeiderpartiet', 'Rødt', 'Senterpartiet',
        'Sosialistisk Venstreparti'],
       ['Kristelig Folkeparti', 'Senterpartiet', 'Venstre']]
    end

    def population_size
      # Projection for the election of September 2015
      # Source: Statistics Norway, retrieved on 4 August 2015.
      # URL: https://www.ssb.no/valg/statistikker/stemmerettkomm/hvert-4-aar-forelopige/2015-04-13?fane=tabell&sort=nummer&tabell=223755
      511_400
    end

    def no_of_seats
      NO_OF_SEATS
    end

    def seats(simulation)
      ELECTORAL_SYSTEM.project(simulation)
    end

    # TODO: Remove
    def threshold
      nil
    end
  end
end
