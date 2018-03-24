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

describe Sapor::EuropeanUnionCroatia2019, '#area_code' do
  it 'returns EU[HR]@2019 as the area code' do
    expect(Sapor::EuropeanUnionCroatia2019.instance.area_code).to \
      eq('EU[HR]@2019')
  end
end

describe Sapor::EuropeanUnionCroatia2019, '#no_of_seats' do
  it 'returns 12 as the number of seats' do
    expect(Sapor::EuropeanUnionCroatia2019.instance.no_of_seats).to eq(12)
  end
end

describe Sapor::EuropeanUnionCroatia2019, '#population_size' do
  it 'returns a population size of 921,904' do
    expect(Sapor::EuropeanUnionCroatia2019.instance.population_size).to \
      eq(921_904)
  end
end

describe Sapor::EuropeanUnionCroatia2019, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'HDZ-ova koalicija (EPP)' => 381_844,
                'Kukuriku koalicija (S&D)' => 275_904,
                'Održivi razvoj Hrvatske (—)' => 86_806,
                'Savez za Hrvatsku (—)' => 63_437,
                'Hrvatski laburisti–Stranka rada (GUE/NGL)' => 31_363,
                'Partnership of Croatian Center (—)' => 22_098,
                'Others (—)' => 60_452 }
    seats = Sapor::EuropeanUnionCroatia2019.instance.seats(results)
    expect(seats['HDZ-ova koalicija (EPP)']).to eq(6)
    expect(seats['Kukuriku koalicija (S&D)']).to eq(4)
    expect(seats['Održivi razvoj Hrvatske (—)']).to eq(1)
    expect(seats['Savez za Hrvatsku (—)']).to eq(0 + 1)
    expect(seats['Hrvatski laburisti–Stranka rada (GUE/NGL)']).to eq(0)
    expect(seats['Partnership of Croatian Center (—)']).to eq(0)
    expect(seats['Others (—)']).to eq(0)
  end
end
