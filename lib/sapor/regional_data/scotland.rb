# frozen_string_literal: true

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
  # The regional data for Scotland.
  #
  class Scotland < Area
    include Singleton

    def add_extra_information(extra_information)    
      c = constituency_coefficients
      pairs = extra_information.split('|')
      pairs.each do | pair |
        elements = pair.split('~')
        c[elements.first] = elements.last.to_f
      end
    end

    def area_code
      'GB-SCT'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      individual_constituencies_election_results_of_2016.size + \
        ADDITIONAL_MEMBERS_DISTRIBUTION.values.inject(:+)
    end

    def population_size
      # Source: Wikipedia article on 2016 Scottish Parliament election,
      # retrieved on 31 March 2021.
      # URL: https://en.wikipedia.org/wiki/2016_Scottish_Parliament_election
      2_285_752
    end

    def regional_election_results_of_2016
      if @regional_election_results_of_2016.nil?
        @regional_election_results_of_2016 = load_election_results(
          'scotland-20160505-regions.psv'
        )
      end
      @regional_election_results_of_2016
    end

    def overall_regional_election_results_of_2016
      if @overall_regional_election_results_of_2016.nil?
        @overall_regional_election_results_of_2016 = \
          summarize_election_results( \
            regional_election_results_of_2016
          )
      end
      @overall_regional_election_results_of_2016
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      nil
    end

    private

    ADDITIONAL_MEMBERS_DISTRIBUTION = { 'Central Scotland' => 7, 'Glasgow' => 7,
                                        'Highlands and Islands' => 7,
                                        'Lothian' => 7,
                                        'Mid Scotland and Fife' => 7,
                                        'North East Scotland' => 7,
                                        'South Scotland' => 7,
                                        'West Scotland' => 7 }.freeze

    REGIONS_PER_CONSTITUENCY = { 'Aberdeen Central' => 'North East Scotland',
                                 'Aberdeen Donside' => 'North East Scotland',
                                 'Aberdeen S. and N. Kincardine' => 'North East Scotland',
                                 'Aberdeenshire East' => 'North East Scotland',
                                 'Aberdeenshire West' => 'North East Scotland',
                                 'Airdrie & Shotts' => 'Central Scotland',
                                 'Almond Valley' => 'Lothian',
                                 'Angus North & Mearns' => 'North East Scotland',
                                 'Angus South' => 'North East Scotland',
                                 'Argyll & Bute' => 'Highlands and Islands',
                                 'Ayr' => 'South Scotland',
                                 'Banffshire & Buchan Coast' => 'North East Scotland',
                                 'Caithness Sutherland & Ross' => 'Highlands and Islands',
                                 'Carrick, Cumnock & Doon Valley' => 'South Scotland',
                                 'Clackmannanshire & Dunblane' => 'Mid Scotland and Fife',
                                 'Clydebank & Milngavie' => 'West Scotland',
                                 'Clydesdale' => 'South Scotland',
                                 'Coatbridge & Chryston' => 'Central Scotland',
                                 'Cowdenbeath' => 'Mid Scotland and Fife',
                                 'Cumbernauld & Kilsyth' => 'Central Scotland',
                                 'Cunninghame North' => 'West Scotland',
                                 'Cunninghame South' => 'West Scotland',
                                 'Dumbarton' => 'West Scotland',
                                 'Dumfriesshire' => 'South Scotland',
                                 'Dundee City East' => 'North East Scotland',
                                 'Dundee City West' => 'North East Scotland',
                                 'Dunfermline' => 'Mid Scotland and Fife',
                                 'East Kilbride' => 'Central Scotland',
                                 'East Lothian' => 'South Scotland',
                                 'Eastwood' => 'West Scotland',
                                 'Edinburgh Central' => 'Lothian',
                                 'Edinburgh Eastern' => 'Lothian',
                                 'Edinburgh Northern & Leith' => 'Lothian',
                                 'Edinburgh Pentlands' => 'Lothian',
                                 'Edinburgh Southern' => 'Lothian',
                                 'Edinburgh Western' => 'Lothian',
                                 'Ettrick, Roxburgh & Berwickshire' => 'South Scotland',
                                 'Falkirk East' => 'Central Scotland',
                                 'Falkirk West' => 'Central Scotland',
                                 'Galloway & West Dumfries' => 'South Scotland',
                                 'Glasgow Anniesland' => 'Glasgow',
                                 'Glasgow Cathcart' => 'Glasgow',
                                 'Glasgow Kelvin' => 'Glasgow',
                                 'Glasgow Maryhill & Springburn' => 'Glasgow',
                                 'Glasgow Pollok' => 'Glasgow',
                                 'Glasgow Provan' => 'Glasgow',
                                 'Glasgow Shettleston' => 'Glasgow',
                                 'Glasgow Southside' => 'Glasgow',
                                 'Greenock & Inverclyde' => 'West Scotland',
                                 'Hamilton, Larkhall & Stonehouse' => 'Central Scotland',
                                 'Inverness & Nairn' => 'Highlands and Islands',
                                 'Kilmarnock & Irvine Valley' => 'South Scotland',
                                 'Kirkcaldy' => 'Mid Scotland and Fife',
                                 'Linlithgow' => 'Lothian',
                                 'Mid Fife & Glenrothes' => 'Mid Scotland and Fife',
                                 'Midlothian North & Musselburgh' => 'Lothian',
                                 'Midlothian South, Tweeddale & Lauderdale' => 'South Scotland',
                                 'Moray' => 'Highlands and Islands',
                                 'Motherwell & Wishaw' => 'Central Scotland',
                                 'Nah h-Eilanan an Iar' => 'Highlands and Islands',
                                 'North East Fife' => 'Mid Scotland and Fife',
                                 'Orkney Islands' => 'Highlands and Islands',
                                 'Paisley' => 'West Scotland',
                                 'Perthshire North' => 'Mid Scotland and Fife',
                                 'Perthshire South & Kinross-shire' => 'Mid Scotland and Fife',
                                 'Renfrewshire North & West' => 'West Scotland',
                                 'Renfrewshire South' => 'West Scotland',
                                 'Rutherglen' => 'Glasgow',
                                 'Shetland Islands' => 'Highlands and Islands',
                                 'Skye, Lochaber & Badenoch' => 'Highlands and Islands',
                                 'Stirling' => 'Mid Scotland and Fife',
                                 'Strathkelvin & Bearsden' => 'West Scotland',
                                 'Uddingston & Bellshill' => 'Central Scotland' }.freeze

    ALBA_PARTY = 'Alba Party'
    CON_PARTY = 'Scottish Conservative & Unionist Party'
    GREEN_PARTY = 'Scottish Greens'
    LAB_PARTY = 'Scottish Labour'
    LIB_DEM_PARTY = 'Scottish Liberal Democrats'
    SNP_PARTY = 'Scottish National Party'

    COALITIONS = [[ALBA_PARTY, GREEN_PARTY, SNP_PARTY],
                  [ALBA_PARTY, SNP_PARTY],
                  [CON_PARTY, LAB_PARTY],
                  [CON_PARTY, LAB_PARTY, LIB_DEM_PARTY],
                  [CON_PARTY, LIB_DEM_PARTY],
                  [GREEN_PARTY, LAB_PARTY, LIB_DEM_PARTY],
                  [GREEN_PARTY, SNP_PARTY],
                  [LAB_PARTY, LIB_DEM_PARTY],
                  [SNP_PARTY]].freeze

    def constituency_coefficients
      if @constituency_coefficients.nil?
        @constituency_coefficients = {}
        overall_individual_constituencies_election_results_of_2016.each_pair do |party, constituency_result|
          if overall_regional_election_results_of_2016.key?(party)
            @constituency_coefficients[party] = constituency_result.to_f / overall_regional_election_results_of_2016[party]
          end
        end
      end
      @constituency_coefficients
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = AdditionalMember.new(
          overall_regional_election_results_of_2016,
          regional_election_results_of_2016,
          ADDITIONAL_MEMBERS_DISTRIBUTION,
          DhondtDenominators,
          overall_individual_constituencies_election_results_of_2016,
          individual_constituencies_election_results_of_2016,
          REGIONS_PER_CONSTITUENCY,
          constituency_coefficients
        )
      end
      @electoral_system
    end

    def individual_constituencies_election_results_of_2016
      if @individual_constituencies_election_results_of_2016.nil?
        @individual_constituencies_election_results_of_2016 = \
          load_election_results('scotland-20160505-constituencies.psv')
      end
      @individual_constituencies_election_results_of_2016
    end

    def overall_individual_constituencies_election_results_of_2016
      if @overall_individual_constituencies_election_results_of_2016.nil?
        @overall_individual_constituencies_election_results_of_2016 = \
          summarize_election_results( \
            individual_constituencies_election_results_of_2016
          )
      end
      @overall_individual_constituencies_election_results_of_2016
    end
  end

  # Extension of Scotland with AFU and Alba Party
  class ScotlandWithAfuAndAlba < Scotland
    def area_code
      'GB-SCT∪{AFU,Alba}'
    end

    def regional_election_results_of_2016
      if @regional_election_results_of_2016.nil?
        @regional_election_results_of_2016 = load_election_results(
          'scotland-20160505-regions-with-afu-and-alba.psv'
        )
      end
      @regional_election_results_of_2016
    end
  end

  # Extension of Scotland with Alba Party
  class ScotlandWithAlba < Scotland
    def area_code
      'GB-SCT∪{Alba}'
    end

    def regional_election_results_of_2016
      if @regional_election_results_of_2016.nil?
        @regional_election_results_of_2016 = load_election_results(
          'scotland-20160505-regions-with-alba.psv'
        )
      end
      @regional_election_results_of_2016
    end
  end

  # Extension of Scotland with Alba Party and Reform UK
  class ScotlandWithAlbaAndRefUK < Scotland
    def area_code
      'GB-SCT∪{Alba,RefUK}'
    end

    def regional_election_results_of_2016
      if @regional_election_results_of_2016.nil?
        @regional_election_results_of_2016 = load_election_results(
          'scotland-20160505-regions-with-alba-and-refuk.psv'
        )
      end
      @regional_election_results_of_2016
    end
  end

  # Extension of Scotland with Reform UK
  class ScotlandWithRefUK < Scotland
    def area_code
      'GB-SCT∪{RefUK}'
    end

    def regional_election_results_of_2016
      if @regional_election_results_of_2016.nil?
        @regional_election_results_of_2016 = load_election_results(
          'scotland-20160505-regions-with-refuk.psv'
        )
      end
      @regional_election_results_of_2016
    end
  end
end
