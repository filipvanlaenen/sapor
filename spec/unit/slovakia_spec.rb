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

describe Sapor::Slovakia, '#area_code' do
  it 'returns SK as the area code' do
    expect(Sapor::Slovakia.instance.area_code).to eq('SK')
  end
end

describe Sapor::Slovakia, '#no_of_seats' do
  it 'returns 150 as the number of seats' do
    expect(Sapor::Slovakia.instance.no_of_seats).to eq(150)
  end
end

describe Sapor::Slovakia, '#population_size' do
  it 'returns a population size of 2,648,184 - 20,798' do
    expect(Sapor::Slovakia.instance.population_size).to eq(2_648_184 - 20_798)
  end
end

describe Sapor::Slovakia, '#threshold' do
  it 'returns a threshold of 5%' do
    expect(Sapor::Slovakia.instance.threshold).to eq(0.05)
  end
end

describe Sapor::Slovakia, '#seats' do
  it 'calculates the number of seats for the election of 2017' do
    results = { 'SMER–sociálna demokracia' => 737_481,
                'Sloboda a Solidarita' => 315_558,
                'OBYČAJNÍ ĽUDIA a nezávislé osobnosti–NOVA' => 287_611,
                'Slovenská národná strana' => 225_386,
                'Kotleba–Ľudová strana Naše Slovensko' => 209_779,
                'SME RODINA–Boris Kollár' => 172_860,
                'MOST–HÍD' => 169_593,
                '#SIEŤ' => 146_205,
                'Kresťanskodemokratické hnutie' => 128_908,
                'Strana maďarskej komunity–Magyar Közösség Pártja' => 105_495,
                'Slovenská občianska koalícia' => 21_785,
                'Strana TIP' => 18_845,
                'Strana zelených Slovenska' => 17_541,
                'Komunistická strana Slovenska' => 16_278,
                'Slovenská demokratická a kresťanská únia–Demokratická' \
                  ' strana' => 6_938,
                'ŠANCA' => 6_522,
                'Strana moderného Slovenska' => 4_559,
                'PRIAMA DEMOKRACIA' => 3_595,
                'Courage – Great National and Pro-Russian Coalition' => 3_428,
                'VZDOR–strana práce' => 3_182,
                'Maďarská kresťanskodemokratická aliancia–Magyar' \
                  ' Kereszténydemokrata Szövetség' => 2_426,
                'Democratic Party–Ľudo Kaník' => 1_998,
                'Coalition–Together for Slovakia' => 1_777}
    seats = Sapor::Slovakia.instance.seats(results)
    expect(seats['SMER–sociálna demokracia']).to eq(49)
    expect(seats['Sloboda a Solidarita']).to eq(21)
    expect(seats['OBYČAJNÍ ĽUDIA a nezávislé osobnosti–NOVA']).to eq(19)
    expect(seats['Slovenská národná strana']).to eq(15)
    expect(seats['Kotleba–Ľudová strana Naše Slovensko']).to eq(14)
    expect(seats['SME RODINA–Boris Kollár']).to eq(11)
    expect(seats['MOST–HÍD']).to eq(11)
    expect(seats['#SIEŤ']).to eq(10)
    expect(seats['Kresťanskodemokratické hnutie']).to eq(0)
    expect(seats['Strana maďarskej komunity–Magyar Közösség Pártja']).to eq(0)
    expect(seats['Slovenská občianska koalícia']).to eq(0)
    expect(seats['Strana TIP']).to eq(0)
    expect(seats['Strana zelených Slovenska']).to eq(0)
    expect(seats['Komunistická strana Slovenska']).to eq(0)
    expect(seats['Slovenská demokratická a kresťanská únia–Demokratická' \
                  ' strana']).to eq(0)
    expect(seats['ŠANCA']).to eq(0)
    expect(seats['Strana moderného Slovenska']).to eq(0)
    expect(seats['PRIAMA DEMOKRACIA']).to eq(0)
    expect(seats['Courage – Great National and Pro-Russian Coalition']).to eq(0)
    expect(seats['VZDOR–strana práce']).to eq(0)
    expect(seats['Maďarská kresťanskodemokratická aliancia–Magyar' \
                  ' Kereszténydemokrata Szövetség']).to eq(0)
    expect(seats['Democratic Party–Ľudo Kaník']).to eq(0)
    expect(seats['Coalition–Together for Slovakia']).to eq(0)
  end
end
