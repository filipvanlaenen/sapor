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

describe Sapor::EuropeanUnionCroatia, '#area_code' do
  it 'returns EU[HR] as the area code' do
    expect(Sapor::EuropeanUnionCroatia.instance.area_code).to eq('EU[HR]')
  end
end

describe Sapor::EuropeanUnionCroatia, '#no_of_seats' do
  it 'returns 11 as the number of seats' do
    expect(Sapor::EuropeanUnionCroatia.instance.no_of_seats).to eq(11)
  end
end

describe Sapor::EuropeanUnionCroatia, '#population_size' do
  it 'returns a population size of 1,073,954' do
    expect(Sapor::EuropeanUnionCroatia.instance.population_size).to \
      eq(1_073_954)
  end
end

describe Sapor::EuropeanUnionCroatia, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'HDZ-ova koalicija (EPP)' => 381_844,
                'Kukuriku koalicija (S&D)' => 275_904,
                'Održivi razvoj Hrvatske (—)' => 86_806,
                'Savez za Hrvatsku (—)' => 63_437,
                'Hrvatski laburisti–Stranka rada (GUE/NGL)' => 31_363,
                'Partnership of Croatian Center (—)' => 22_098,
                'Others (—)' => 60_452 }
    seats = Sapor::EuropeanUnionCroatia.instance.seats(results)
    expect(seats['HDZ-ova koalicija (EPP)']).to eq(6)
    expect(seats['Kukuriku koalicija (S&D)']).to eq(4)
    expect(seats['Održivi razvoj Hrvatske (—)']).to eq(1)
    expect(seats['Savez za Hrvatsku (—)']).to eq(0)
    expect(seats['Hrvatski laburisti–Stranka rada (GUE/NGL)']).to eq(0)
    expect(seats['Partnership of Croatian Center (—)']).to eq(0)
    expect(seats['Others (—)']).to eq(0)
  end
end
