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

require 'spec_helper'

describe Sapor::EuropeanUnionCzechRepublic, '#area_code' do
  it 'returns EU[CZ] as the area code' do
    expect(Sapor::EuropeanUnionCzechRepublic.instance.area_code).to eq('EU[CZ]')
  end
end

describe Sapor::EuropeanUnionCzechRepublic, '#no_of_seats' do
  it 'returns 21 as the number of seats' do
    expect(Sapor::EuropeanUnionCzechRepublic.instance.no_of_seats).to eq(21)
  end
end

describe Sapor::EuropeanUnionCzechRepublic, '#population_size' do
  it 'returns a population size of 1,515,492' do
    expect(Sapor::EuropeanUnionCzechRepublic.instance.population_size).to \
      eq(1_515_492)
  end
end

describe Sapor::EuropeanUnionCzechRepublic, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'ANO 2011 (ALDE)' => 244_501,
                'Koalice TOP 09 a STAN (EPP)' => 241_747,
                'Česká strana sociálně demokratická (S&D)' => 214_800,
                'Komunistická strana Čech a Moravy (GUE/NGL)' => 166_478,
                'Křesťanská a demokratická unie–Československá strana lidová' \
                  ' (EPP)' => 150_792,
                'Občanská demokratická strana (ECR)' => 116_389,
                'Strana svobodných občanů (EFDD)' => 79_540,
                'Česká pirátská strana (*)' => 72_514,
                'Strana zelených (Greens/EFA)' => 57_240,
                'Úsvit přímé demokracie Tomia Okamury (—)' => 47_306,
                'Strana zdravého rozumu–NECHCEME EURO–za Evropu svobodných' \
                  ' států (—)' => 24_724,
                'Komunistická strana Československa (—)' => 8_549,
                'Volte Pravý Blok www.cibulka.net (—)' => 8_028,
                'SNK Evropští demokraté (—)' => 7_961,
                'Koalice DSSS a SPE (—)' => 7_902,
                'Liberálně ekologická strana (—)' => 7_514,
                'NE Bruselu–Národní demokracie (—)' => 7_109,
                'LEV 21–Národní socialisté (—)' => 7_099,
                'Věci veřejné (—)' => 6_988,
                'Moravané (Greens/EFA)' => 6_614,
                'VIZE 2014 (—)' => 3_698,
                'Občanská konzervativní strana (—)' => 3_481,
                'Koalice SP a NO! (—)' => 2_899,
                'Česká strana regionů (—)' => 2_535,
                'Koruna Česká (monarch.strana) (—)' => 2_434,
                'Klub angažovaných nestraníků (—)' => 2_379,
                'Republika (—)' => 2_240,
                'Česká Suverenita (—)' => 2_086,
                'HNUTÍ SOCIÁLNĚ SLABÝCH (—)' => 1_685,
                'OBČANÉ 2011 (—)' => 1_299,
                'Aktiv nezávislých občanů (—)' => 1_242,
                'Romská demokratická strana (—)' => 1_185,
                'REPUBL.STR.ČECH,MORAVY A SLEZ. (—)' => 1_100,
                'Fair play–HNPD (—)' => 900,
                'ANTIBURSÍK–STOP EKOTERORU! (—)' => 761,
                'evropani.cz (—)' => 631,
                '“Strana rovných příležitostí” (—)' => 640,
                'Česká strana národně sociální (—)' => 502 }
    seats = Sapor::EuropeanUnionCzechRepublic.instance.seats(results)
    expect(seats['ANO 2011 (ALDE)']).to eq(4)
    expect(seats['Koalice TOP 09 a STAN (EPP)']).to eq(4)
    expect(seats['Česká strana sociálně demokratická (S&D)']).to eq(4)
    expect(seats['Komunistická strana Čech a Moravy (GUE/NGL)']).to eq(3)
    expect(seats['Křesťanská a demokratická unie–Československá strana lidová' \
                   ' (EPP)']).to eq(3)
    expect(seats['Občanská demokratická strana (ECR)']).to eq(2)
    expect(seats['Strana svobodných občanů (EFDD)']).to eq(1)
    expect(seats['Česká pirátská strana (*)']).to eq(0)
    expect(seats['Strana zelených (Greens/EFA)']).to eq(0)
    expect(seats['Úsvit přímé demokracie Tomia Okamury (—)']).to eq(0)
    expect(seats['Strana zdravého rozumu–NECHCEME EURO–za Evropu svobodných' \
                   ' států (—)']).to eq(0)
    expect(seats['Komunistická strana Československa (—)']).to eq(0)
    expect(seats['Volte Pravý Blok www.cibulka.net (—)']).to eq(0)
    expect(seats['SNK Evropští demokraté (—)']).to eq(0)
    expect(seats['Koalice DSSS a SPE (—)']).to eq(0)
    expect(seats['Liberálně ekologická strana (—)']).to eq(0)
    expect(seats['NE Bruselu–Národní demokracie (—)']).to eq(0)
    expect(seats['LEV 21–Národní socialisté (—)']).to eq(0)
    expect(seats['Věci veřejné (—)']).to eq(0)
    expect(seats['Moravané (Greens/EFA)']).to eq(0)
    expect(seats['VIZE 2014 (—)']).to eq(0)
    expect(seats['Občanská konzervativní strana (—)']).to eq(0)
    expect(seats['Koalice SP a NO! (—)']).to eq(0)
    expect(seats['Česká strana regionů (—)']).to eq(0)
    expect(seats['Koruna Česká (monarch.strana) (—)']).to eq(0)
    expect(seats['Klub angažovaných nestraníků (—)']).to eq(0)
    expect(seats['Republika (—)']).to eq(0)
    expect(seats['Česká Suverenita (—)']).to eq(0)
    expect(seats['HNUTÍ SOCIÁLNĚ SLABÝCH (—)']).to eq(0)
    expect(seats['OBČANÉ 2011 (—)']).to eq(0)
    expect(seats['Aktiv nezávislých občanů (—)']).to eq(0)
    expect(seats['Romská demokratická strana (—)']).to eq(0)
    expect(seats['REPUBL.STR.ČECH,MORAVY A SLEZ. (—)']).to eq(0)
    expect(seats['Fair play–HNPD (—)']).to eq(0)
    expect(seats['ANTIBURSÍK–STOP EKOTERORU! (—)']).to eq(0)
    expect(seats['evropani.cz (—)']).to eq(0)
    expect(seats['“Strana rovných příležitostí” (—)']).to eq(0)
    expect(seats['Česká strana národně sociální (—)']).to eq(0)
  end
end
