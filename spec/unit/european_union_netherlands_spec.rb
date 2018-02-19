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

describe Sapor::EuropeanUnionNetherlands, '#area_code' do
  it 'returns EU[NL] as the area code' do
    expect(Sapor::EuropeanUnionNetherlands.instance.area_code).to eq('EU[NL]')
  end
end

describe Sapor::EuropeanUnionNetherlands, '#no_of_seats' do
  it 'returns 26 as the number of seats' do
    expect(Sapor::EuropeanUnionNetherlands.instance.no_of_seats).to eq(26)
  end
end

describe Sapor::EuropeanUnionNetherlands, '#population_size' do
  it 'returns a population size of 4,753,746' do
    expect(Sapor::EuropeanUnionNetherlands.instance.population_size).to \
      eq(4_753_746)
  end
end

describe Sapor::EuropeanUnionNetherlands, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Democraten 66 (ALDE)' => 735_825,
                'Christen-Democratisch Appèl–ChristenUnie–Staatkundig' \
                  ' Gereformeerde Partij (EPP)' => 721_766 + 364_843,
                'Partij voor de Vrijheid (ENF)' => 633_114,
                'Volkspartij voor Vrijheid en Democratie (ALDE)' => 571_176,
                'Socialistische Partij (GUE/NGL)' => 458_079,
                'Partij van de Arbeid–GroenLinks (S&D)' => 446_763 + 331_594,
                'Partij voor de Dieren (GUE/NGL)' => 200_254,
                '50Plus (ALDE)' => 175_343,
                'Piratenpartij (Greens/EFA)' => 40_216,
                'Artikel 50 (—)' => 24_069,
                'Anti Europa Partij (—)' => 12_290,
                'De Groenen (Greens/EFA)' => 10_833,
                'Jezus Leeft (—)' => 9_507,
                'ikkiesvooreerlijk.eu (—)' => 6_796,
                'Liberaal Democratische Partij (—)' => 6_349,
                'Aandacht en Eenvoud (—)' => 3_174,
                'IQ, de Rechten-Plichten-Partij (—)' => 1_705 }
    seats = Sapor::EuropeanUnionNetherlands.instance.seats(results)
    expect(seats['Democraten 66 (ALDE)']).to eq(4)
    expect(seats['Christen-Democratisch Appèl–ChristenUnie–Staatkundig' \
                   ' Gereformeerde Partij (EPP)']).to eq(5 + 2)
    expect(seats['Partij voor de Vrijheid (ENF)']).to eq(4)
    expect(seats['Volkspartij voor Vrijheid en Democratie (ALDE)']).to eq(3)
    expect(seats['Socialistische Partij (GUE/NGL)']).to eq(2)
    expect(seats['Partij van de Arbeid–GroenLinks (S&D)']).to eq(3 + 2)
    expect(seats['Partij voor de Dieren (GUE/NGL)']).to eq(1)
    expect(seats['50Plus (ALDE)']).to eq(0)
    expect(seats['Piratenpartij (Greens/EFA)']).to eq(0)
    expect(seats['Artikel 50 (—)']).to eq(0)
    expect(seats['Anti Europa Partij (—)']).to eq(0)
    expect(seats['De Groenen (Greens/EFA)']).to eq(0)
    expect(seats['Jezus Leeft (—)']).to eq(0)
    expect(seats['ikkiesvooreerlijk.eu (—)']).to eq(0)
    expect(seats['Liberaal Democratische Partij (—)']).to eq(0)
    expect(seats['Aandacht en Eenvoud (—)']).to eq(0)
    expect(seats['IQ, de Rechten-Plichten-Partij (—)']).to eq(0)
  end
end
