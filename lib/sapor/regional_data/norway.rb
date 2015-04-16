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
  # The regional data for Norway.
  #
  class Norway
    include Singleton

    # Source: NSD European Election Database, Parliamentary election of 2013, retrieved on 14 April 2015.
    # URL: http://eed.nsd.uib.no/webview/index.jsp?stubs=nuts_id&study=http%3A%2F%2F129.177.90.166%3A80%2Fobj%2FfStudy%2Fnopa2013&virtualslice=pv_p_value&measuretype=4&headers=party_name_org&mode=cube&v=2&party_name_orgsubset=1+-+9&cube=http%3A%2F%2F129.177.90.166%3A80%2Fobj%2FfCube%2Fnopa2013_C1&nuts_idsubset=NO%2CNO011+-+NO073&virtualsubset=pv_p_value&layers=virtual&measure=common&top=yes
    LAST_ELECTION_RESULT = { 'Arbeiderpartiet' => 874_769,
                             'Høyre' => 760_232,
                             'Fremskrittspartiet' => 463_560,
                             'Kristelig Folkeparti' => 158_475,
                             'Senterpartiet' => 155_357,
                             'Venstre' => 148_275,
                             'Sosialistisk Venstreparti' => 116_021,
                             'Miljøpartiet de Grønne' => 79_152,
                             'Rødt' => 30_751,
                             'De Kristne' => 17_731,                             'Pensjonistpartiet' => 11_865,                             'Piratpartiet' => 9_869,                             'Kystpartiet' => 3_311,                             'Demokratene i Norge' => 2_214,                             'Kristent Samlingsparti' => 1_722,                             'Det Liberale Folkepartiet' => 909,                             'Norges Kommunistiske Parti' => 611,                             'Sykehus til Alta' => 467,                             'Samfunnspartiet' => 295,                             'Folkeliste mot oljeboring i Lofoten, Vesterålen og Senja' => 268,                             'Folkemakten' => 175 }

    # Source: NSD European Election Database, Parliamentary election of 2013, retrieved on 14 April 2015.
    # URL: http://eed.nsd.uib.no/webview/index.jsp?stubs=nuts_id&study=http%3A%2F%2F129.177.90.166%3A80%2Fobj%2FfStudy%2Fnopa2013&virtualslice=pv_p_value&measuretype=4&headers=party_name_org&mode=cube&v=2&party_name_orgsubset=1+-+9&cube=http%3A%2F%2F129.177.90.166%3A80%2Fobj%2FfCube%2Fnopa2013_C1&nuts_idsubset=NO%2CNO011+-+NO073&virtualsubset=pv_p_value&layers=virtual&measure=common&top=yes
    LAST_DETAILED_ELECTION_RESULT = {
      'Oslo' => { 'Arbeiderpartiet' => 106_001,
                  'Høyre' => 103_834,
                  'Fremskrittspartiet' => 40_660,
                  'Kristelig Folkeparti' => 9_850,
                  'Senterpartiet' => 2_963,
                  'Venstre' => 28_619,
                  'Sosialistisk Venstreparti' => 21_924,
                  'Miljøpartiet de Grønne' => 19_356,
                  'Rødt' => 11_133,
                  'De Kristne' => 734,                  'Pensjonistpartiet' => 1_172,                  'Piratpartiet' => 1_357,                  'Kystpartiet' => 126,                  'Demokratene i Norge' => 236,                  'Kristent Samlingsparti' => 97,                  'Det Liberale Folkepartiet' => 267,                  'Norges Kommunistiske Parti' => 143,                  'Samfunnspartiet' => 70 }
    }

    # Source: Valg i Norge, Valgkretser, Wikipedia, retrieved 16 April 2015 
    # URL: http://no.wikipedia.org/wiki/Valg_i_Norge#Valgkretser
    SEAT_DISTRIBUTION = { 'Akershus' => 19,
                          'Hordaland' => 17,
                          'Oslo' => 21,
                          'Rogaland' => 15,
                          'Sør-Trøndelag' => 10,
                          'Østfold' => 9 }

    # TODO: Change to NorwegianElectoralSystem
    ELECTORAL_SYSTEM = Proportional.new(LAST_ELECTION_RESULT,
                                        LAST_DETAILED_ELECTION_RESULT,
                                        SEAT_DISTRIBUTION)

    def area_code
      'NO'
    end

    def population_size
      # Source: NSD European Election Database, Norway, retrieved on 14 April 2015.
      # URL: http://www.nsd.uib.no/european_election_database/country/norway/
      2_836_029
    end

    def no_of_seats
      169
    end

    def seats(simulation)
      ELECTORAL_SYSTEM.project(simulation)
    end
  end
end
