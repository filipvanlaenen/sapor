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

describe Sapor::Iceland, '#area_code' do
  it 'returns IS as the area code' do
    expect(Sapor::Iceland.instance.area_code).to eq('IS')
  end
end

describe Sapor::Iceland, '#no_of_seats' do
  it 'returns 63 as the number of seats' do
    expect(Sapor::Iceland.instance.no_of_seats).to eq(63)
  end
end

describe Sapor::Iceland, '#population_size' do
  it 'returns a population size of 195,204' do
    expect(Sapor::Iceland.instance.population_size).to eq(195_204)
  end
end

describe Sapor::Iceland, '#seats' do
  it 'calculates the number of seats for the election of 2016 correctly' do
    iceland = Sapor::Iceland.instance
    results = iceland.overall_election_results_of_2016
    seats = iceland.seats(results)
    expect(seats['Sjálfstæðisflokkurinn']).to eq(21)
    expect(seats['Vinstrihreyfingin – grænt framboð']).to eq(10)
    expect(seats['Píratar']).to eq(10)
    expect(seats['Framsóknarflokkurinn']).to eq(8)
    expect(seats['Viðreisn']).to eq(7)
    expect(seats['Björt framtíð']).to eq(4)
    expect(seats['Samfylkingin']).to eq(3)
    expect(seats['Flokkur fólksins']).to eq(0)
    expect(seats['Dögun']).to eq(0)
    expect(seats['Alþýðufylkingin']).to eq(0)
    expect(seats['Íslenska þjóðfylkingin']).to eq(0)
    expect(seats['Húmanistaflokkurinn']).to eq(0)
  end
end
