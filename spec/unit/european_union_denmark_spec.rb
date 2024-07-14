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

require 'spec_helper'

describe Sapor::EuropeanUnionDenmark, '#area_code' do
  it 'returns EU[DK] as the area code' do
    expect(Sapor::EuropeanUnionDenmark.instance.area_code).to \
      eq('EU[DK]')
  end
end

describe Sapor::EuropeanUnionDenmark, '#no_of_seats' do
  it 'returns 15 as the number of seats' do
    expect(Sapor::EuropeanUnionDenmark.instance.no_of_seats).to eq(15)
  end
end

describe Sapor::EuropeanUnionDenmark, '#population_size' do
  it 'returns a population size of 2,447,587' do
    expect(Sapor::EuropeanUnionDenmark.instance.population_size).to \
      eq(2_447_587)
  end
end

describe Sapor::EuropeanUnionDenmark, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Dansk Folkeparti (EFDD)' => 605_766,
                'Socialdemokraterne (S&D)' => 434_894,
                'Venstre (ALDE)' => 378_772,
                'Socialistisk Folkeparti (Greens/EFA)' => 248_244,
                'Det Konservative Folkeparti (EPP)' => 208_067,
                'Folkebevægelsen mod EU (GUE/NGL)' => 183_493,
                'Radikale Venstre (ALDE)' => 148_006,
                'Liberal Alliance (ALDE)' => 65_776,
                'Alternativet (Greens/EFA)' => 110_000 }
    seats = Sapor::EuropeanUnionDenmark.instance.seats(results)
    expect(seats['Dansk Folkeparti (EFDD)']).to eq(4)
    expect(seats['Socialdemokraterne (S&D)']).to eq(3)
    expect(seats['Venstre (ALDE)']).to eq(2 + 1)
    expect(seats['Socialistisk Folkeparti (Greens/EFA)']).to eq(1 + 1)
    expect(seats['Det Konservative Folkeparti (EPP)']).to eq(1)
    expect(seats['Folkebevægelsen mod EU (GUE/NGL)']).to eq(1)
    expect(seats['Radikale Venstre (ALDE)']).to eq(1)
    expect(seats['Liberal Alliance (ALDE)']).to eq(0)
    expect(seats['Alternativet (Greens/EFA)']).to eq(0)
  end
end
