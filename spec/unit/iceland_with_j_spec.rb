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

describe Sapor::IcelandWithJ, '#area_code' do
  it 'returns IS∪{J} as the area code' do
    expect(Sapor::IcelandWithJ.instance.area_code).to eq('IS∪{J}')
  end
end

describe Sapor::IcelandWithJ, '#no_of_seats' do
  it 'returns 63 as the number of seats' do
    expect(Sapor::IcelandWithJ.instance.no_of_seats).to eq(63)
  end
end

describe Sapor::IcelandWithJ, '#population_size' do
  it 'returns a population size of 195,204' do
    expect(Sapor::IcelandWithJ.instance.population_size).to eq(196_246)
  end
end

describe Sapor::IcelandWithJ, '#seats' do
  it 'calculates the adapted number of seats for the election of 2017 correctly' do
    IcelandWithJ = Sapor::IcelandWithJ.instance
    results = IcelandWithJ.overall_election_results_of_2017
    seats = IcelandWithJ.seats(results)
    expect(seats['Sjálfstæðisflokkurinn']).to eq(16 - 1)
    expect(seats['Vinstrihreyfingin – grænt framboð']).to eq(11)
    expect(seats['Framsóknarflokkurinn']).to eq(8 - 1)
    expect(seats['Samfylkingin']).to eq(7)
    expect(seats['Miðflokkurinn']).to eq(7 - 1)
    expect(seats['Píratar']).to eq(6 - 1)
    expect(seats['Flokkur fólksins']).to eq(4)
    expect(seats['Sósíalistaflokkur Íslands']).to eq(4)
    expect(seats['Viðreisn']).to eq(4)
    expect(seats['Björt framtíð']).to eq(0)
    expect(seats['Dögun']).to eq(0)
    expect(seats['Alþýðufylkingin']).to eq(0)
  end
end
