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

require 'spec_helper'

describe Sapor::Netherlands, '#area_code' do
  it 'returns NL as the area code' do
    expect(Sapor::Netherlands.instance.area_code).to eq('NL')
  end
end

describe Sapor::Netherlands, '#no_of_seats' do
  it 'returns 150 as the number of seats' do
    expect(Sapor::Netherlands.instance.no_of_seats).to eq(150)
  end
end

describe Sapor::Netherlands, '#population_size' do
  it 'returns a population size of 10,516,041' do
    expect(Sapor::Netherlands.instance.population_size).to eq(10_516_041)
  end
end

describe Sapor::Netherlands, '#threshold' do
  it 'returns a threshold of 1/150' do
    expect(Sapor::Netherlands.instance.threshold).to eq(1 / 150.to_f)
  end
end

describe Sapor::Netherlands, '#seats' do
  it 'calculates the number of seats for the election of 2017' do
    results = { 'Volkspartij voor Vrijheid en Democratie' => 2_238_351,
                'Partij voor de Vrijheid' => 1_372_941,
                'Christen-Democratisch Appèl' => 1_301_796,
                'Democraten 66' => 1_285_819,
                'GroenLinks' => 959_600,
                'Socialistische Partij' => 955_633,
                'Partij van de Arbeid' => 599_699,
                'ChristenUnie' => 356_271,
                'Partij voor de Dieren' => 335_214,
                '50Plus' => 327_131,
                'Staatkundig Gereformeerde Partij' => 218_950,
                'DENK' => 216_147,
                'Forum voor Democratie' => 187_162,
                'VoorNederland' => 38_209,
                'Piratenpartij' => 35_478,
                'Artikel 1' => 28_700,
                'Nieuwe Wegen' => 14_362,
                'OndernemersPartij' => 12_570,
                'Lokaal in de Kamer' => 6_858,
                'Niet Stemmers' => 6_025,
                'De Burger Beweging' => 5_221,
                'GeenPeil' => 4_945,
                'Jezus Leeft' => 3_099,
                'Vrijzinnige Partij' => 2_938,
                'Libertarische Partij' => 1_492,
                'Partij voor Mens en Spirit–Basisinkomen Partij–Vrede en ' \
                  'Recht' => 726,
                'StemNL' => 527,
                'Vrije Democratische Partij' => 177 }
    seats = Sapor::Netherlands.instance.seats(results)
    expect(seats['Volkspartij voor Vrijheid en Democratie']).to eq(33)
    expect(seats['Partij voor de Vrijheid']).to eq(20)
    expect(seats['Christen-Democratisch Appèl']).to eq(19)
    expect(seats['Democraten 66']).to eq(19)
    expect(seats['GroenLinks']).to eq(14)
    expect(seats['Socialistische Partij']).to eq(14)
    expect(seats['Partij van de Arbeid']).to eq(9)
    expect(seats['ChristenUnie']).to eq(5)
    expect(seats['Partij voor de Dieren']).to eq(5)
    expect(seats['50Plus']).to eq(4)
    expect(seats['Staatkundig Gereformeerde Partij']).to eq(3)
    expect(seats['DENK']).to eq(3)
    expect(seats['Forum voor Democratie']).to eq(2)
    expect(seats['VoorNederland']).to eq(0)
    expect(seats['Piratenpartij']).to eq(0)
    expect(seats['Artikel 1']).to eq(0)
    expect(seats['Nieuwe Wegen']).to eq(0)
    expect(seats['OndernemersPartij']).to eq(0)
    expect(seats['Lokaal in de Kamer']).to eq(0)
    expect(seats['Niet Stemmers']).to eq(0)
    expect(seats['De Burger Beweging']).to eq(0)
    expect(seats['GeenPeil']).to eq(0)
    expect(seats['Jezus Leeft']).to eq(0)
    expect(seats['Vrijzinnige Partij']).to eq(0)
    expect(seats['Libertarische Partij']).to eq(0)
    expect(seats['Partij voor Mens en Spirit–Basisinkomen Partij–Vrede en ' \
                 'Recht']).to eq(0)
    expect(seats['StemNL']).to eq(0)
    expect(seats['Vrije Democratische Partij']).to eq(0)
  end
end
