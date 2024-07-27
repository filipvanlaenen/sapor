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

describe Sapor::EuropeanUnionIreland, '#area_code' do
  it 'returns EU[IE] as the area code' do
    expect(Sapor::EuropeanUnionIreland.instance.area_code).to \
      eq('EU[IE]')
  end
end

describe Sapor::EuropeanUnionIreland, '#no_of_seats' do
  it 'returns 14 as the number of seats' do
    expect(Sapor::EuropeanUnionIreland.instance.no_of_seats).to eq(14)
  end
end

describe Sapor::EuropeanUnionIreland, '#population_size' do
  it 'returns a population size of 1,745,230' do
    expect(Sapor::EuropeanUnionIreland.instance.population_size).to \
      eq(1_745_230)
  end
end

describe Sapor::EuropeanUnionIreland, '#seats' do
  it 'calculates the number of seats for the election of 2019' do
    results = { 'Fine Gael (EPP)' => 362_766,
                'Fianna Fáil (RE)' => 356_794,
                'Sinn Féin (GUE/NGL)' => 194_403,
                'Labour Party (S&D)' => 58_975,
                'Green Party (Greens/EFA)' => 93_575,
                'Independents 4 Change (GUE/NGL)' => 79_658,
                'Aontú (*)' => 65_559,
                'Social Democrats (S&D)' => 51_571,
                'Solidarity–People Before Profit (GUE/NGL)' => 31_802,
                'Independent Ireland (RE)' => 108_685,
                'Independents (GUE/NGL)' => 78_214,
                'Independents (RE)' => 56_339,
                'Ireland First (*)' => 32_667,
                'Irish Freedom Party (*)' => 29_709,
                'The National Party' => 12_879,
                'Rabharta (*)' => 11_302,
                'The Irish People  (*)' => 11_024,
                'Independents (*)' => 243_861 - 78_214 - 56_339 }
    seats = Sapor::EuropeanUnionIreland.instance.seats(results)
    expect(seats['Fine Gael (EPP)']).to eq(4 + 1)
    expect(seats['Fianna Fáil (RE)']).to eq(4 - 1)
    expect(seats['Sinn Féin (GUE/NGL)']).to eq(2 - 2)
    expect(seats['Independent Ireland (RE)']).to eq(1)
    expect(seats['Labour Party (S&D)']).to eq(1)
    expect(seats['Independents (GUE/NGL)']).to eq(1)
    expect(seats['Independents (RE)']).to eq(1)
    expect(seats['Independents (*)']).to eq(0)
    expect(seats['Ireland First (*)']).to eq(0)
    expect(seats['Green Party (Greens/EFA)']).to eq(0 + 1)
    expect(seats['Independents 4 Change (GUE/NGL)']).to eq(0 + 1)
    expect(seats['Solidarity–People Before Profit (GUE/NGL)']).to eq(0)
    expect(seats['Social Democrats (S&D)']).to eq(0)
    puts seats
  end
end
