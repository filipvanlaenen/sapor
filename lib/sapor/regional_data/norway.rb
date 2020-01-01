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
  # The regional data for Norway.
  #
  class Norway < Area
    include Singleton

    # Source: NSD European Election Database, Parliamentary election of 2013,
    # retrieved on 14 April 2015.
    # URL: http://eed.nsd.uib.no/webview/index.jsp?stubs=nuts_id&study=http%3A%2F%2F129.177.90.166%3A80%2Fobj%2FfStudy%2Fnopa2013&virtualslice=pv_p_value&measuretype=4&headers=party_name_org&mode=cube&v=2&party_name_orgsubset=1+-+9&cube=http%3A%2F%2F129.177.90.166%3A80%2Fobj%2FfCube%2Fnopa2013_C1&nuts_idsubset=NO%2CNO011+-+NO073&virtualsubset=pv_p_value&layers=virtual&measure=common&top=yes
    LAST_DETAILED_ELECTION_RESULT = {
      'Akershus' => { 'Arbeiderpartiet' => 91_364,
                      'Høyre' => 108_860,
                      'Fremskrittspartiet' => 54_658,
                      'Kristelig Folkeparti' => 10_377,
                      'Senterpartiet' => 8_111,
                      'Venstre' => 20_217,
                      'Sosialistisk Venstreparti' => 11_305,
                      'Miljøpartiet de Grønne' => 9_804,
                      'Rødt' => 2_365,
                      'De Kristne' => 792,
                      'Pensjonistpartiet' => 1_557,
                      'Piratpartiet' => 1_106,
                      'Kystpartiet' => 149,
                      'Demokratene i Norge' => 115,
                      'Kristent Samlingsparti' => 197,
                      'Det Liberale Folkepartiet' => 195,
                      'Samfunnspartiet' => 77 },
      'Aust-Agder' => { 'Arbeiderpartiet' => 17_623,
                        'Høyre' => 16_303,
                        'Fremskrittspartiet' => 11_278,
                        'Kristelig Folkeparti' => 7_019,
                        'Senterpartiet' => 2_815,
                        'Venstre' => 3_033,
                        'Sosialistisk Venstreparti' => 1_652,
                        'Miljøpartiet de Grønne' => 1_242,
                        'Rødt' => 345,
                        'De Kristne' => 862,
                        'Pensjonistpartiet' => 354,
                        'Piratpartiet' => 176,
                        'Kystpartiet' => 35,
                        'Demokratene i Norge' => 46,
                        'Kristent Samlingsparti' => 117 },
      'Buskerud' => { 'Arbeiderpartiet' => 47_572,
                      'Høyre' => 43_515,
                      'Fremskrittspartiet' => 27_854,
                      'Kristelig Folkeparti' => 4_863,
                      'Senterpartiet' => 9_110,
                      'Venstre' => 6_913,
                      'Sosialistisk Venstreparti' => 4_094,
                      'Miljøpartiet de Grønne' => 3_345,
                      'Rødt' => 905,
                      'De Kristne' => 736,
                      'Piratpartiet' => 508,
                      'Kystpartiet' => 135,
                      'Demokratene i Norge' => 80,
                      'Kristent Samlingsparti' => 125,
                      'Samfunnspartiet' => 56 },
      'Finnmark' => { 'Arbeiderpartiet' => 15_003,
                      'Høyre' => 8_032,
                      'Fremskrittspartiet' => 6_038,
                      'Kristelig Folkeparti' => 1_117,
                      'Senterpartiet' => 1_403,
                      'Venstre' => 1_359,
                      'Sosialistisk Venstreparti' => 1_952,
                      'Miljøpartiet de Grønne' => 844,
                      'Rødt' => 351,
                      'De Kristne' => 335,
                      'Piratpartiet' => 144,
                      'Kystpartiet' => 550,
                      'Demokratene i Norge' => 23,
                      'Kristent Samlingsparti' => 41,
                      'Sykehus til Alta' => 467 },
      'Hedmark' => { 'Arbeiderpartiet' => 48_694,
                     'Høyre' => 20_600,
                     'Fremskrittspartiet' => 15_316,
                     'Kristelig Folkeparti' => 2_871,
                     'Senterpartiet' => 11_483,
                     'Venstre' => 3_805,
                     'Sosialistisk Venstreparti' => 4_393,
                     'Miljøpartiet de Grønne' => 2_224,
                     'Rødt' => 773,
                     'De Kristne' => 414,
                     'Pensjonistpartiet' => 1_719,
                     'Piratpartiet' => 311,
                     'Kystpartiet' => 57,
                     'Demokratene i Norge' => 63 },
      'Hordaland' => { 'Arbeiderpartiet' => 71_216,
                       'Høyre' => 89_682,
                       'Fremskrittspartiet' => 43_357,
                       'Kristelig Folkeparti' => 22_114,
                       'Senterpartiet' => 12_490,
                       'Venstre' => 16_614,
                       'Sosialistisk Venstreparti' => 14_143,
                       'Miljøpartiet de Grønne' => 9_171,
                       'Rødt' => 2_687,
                       'De Kristne' => 2_422,
                       'Pensjonistpartiet' => 631,
                       'Piratpartiet' => 1_062,
                       'Kystpartiet' => 267,
                       'Demokratene i Norge' => 275,
                       'Norges Kommunistiske Parti' => 127,
                       'Folkemakten' => 175 },
      'Møre og Romsdal' => { 'Arbeiderpartiet' => 36_048,
                             'Høyre' => 37_594,
                             'Fremskrittspartiet' => 28_746,
                             'Kristelig Folkeparti' => 12_786,
                             'Senterpartiet' => 11_749,
                             'Venstre' => 7_965,
                             'Sosialistisk Venstreparti' => 3_532,
                             'Miljøpartiet de Grønne' => 1_963,
                             'Rødt' => 642,
                             'De Kristne' => 1_534,
                             'Piratpartiet' => 479,
                             'Kystpartiet' => 159,
                             'Demokratene i Norge' => 94 },
      'Nord-Trøndelag' => { 'Arbeiderpartiet' => 32_054,
                            'Høyre' => 11_128,
                            'Fremskrittspartiet' => 9_869,
                            'Kristelig Folkeparti' => 2_707,
                            'Senterpartiet' => 12_796,
                            'Venstre' => 3_158,
                            'Sosialistisk Venstreparti' => 2_596,
                            'Miljøpartiet de Grønne' => 1_051,
                            'Rødt' => 423,
                            'De Kristne' => 283,
                            'Piratpartiet' => 209,
                            'Kystpartiet' => 81,
                            'Demokratene i Norge' => 38,
                            'Kristent Samlingsparti' => 107 },
      'Nordland' => { 'Arbeiderpartiet' => 46_743,
                      'Høyre' => 28_271,
                      'Fremskrittspartiet' => 25_020,
                      'Kristelig Folkeparti' => 4_886,
                      'Senterpartiet' => 9_237,
                      'Venstre' => 4_938,
                      'Sosialistisk Venstreparti' => 6_907,
                      'Miljøpartiet de Grønne' => 2_653,
                      'Rødt' => 2_164,
                      'De Kristne' => 698,
                      'Pensjonistpartiet' => 416,
                      'Piratpartiet' => 451,
                      'Kystpartiet' => 424,
                      'Demokratene i Norge' => 60,
                      'Norges Kommunistiske Parti' => 58,
                      'Samfunnspartiet' => 92,
                      'Folkeliste mot oljeboring i Lofoten, Vesterålen og' \
                      ' Senja' => 268 },
      'Oppland' => { 'Arbeiderpartiet' => 44_050,
                     'Høyre' => 20_537,
                     'Fremskrittspartiet' => 13_683,
                     'Kristelig Folkeparti' => 3_418,
                     'Senterpartiet' => 13_162,
                     'Venstre' => 4_248,
                     'Sosialistisk Venstreparti' => 3_165,
                     'Miljøpartiet de Grønne' => 2_583,
                     'Rødt' => 817,
                     'De Kristne' => 460,
                     'Pensjonistpartiet' => 802,
                     'Piratpartiet' => 298,
                     'Kystpartiet' => 74,
                     'Demokratene i Norge' => 54,
                     'Det Liberale Folkepartiet' => 58 },
      'Oslo' => { 'Arbeiderpartiet' => 106_001,
                  'Høyre' => 103_834,
                  'Fremskrittspartiet' => 40_660,
                  'Kristelig Folkeparti' => 9_850,
                  'Senterpartiet' => 2_963,
                  'Venstre' => 28_619,
                  'Sosialistisk Venstreparti' => 21_924,
                  'Miljøpartiet de Grønne' => 19_356,
                  'Rødt' => 11_133,
                  'De Kristne' => 734,
                  'Pensjonistpartiet' => 1_172,
                  'Piratpartiet' => 1_357,
                  'Kystpartiet' => 126,
                  'Demokratene i Norge' => 236,
                  'Kristent Samlingsparti' => 97,
                  'Det Liberale Folkepartiet' => 267,
                  'Norges Kommunistiske Parti' => 143,
                  'Samfunnspartiet' => 70 },
      'Rogaland' => { 'Arbeiderpartiet' => 54_462,
                      'Høyre' => 72_470,
                      'Fremskrittspartiet' => 45_082,
                      'Kristelig Folkeparti' => 25_585,
                      'Senterpartiet' => 12_621,
                      'Venstre' => 10_827,
                      'Sosialistisk Venstreparti' => 7_908,
                      'Miljøpartiet de Grønne' => 5_267,
                      'Rødt' => 1_060,
                      'De Kristne' => 2_296,
                      'Pensjonistpartiet' => 1_191,
                      'Piratpartiet' => 865,
                      'Kystpartiet' => 202,
                      'Demokratene i Norge' => 115,
                      'Kristent Samlingsparti' => 351,
                      'Det Liberale Folkepartiet' => 226,
                      'Norges Kommunistiske Parti' => 67 },
      'Sogn og Fjordane' => { 'Arbeiderpartiet' => 17_183,
                              'Høyre' => 11_635,
                              'Fremskrittspartiet' => 6_608,
                              'Kristelig Folkeparti' => 4_952,
                              'Senterpartiet' => 12_619,
                              'Venstre' => 3_883,
                              'Sosialistisk Venstreparti' => 2_076,
                              'Miljøpartiet de Grønne' => 1_032,
                              'Rødt' => 386,
                              'De Kristne' => 515,
                              'Piratpartiet' => 151,
                              'Kystpartiet' => 100,
                              'Demokratene i Norge' => 32 },
      'Sør-Trøndelag' => { 'Arbeiderpartiet' => 64_351,
                           'Høyre' => 38_930,
                           'Fremskrittspartiet' => 23_871,
                           'Kristelig Folkeparti' => 6_562,
                           'Senterpartiet' => 11_351,
                           'Venstre' => 9_460,
                           'Sosialistisk Venstreparti' => 9_992,
                           'Miljøpartiet de Grønne' => 5_540,
                           'Rødt' => 1_667,
                           'De Kristne' => 522,
                           'Pensjonistpartiet' => 1_590,
                           'Piratpartiet' => 857,
                           'Kystpartiet' => 139,
                           'Demokratene i Norge' => 210,
                           'Kristent Samlingsparti' => 129,
                           'Det Liberale Folkepartiet' => 98,
                           'Norges Kommunistiske Parti' => 97 },
      'Telemark' => { 'Arbeiderpartiet' => 35_963,
                      'Høyre' => 21_300,
                      'Fremskrittspartiet' => 18_564,
                      'Kristelig Folkeparti' => 6_610,
                      'Senterpartiet' => 4_360,
                      'Venstre' => 3_393,
                      'Sosialistisk Venstreparti' => 3_192,
                      'Miljøpartiet de Grønne' => 2_116,
                      'Rødt' => 884,
                      'De Kristne' => 1_017,
                      'Piratpartiet' => 239,
                      'Kystpartiet' => 68,
                      'Demokratene i Norge' => 56,
                      'Kristent Samlingsparti' => 116 },
      'Troms' => { 'Arbeiderpartiet' => 27_436,
                   'Høyre' => 19_663,
                   'Fremskrittspartiet' => 17_315,
                   'Kristelig Folkeparti' => 3_659,
                   'Senterpartiet' => 5_636,
                   'Venstre' => 3_687,
                   'Sosialistisk Venstreparti' => 5_688,
                   'Miljøpartiet de Grønne' => 2_190,
                   'Rødt' => 1_608,
                   'De Kristne' => 322,
                   'Piratpartiet' => 382,
                   'Kystpartiet' => 477,
                   'Demokratene i Norge' => 37,
                   'Kristent Samlingsparti' => 92,
                   'Norges Kommunistiske Parti' => 78 },
      'Vest-Agder' => { 'Arbeiderpartiet' => 23_227,
                        'Høyre' => 26_818,
                        'Fremskrittspartiet' => 17_863,
                        'Kristelig Folkeparti' => 13_536,
                        'Senterpartiet' => 2_962,
                        'Venstre' => 4_205,
                        'Sosialistisk Venstreparti' => 2_568,
                        'Miljøpartiet de Grønne' => 2_196,
                        'Rødt' => 460,
                        'De Kristne' => 1_975,
                        'Pensjonistpartiet' => 881,
                        'Piratpartiet' => 284,
                        'Kystpartiet' => 43,
                        'Demokratene i Norge' => 516,
                        'Det Liberale Folkepartiet' => 65,
                        'Norges Kommunistiske Parti' => 41 },
      'Vestfold' => { 'Arbeiderpartiet' => 40_869,
                      'Høyre' => 41_357,
                      'Fremskrittspartiet' => 26_977,
                      'Kristelig Folkeparti' => 6_735,
                      'Senterpartiet' => 4_084,
                      'Venstre' => 6_228,
                      'Sosialistisk Venstreparti' => 5_266,
                      'Miljøpartiet de Grønne' => 3_407,
                      'Rødt' => 932,
                      'De Kristne' => 691,
                      'Pensjonistpartiet' => 596,
                      'Piratpartiet' => 474,
                      'Kystpartiet' => 157,
                      'Demokratene i Norge' => 65,
                      'Kristent Samlingsparti' => 205 },
      'Østfold' => { 'Arbeiderpartiet' => 54_910,
                     'Høyre' => 39_703,
                     'Fremskrittspartiet' => 30_801,
                     'Kristelig Folkeparti' => 8_828,
                     'Senterpartiet' => 6_405,
                     'Venstre' => 5_723,
                     'Sosialistisk Venstreparti' => 3_668,
                     'Miljøpartiet de Grønne' => 3_168,
                     'Rødt' => 1_149,
                     'De Kristne' => 1_123,
                     'Pensjonistpartiet' => 956,
                     'Piratpartiet' => 516,
                     'Kystpartiet' => 68,
                     'Demokratene i Norge' => 99,
                     'Kristent Samlingsparti' => 145 }
    }.freeze

    def area_code
      'NO'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      NO_OF_SEATS
    end

    def overall_election_results_of_2015
      if @overall_election_results_of_2015.nil?
        @overall_election_results_of_2015 = \
          summarize_election_results(election_results_of_2015)
      end
      @overall_election_results_of_2015
    end

    def population_size
      # Source: NSD European Election Database, Norway, retrieved on 14 April
      # 2015.
      # URL: http://www.nsd.uib.no/european_election_database/country/norway/
      2_836_029
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      LEVELING_THRESHOLD
    end

    private

    COALITIONS = [['Arbeiderpartiet', 'Kristelig Folkeparti', 'Senterpartiet'],
                  ['Arbeiderpartiet', 'Kristelig Folkeparti',
                   'Miljøpartiet de Grønne', 'Senterpartiet',
                   'Sosialistisk Venstreparti'],
                  ['Arbeiderpartiet', 'Miljøpartiet de Grønne', 'Rødt',
                   'Senterpartiet', 'Sosialistisk Venstreparti'],
                  ['Arbeiderpartiet', 'Miljøpartiet de Grønne', 'Senterpartiet',
                   'Sosialistisk Venstreparti'],
                  ['Arbeiderpartiet', 'Rødt', 'Senterpartiet',
                   'Sosialistisk Venstreparti'],
                  ['Arbeiderpartiet', 'Senterpartiet',
                   'Sosialistisk Venstreparti'],
                  %w(Arbeiderpartiet Senterpartiet),
                  ['Arbeiderpartiet', 'Sosialistisk Venstreparti'],
                  %w(Fremskrittspartiet Høyre),
                  ['Fremskrittspartiet', 'Høyre', 'Kristelig Folkeparti',
                   'Miljøpartiet de Grønne', 'Venstre'],
                  ['Fremskrittspartiet', 'Høyre', 'Kristelig Folkeparti',
                   'Senterpartiet', 'Venstre'],
                  ['Fremskrittspartiet', 'Høyre', 'Kristelig Folkeparti',
                   'Venstre'],
                  ['Høyre', 'Kristelig Folkeparti', 'Venstre'],
                  ['Kristelig Folkeparti', 'Senterpartiet', 'Venstre']].freeze

    # Source: Valg i Norge, Valgkretser, Wikipedia, retrieved on 1 May 2015.
    # URL: http://no.wikipedia.org/wiki/Valg_i_Norge#Valgkretser
    DIRECT_SEAT_DISTRIBUTION = { 'Akershus' => 16, 'Aust-Agder' => 3,
                                 'Buskerud' => 8, 'Finnmark' => 4,
                                 'Hedmark' => 6, 'Hordaland' => 15,
                                 'Møre og Romsdal' => 8, 'Nord-Trøndelag' => 4,
                                 'Nordland' => 8, 'Oppland' => 6, 'Oslo' => 18,
                                 'Rogaland' => 13, 'Sogn og Fjordane' => 3,
                                 'Sør-Trøndelag' => 9, 'Telemark' => 5,
                                 'Troms' => 5, 'Vest-Agder' => 5,
                                 'Vestfold' => 6, 'Østfold' => 8 }.freeze

    LEVELING_THRESHOLD = 0.04

    # Source: Valg i Norge, Valgkretser, Wikipedia, retrieved on 16 April 2015.
    # URL: http://no.wikipedia.org/wiki/Valg_i_Norge#Valgkretser
    NO_OF_LEVELING_SEATS = 19

    NO_OF_SEATS = NO_OF_LEVELING_SEATS + \
                  DIRECT_SEAT_DISTRIBUTION.values.inject(:+)

    def election_results_of_2015
      if @election_results_of_2015.nil?
        @election_results_of_2015 = LAST_DETAILED_ELECTION_RESULT
      end
      @election_results_of_2015
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictLeveledProportional.new(
          overall_election_results_of_2015, election_results_of_2015,
          DIRECT_SEAT_DISTRIBUTION, NO_OF_LEVELING_SEATS, LEVELING_THRESHOLD,
          SainteLague14Denominators
        )
      end
      @electoral_system
    end
  end
end
