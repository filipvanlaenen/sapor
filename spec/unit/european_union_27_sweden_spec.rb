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

describe Sapor::EuropeanUnion27Sweden, '#area_code' do
  it 'returns EU27[SE] as the area code' do
    expect(Sapor::EuropeanUnion27Sweden.instance.area_code).to eq('EU27[SE]')
  end
end

describe Sapor::EuropeanUnion27Sweden, '#no_of_seats' do
  it 'returns 21 as the number of seats' do
    expect(Sapor::EuropeanUnion27Sweden.instance.no_of_seats).to eq(21)
  end
end

describe Sapor::EuropeanUnion27Sweden, '#population_size' do
  it 'returns a population size of 4,151,470' do
    expect(Sapor::EuropeanUnion27Sweden.instance.population_size).to \
      eq(4_151_470)
  end
end

describe Sapor::EuropeanUnion27Sweden, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Sveriges socialdemokratiska arbetareparti (S&D)' => 899_074,
                'Miljöpartiet de gröna (Greens/EFA)' => 572_591,
                'Moderata samlingspartiet (EPP)' => 507_488,
                'Liberalerna (ALDE)' => 368_514,
                'Sverigedemokraterna (EFDD)' => 359_248,
                'Centerpartiet (ALDE)' => 241_101,
                'Vänsterpartiet (GUE/NGL)' => 234_272,
                'Kristdemokraterna (EPP)' => 220_574,
                'Feministiskt initiativ (S&D)' => 204_005,
                'Piratpartiet (Greens/EFA)' => 82_763,
                'Junilistan (GUE/NGL)' => 11_629,
                'Djurens parti (GUE/NGL)'	=> 8_773,
                'Liberala partiet (—)' => 492,
                'Europeiska arbetarpartiet (—)'	=> 170,
                'Sverigesmultidemokrater (—)' => 133,
                'Sverige ut ur EU–Frihetliga Rättvisepartiet (—)' => 106,
                'Socialistiska välfärdspartiet (—)' => 86,
                'Äkta demokrati (—)' => 72,
                'Sveriges nationella demokratiska parti (—)' => 49,
                '666 för en EU:s super-state med frihet, jämlikhet, rättvisa,' \
                  ' fred, kärlek och lyckan (—)' => 11,
                'Republicans right (—)' => 9 }
    seats = Sapor::EuropeanUnion27Sweden.instance.seats(results)
    expect(seats['Sveriges socialdemokratiska arbetareparti (S&D)']).to eq(5 + 1)
    expect(seats['Miljöpartiet de gröna (Greens/EFA)']).to eq(4)
    expect(seats['Moderata samlingspartiet (EPP)']).to eq(3)
    expect(seats['Liberalerna (ALDE)']).to eq(2)
    expect(seats['Sverigedemokraterna (EFDD)']).to eq(2)
    expect(seats['Centerpartiet (ALDE)']).to eq(1)
    expect(seats['Vänsterpartiet (GUE/NGL)']).to eq(1)
    expect(seats['Kristdemokraterna (EPP)']).to eq(1)
    expect(seats['Feministiskt initiativ (S&D)']).to eq(1)
    expect(seats['Piratpartiet (Greens/EFA)']).to eq(0)
    expect(seats['Junilistan (GUE/NGL)']).to eq(0)
    expect(seats['Djurens parti (GUE/NGL)']).to eq(0)
    expect(seats['Liberala partiet (—)']).to eq(0)
    expect(seats['Europeiska arbetarpartiet (—)']).to eq(0)
    expect(seats['Sverigesmultidemokrater (—)']).to eq(0)
    expect(seats['Sverige ut ur EU–Frihetliga Rättvisepartiet (—)']).to eq(0)
    expect(seats['Socialistiska välfärdspartiet (—)']).to eq(0)
    expect(seats['Äkta demokrati (—)']).to eq(0)
    expect(seats['Sveriges nationella demokratiska parti (—)']).to eq(0)
    expect(seats['666 för en EU:s super-state med frihet, jämlikhet,' \
                   ' rättvisa, fred, kärlek och lyckan (—)']).to eq(0)
    expect(seats['Republicans right (—)']).to eq(0)
  end
end
