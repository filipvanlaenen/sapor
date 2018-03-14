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

describe Sapor::EuropeanUnionSlovakia, '#area_code' do
  it 'returns EU[SK] as the area code' do
    expect(Sapor::EuropeanUnionSlovakia.instance.area_code).to eq('EU[SK]')
  end
end

describe Sapor::EuropeanUnionSlovakia, '#no_of_seats' do
  it 'returns 13 as the number of seats' do
    expect(Sapor::EuropeanUnionSlovakia.instance.no_of_seats).to eq(13)
  end
end

describe Sapor::EuropeanUnionSlovakia, '#population_size' do
  it 'returns a population size of 560,603' do
    expect(Sapor::EuropeanUnionSlovakia.instance.population_size).to \
      eq(560_603)
  end
end

describe Sapor::EuropeanUnionSlovakia, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'SMER–sociálna demokracia (S&D)' => 135_089,
                'Kresťanskodemokratické hnutie (EPP)' => 74_108,
                'Slovenská demokratická a kresťanská únia–Demokratická' \
                  ' strana (EPP)' => 43_467,
                'OBYČAJNÍ ĽUDIA a nezávislé osobnosti (ECR)' => 41_829,
                'NOVA–Konzervatívni demokrati Slovenska–Občianska' \
                  ' konzervatívna strana (ECR)' => 38_316,
                'Sloboda a Solidarita (ALDE)' => 37_376,
                'Strana maďarskej koalície–Magyar Koalíció Pártja (EPP)' \
                  => 36_629,
                'MOST–HÍD (EPP)' => 32_708,
                'Strana TIP (—)' => 20_730,
                'Slovenská národná strana (EFDD)' => 20_244,
                'Ľudová strana Naše Slovensko (—)' => 9_749,
                'PRÁVO A SPRAVODLIVOSŤ (—)' => 9_322,
                'Komunistická strana Slovenska (GUE/NGL)' => 8_510,
                'Strana demokratického Slovenska (ALDE)' => 8_378,
                'Národ a Spravodlivosť–naša strana (—)' => 7_763,
                'Magnificat Slovakia (—)' => 6_646,
                'Európska demokratická strana (ALDE)' => 3_739,
                'Kresťanská SLOVENSKÁ NÁRODNÁ STRANA (—)' => 3_631,
                'Strana moderného Slovenska (—)' => 2_851,
                'ÚSVIT (—)' => 2_773,
                '7 STATOČNÝCH REGIONÁLNA STRANA SLOVENSKA (—)' => 2_696,
                'Strana zelených (Greens/EFA)' => 2_623,
                'Slovenská ľudová strana (—)' => 2_590,
                'PRIAMA DEMOKRACIA–Kresťanská ľudová strana (ALDE)' => 2_405,
                'VZDOR–strana práce (—)' => 1_769,
                'Strana občianskej ľavice (—)' => 1_311,
                'DEMOKRATICKÁ OBČIANSKA STRANA (—)' => 1_273,
                'Maďarská kresťanskodemokratická aliancia–Magyar' \
                  ' Kereszténydemokrata Szövetség (Greens/EFA)' => 1_170,
                'Nový parlament (—)' => 900 }
    seats = Sapor::EuropeanUnionSlovakia.instance.seats(results)
    expect(seats['SMER–sociálna demokracia (S&D)']).to eq(4)
    expect(seats['Kresťanskodemokratické hnutie (EPP)']).to eq(2)
    expect(seats['Slovenská demokratická a kresťanská únia–Demokratická' \
                 ' strana (EPP)']).to eq(2)
    expect(seats['OBYČAJNÍ ĽUDIA a nezávislé osobnosti (ECR)']).to eq(1)
    expect(seats['NOVA–Konzervatívni demokrati Slovenska–Občianska' \
                 ' konzervatívna strana (ECR)']).to eq(1)
    expect(seats['Sloboda a Solidarita (ALDE)']).to eq(1)
    expect(seats['Strana maďarskej koalície–Magyar Koalíció Pártja (EPP)']).to \
      eq(1)
    expect(seats['MOST–HÍD (EPP)']).to eq(1)
    expect(seats['Strana TIP (—)']).to eq(0)
    expect(seats['Slovenská národná strana (EFDD)']).to eq(0)
    expect(seats['Ľudová strana Naše Slovensko (—)']).to eq(0)
    expect(seats['PRÁVO A SPRAVODLIVOSŤ (—)']).to eq(0)
    expect(seats['Komunistická strana Slovenska (GUE/NGL)']).to eq(0)
    expect(seats['Strana demokratického Slovenska (ALDE)']).to eq(0)
    expect(seats['Národ a Spravodlivosť–naša strana (—)']).to eq(0)
    expect(seats['Magnificat Slovakia (—)']).to eq(0)
    expect(seats['Európska demokratická strana (ALDE)']).to eq(0)
    expect(seats['Kresťanská SLOVENSKÁ NÁRODNÁ STRANA (—)']).to eq(0)
    expect(seats['Strana moderného Slovenska (—)']).to eq(0)
    expect(seats['ÚSVIT (—)']).to eq(0)
    expect(seats['7 STATOČNÝCH REGIONÁLNA STRANA SLOVENSKA (—)']).to eq(0)
    expect(seats['Strana zelených (Greens/EFA)']).to eq(0)
    expect(seats['Slovenská ľudová strana (—)']).to eq(0)
    expect(seats['PRIAMA DEMOKRACIA–Kresťanská ľudová strana (ALDE)']).to eq(0)
    expect(seats['VZDOR–strana práce (—)']).to eq(0)
    expect(seats['Strana občianskej ľavice (—)']).to eq(0)
    expect(seats['DEMOKRATICKÁ OBČIANSKA STRANA (—)']).to eq(0)
    expect(seats['Maďarská kresťanskodemokratická aliancia–Magyar' \
                 ' Kereszténydemokrata Szövetség (Greens/EFA)']).to eq(0)
    expect(seats['Nový parlament (—)']).to eq(0)
  end
end
