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

describe Sapor::EuropeanUnionFlanders, '#area_code' do
  it 'returns EU[BE-VLG] as the area code' do
    expect(Sapor::EuropeanUnionFlanders.instance.area_code).to eq('EU[BE-VLG]')
  end
end

describe Sapor::EuropeanUnionFlanders, '#no_of_seats' do
  it 'returns 12 as the number of seats' do
    expect(Sapor::EuropeanUnionFlanders.instance.no_of_seats).to eq(12)
  end
end

describe Sapor::EuropeanUnionFlanders, '#population_size' do
  it 'returns a population size of 4,171,869' do
    expect(Sapor::EuropeanUnionFlanders.instance.population_size).to \
      eq(4_212_371)
  end
end

describe Sapor::EuropeanUnionFlanders, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'N-VA (ECR)' => 1_123_363, 'Open Vld (ALDE)' => 859_254,
                'CD&V (EPP)' => 840_814, 'sp.a (S&D)' => 555_354,
                'Groen (Greens/EFA)' => 447_449,
                'Vlaams Belang (ENF)' => 284_891, 'PVDA+ (GUE/NGL)' => 101_246 }
    seats = Sapor::EuropeanUnionFlanders.instance.seats(results)
    expect(seats['N-VA (ECR)']).to eq(4)
    expect(seats['Open Vld (ALDE)']).to eq(3)
    expect(seats['CD&V (EPP)']).to eq(2)
    expect(seats['sp.a (S&D)']).to eq(1)
    expect(seats['Groen (Greens/EFA)']).to eq(1)
    expect(seats['Vlaams Belang (ENF)']).to eq(1)
    expect(seats['PVDA+ (GUE/NGL)']).to eq(0)
  end
end
