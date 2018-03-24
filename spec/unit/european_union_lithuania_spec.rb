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

describe Sapor::EuropeanUnionLithuania, '#area_code' do
  it 'returns EU[LT] as the area code' do
    expect(Sapor::EuropeanUnionLithuania.instance.area_code).to eq('EU[LT]')
  end
end

describe Sapor::EuropeanUnionLithuania, '#no_of_seats' do
  it 'returns 11 as the number of seats' do
    expect(Sapor::EuropeanUnionLithuania.instance.no_of_seats).to eq(11)
  end
end

describe Sapor::EuropeanUnionLithuania, '#population_size' do
  it 'returns a population size of 1,144,131' do
    expect(Sapor::EuropeanUnionLithuania.instance.population_size).to \
      eq(1_144_131)
  end
end

describe Sapor::EuropeanUnionLithuania, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Tėvynės sąjunga–Lietuvos krikščionys demokratai (EPP)' => \
                  199_393,
                'Lietuvos socialdemokratų partija (S&D)' => 197_477,
                'Liberalų Sąjūdis (ALDE)' => 189_373,
                'Partija tvarka ir teisingumas (EFDD)' => 163_049,
                'Darbo Partija (ALDE)' => 146_607,
                'Lietuvos lenkų rinkimų akcija–Rusų aljanso (ECR)' => 92_108,
                'Lietuvos valstiečių ir žaliųjų sąjunga (Greens/EFA)' => 75_643,
                'Lietuvos Žaliųjų Partija (—)' => 40_696,
                'Lietuvių tautininkų sąjunga (—)' => 22_858,
                'Liberalų ir centro sąjunga (ALDE)' => 16_927 }
    seats = Sapor::EuropeanUnionLithuania.instance.seats(results)
    expect(seats['Tėvynės sąjunga–Lietuvos krikščionys demokratai (EPP)']).to \
      eq(2)
    expect(seats['Lietuvos socialdemokratų partija (S&D)']).to eq(2)
    expect(seats['Liberalų Sąjūdis (ALDE)']).to eq(2)
    expect(seats['Partija tvarka ir teisingumas (EFDD)']).to eq(2)
    expect(seats['Darbo Partija (ALDE)']).to eq(1)
    expect(seats['Lietuvos lenkų rinkimų akcija–Rusų aljanso (ECR)']).to eq(1)
    expect(seats['Lietuvos valstiečių ir žaliųjų sąjunga (Greens/EFA)']).to \
      eq(1)
    expect(seats['Lietuvos Žaliųjų Partija (—)']).to eq(0)
    expect(seats['Lietuvių tautininkų sąjunga (—)']).to eq(0)
    expect(seats['Liberalų ir centro sąjunga (ALDE)']).to eq(0)
  end
end
