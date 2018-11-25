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

describe Sapor::EuropeanUnionIreland2019, '#area_code' do
  it 'returns EU[IE]@2019 as the area code' do
    expect(Sapor::EuropeanUnionIreland2019.instance.area_code).to \
      eq('EU[IE]@2019')
  end
end

describe Sapor::EuropeanUnionIreland2019, '#no_of_seats' do
  it 'returns 13 as the number of seats' do
    expect(Sapor::EuropeanUnionIreland2019.instance.no_of_seats).to eq(13)
  end
end

describe Sapor::EuropeanUnionIreland2019, '#population_size' do
  it 'returns a population size of 1,656,518' do
    expect(Sapor::EuropeanUnionIreland2019.instance.population_size).to \
      eq(1_656_518)
  end
end

describe Sapor::EuropeanUnionIreland2019, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Fianna Fáil (ALDE)' => 369_545,
                'Fine Gael (EPP)' => 369_120,
                'Independents (*)' => 328_766,
                'Sinn Féin (GUE/NGL)' => 323_300,
                'Labour Party (S&D)' => 88_229,
                'Green Party (Greens/EFA)' => 81_458,
                'Socialist Party (GUE/NGL)' => 29_953,
                'Direct Democracy Ireland (*)' => 24_093,
                'People Before Profit Alliance (GUE/NGL)' => 23_875,
                'Catholic Democrats (*)' => 13_569,
                'Fís Nua (*)' => 4_610 }
    seats = Sapor::EuropeanUnionIreland2019.instance.seats(results)
    expect(seats['Fianna Fáil (ALDE)']).to eq(1 + 3)
    expect(seats['Fine Gael (EPP)']).to eq(4 - 1 + 1)
    expect(seats['Independents (*)']).to eq(3 - 1)
    expect(seats['Sinn Féin (GUE/NGL)']).to eq(3 - 1)
    expect(seats['Labour Party (S&D)']).to eq(0)
    expect(seats['Green Party (Greens/EFA)']).to eq(0 + 1)
    expect(seats['Socialist Party (GUE/NGL)']).to eq(0)
    expect(seats['Direct Democracy Ireland (*)']).to eq(0)
    expect(seats['People Before Profit Alliance (GUE/NGL)']).to eq(0)
    expect(seats['Catholic Democrats (*)']).to eq(0)
    expect(seats['Fís Nua (*)']).to eq(0)
  end
end
