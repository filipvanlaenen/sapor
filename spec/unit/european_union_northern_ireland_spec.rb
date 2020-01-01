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

describe Sapor::EuropeanUnionNorthernIreland, '#area_code' do
  it 'returns EU[GB-NIR] as the area code' do
    expect(Sapor::EuropeanUnionNorthernIreland.instance.area_code).to \
      eq('EU[GB-NIR]')
  end
end

describe Sapor::EuropeanUnionNorthernIreland, '#no_of_seats' do
  it 'returns 3 as the number of seats' do
    expect(Sapor::EuropeanUnionNorthernIreland.instance.no_of_seats).to eq(3)
  end
end

describe Sapor::EuropeanUnionNorthernIreland, '#population_size' do
  it 'returns a population size of 572,447' do
    expect(Sapor::EuropeanUnionNorthernIreland.instance.population_size).to \
      eq(572_447)
  end
end

describe Sapor::EuropeanUnionNorthernIreland, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Sinn Féin (GUE/NGL)' => 159_813,
                'Democratic Unionist Party (NI)' => 131_163,
                'Ulster Unionist Party (ECR)' => 83_438,
                'Social Democratic and Labour Party (S&D)' => 81_594,
                'Traditional Unionist Voice (*)' => 75_806,
                'Alliance Party of Northern Ireland (ALDE)' => 44_432,
                'UK Independence Party (ENF)' => 24_584,
                'Green Party in Northern Ireland (Greens/EFA)' => 10_598,
                'NI21 (*)' => 10_553,
                'Northern Ireland Conservatives (ECR)' => 4_144}
    seats = Sapor::EuropeanUnionNorthernIreland.instance.seats(results)
    expect(seats['Sinn Féin (GUE/NGL)']).to eq(1)
    expect(seats['Democratic Unionist Party (NI)']).to eq(1)
    expect(seats['Ulster Unionist Party (ECR)']).to eq(1)
    expect(seats['Social Democratic and Labour Party (S&D)']).to eq(0)
    expect(seats['Traditional Unionist Voice (*)']).to eq(0)
    expect(seats['Alliance Party of Northern Ireland (ALDE)']).to eq(0)
    expect(seats['UK Independence Party (ENF)']).to eq(0)
    expect(seats['Green Party in Northern Ireland (Greens/EFA)']).to eq(0)
    expect(seats['NI21 (*)']).to eq(0)
    expect(seats['Northern Ireland Conservatives (ECR)']).to eq(0)
  end
end
