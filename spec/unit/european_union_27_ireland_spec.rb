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

describe Sapor::EuropeanUnion27Ireland, '#area_code' do
  it 'returns EU[IE]@2019 as the area code' do
    expect(Sapor::EuropeanUnion27Ireland.instance.area_code).to \
      eq('EU27[IE]')
  end
end

describe Sapor::EuropeanUnion27Ireland, '#no_of_seats' do
  it 'returns 13 as the number of seats' do
    expect(Sapor::EuropeanUnion27Ireland.instance.no_of_seats).to eq(13)
  end
end

describe Sapor::EuropeanUnion27Ireland, '#population_size' do
  it 'returns a population size of 1,678,003' do
    expect(Sapor::EuropeanUnion27Ireland.instance.population_size).to \
      eq(1_678_003)
  end
end

describe Sapor::EuropeanUnion27Ireland, '#seats' do
  it 'calculates the number of seats for the election of 2019' do
    results = { 'Fine Gael (EPP)' => 496_459,
                'Green Party (Greens/EFA)' => 190_755,
                'Independents 4 Change (GUE/NGL)' => 124_085,
                'Fianna Fáil (RE)' => 277_705,
                'Sinn Féin (GUE/NGL)' => 196_001,
                'Labour Party (S&D)' => 52_753,
                'Solidarity–People Before Profit (GUE/NGL)' => 38_771,
                'Social Democrats (S&D)' => 20_331,
                'Renua Ireland (*)' => 6_897,
                'Workers’ Party (NI)' => 3_701,
                'Identity Ireland (*)' => 3_685,
                'Direct Democracy Ireland (*)' => 2_773,
                'Independents (*)' => 264_087 }
    seats = Sapor::EuropeanUnion27Ireland.instance.seats(results)
    expect(seats['Fine Gael (EPP)']).to eq(4 + 1)
    expect(seats['Green Party (Greens/EFA)']).to eq(2 - 1)
    expect(seats['Independents 4 Change (GUE/NGL)']).to eq(2 - 1 + 1)
    expect(seats['Fianna Fáil (RE)']).to eq(1 + 1)
    expect(seats['Sinn Féin (GUE/NGL)']).to eq(1 - 1 + 1)
    expect(seats['Labour Party (S&D)']).to eq(0)
    expect(seats['Solidarity–People Before Profit (GUE/NGL)']).to eq(0)
    expect(seats['Social Democrats (S&D)']).to eq(0)
    expect(seats['Renua Ireland (*)']).to eq(0)
    expect(seats['Workers’ Party (NI)']).to eq(0)
    expect(seats['Identity Ireland (*)']).to eq(0)
    expect(seats['Direct Democracy Ireland (*)']).to eq(0)
    expect(seats['Independents (*)']).to eq(1 + 1)
  end
end
