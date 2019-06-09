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

describe Sapor::EuropeanUnion27Austria, '#area_code' do
  it 'returns EU27[AT] as the area code' do
    expect(Sapor::EuropeanUnion27Austria.instance.area_code).to eq('EU27[AT]')
  end
end

describe Sapor::EuropeanUnion27Austria, '#no_of_seats' do
  it 'returns 19 as the number of seats' do
    expect(Sapor::EuropeanUnion27Austria.instance.no_of_seats).to eq(19)
  end
end

describe Sapor::EuropeanUnion27Austria, '#population_size' do
  it 'returns a population size of 3,834,656' do
    expect(Sapor::EuropeanUnion27Austria.instance.population_size).to \
      eq(3_834_656)
  end
end

describe Sapor::EuropeanUnion27Austria, '#seats' do
  it 'calculates the number of seats for the election of 2019' do
    results = { 'Österreichische Volkspartei (EPP)' => 1_305_956,
                'Sozialdemokratische Partei Österreichs (S&D)' => 903_151,
                'Freiheitliche Partei Österreichs (ENF)' => 650_114,
                'Die Grünen–Die Grüne Alternative (Greens/EFA)' => 532_193,
                'NEOS–Das Neue Österreich und Liberales Forum (ALDE)' => \
                  319_024,
                'EUROPA JETZT (*)' => 39_087,
                'Kommunistische Partei Österreichs (*)' => 30_087 }
    seats = Sapor::EuropeanUnion27Austria.instance.seats(results)
    expect(seats['Österreichische Volkspartei (EPP)']).to eq(7)
    expect(seats['Sozialdemokratische Partei Österreichs (S&D)']).to eq(5)
    expect(seats['Freiheitliche Partei Österreichs (ENF)']).to eq(3)
    expect(seats['Die Grünen–Die Grüne Alternative (Greens/EFA)']).to eq(2 + 1)
    expect(seats['NEOS–Das Neue Österreich und Liberales Forum (ALDE)']).to \
      eq(1)
    expect(seats['EUROPA JETZT (*)']).to eq(0)
    expect(seats['Kommunistische Partei Österreichs (*)']).to eq(0)
  end
end
