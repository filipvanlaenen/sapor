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

describe Sapor::EuropeanUnionAustria, '#area_code' do
  it 'returns EU[AT] as the area code' do
    expect(Sapor::EuropeanUnionAustria.instance.area_code).to eq('EU[AT]')
  end
end

describe Sapor::EuropeanUnionAustria, '#no_of_seats' do
  it 'returns 18 as the number of seats' do
    expect(Sapor::EuropeanUnionAustria.instance.no_of_seats).to eq(18)
  end
end

describe Sapor::EuropeanUnionAustria, '#population_size' do
  it 'returns a population size of 2,823,561' do
    expect(Sapor::EuropeanUnionAustria.instance.population_size).to \
      eq(2_823_561)
  end
end

describe Sapor::EuropeanUnionAustria, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Österreichische Volkspartei (EPP)' => 761_896,
                'Sozialdemokratische Partei Österreichs (S&D)' => 680_180,
                'Freiheitliche Partei Österreichs (ENF)' => 556_835,
                'Die Grünen–Die Grüne Alternative (Greens/EFA)' => 410_089,
                'NEOS–Das Neue Österreich und Liberales Forum (ALDE)' => \
                  229_781,
                'EU-Austritt, Direkte Demokratie, Neutralität, EU-Stop (—)' => \
                  77_897,
                'Europa Anders (—)' => 60_451,
                'Die Reformkonservativen (—)' => 33_224,
                'Bündnis Zukunft Österreich (—)' => 13_208 }
    seats = Sapor::EuropeanUnionAustria.instance.seats(results)
    expect(seats['Österreichische Volkspartei (EPP)']).to eq(5)
    expect(seats['Sozialdemokratische Partei Österreichs (S&D)']).to eq(5)
    expect(seats['Freiheitliche Partei Österreichs (ENF)']).to eq(4)
    expect(seats['Die Grünen–Die Grüne Alternative (Greens/EFA)']).to eq(3)
    expect(seats['NEOS–Das Neue Österreich und Liberales Forum (ALDE)']).to \
      eq(1)
    expect(seats['EU-Austritt, Direkte Demokratie, Neutralität, EU-Stop' \
                 ' (—)']).to eq(0)
    expect(seats['Europa Anders (—)']).to eq(0)
    expect(seats['Die Reformkonservativen (—)']).to eq(0)
    expect(seats['Bündnis Zukunft Österreich (—)']).to eq(0)
  end
end
