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

describe Sapor::EuropeanUnionHungary, '#area_code' do
  it 'returns EU[HU] as the area code' do
    expect(Sapor::EuropeanUnionHungary.instance.area_code).to eq('EU[HU]')
  end
end

describe Sapor::EuropeanUnionHungary, '#no_of_seats' do
  it 'returns 21 as the number of seats' do
    expect(Sapor::EuropeanUnionHungary.instance.no_of_seats).to eq(21)
  end
end

describe Sapor::EuropeanUnionHungary, '#population_size' do
  it 'returns a population size of 2,319,493' do
    expect(Sapor::EuropeanUnionHungary.instance.population_size).to \
      eq(2_319_493)
  end
end

describe Sapor::EuropeanUnionHungary, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Fidesz–KDNP (EPP)' => 1_193_991, 'Jobbik (AENM)' => 340_287,
                'MSZP (S&D)' => 252_751, 'DK (S&D)' => 226_086,
                'Együtt (Greens/EFA)' => 168_076, 'LMP (Greens/EFA)' => 116_904,
                'HNEM (—)' => 12_119, 'SMS (—)' => 9_279 }
    seats = Sapor::EuropeanUnionHungary.instance.seats(results)
    expect(seats['Fidesz–KDNP (EPP)']).to eq(12)
    expect(seats['Jobbik (AENM)']).to eq(3)
    expect(seats['MSZP (S&D)']).to eq(2)
    expect(seats['DK (S&D)']).to eq(2)
    expect(seats['Együtt (Greens/EFA)']).to eq(1)
    expect(seats['LMP (Greens/EFA)']).to eq(1)
    expect(seats['HNEM (—)']).to eq(0)
    expect(seats['SMS (—)']).to eq(0)
  end
end
