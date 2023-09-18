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

describe Sapor::EuropeanUnionSlovenia, '#area_code' do
  it 'returns EU[SI] as the area code' do
    expect(Sapor::EuropeanUnionSlovenia.instance.area_code).to eq('EU[SI]')
  end
end

describe Sapor::EuropeanUnionSlovenia, '#no_of_seats' do
  it 'returns 9 as the number of seats' do
    expect(Sapor::EuropeanUnionSlovenia.instance.no_of_seats).to eq(9)
  end
end

describe Sapor::EuropeanUnionSlovenia, '#population_size' do
  it 'returns a population size of 471,525' do
    expect(Sapor::EuropeanUnionSlovenia.instance.population_size).to \
      eq(471_525)
  end
end

describe Sapor::EuropeanUnionSlovenia, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Kacin Konkretno (*)' => 19_659,
                'Državljanska lista (ALDE)' => 4_570,
                'Združena levica (GUE/NGL)' => 21_898,
                'Slovenska nacionalna stranka (*)' => 16_166,
                'Verjamem (Greens/EFA)' => 41_458,
                'Nova Slovenija in Slovenska ljudska stranka (EPP)' => 66_114,
                'Socialni demokrati (S&D)' => 32_330,
                'Slovenska demokratska stranka (EPP)' => 99_206,
                'Slovenski narod (*)' => 1_424,
                'Piratska stranka Slovenije (Greens/EFA)' => 10_242,
                'Solidarnost (*)' => 6_673,
                'Zeleni Slovenije (*)' => 3_273,
                'Demokratična stranka upokojencev Slovenije (ALDE)' => 32_604,
                'Sanjska služba (*)' => 14_212,
                'Pozitivna Slovenija (*)' => 26_510,
                'Zares (*)' => 3_794 }
    seats = Sapor::EuropeanUnionSlovenia.instance.seats(results)
    expect(seats['Kacin Konkretno (*)']).to eq(0)
    expect(seats['Državljanska lista (ALDE)']).to eq(0)
    expect(seats['Združena levica (GUE/NGL)']).to eq(0)
    expect(seats['Slovenska nacionalna stranka (*)']).to eq(0)
    expect(seats['Verjamem (Greens/EFA)']).to eq(1)
    expect(seats['Nova Slovenija in Slovenska ljudska stranka (EPP)']).to eq(2)
    expect(seats['Socialni demokrati (S&D)']).to eq(1)
    expect(seats['Slovenska demokratska stranka (EPP)']).to eq(3)
    expect(seats['Slovenski narod (*)']).to eq(0)
    expect(seats['Piratska stranka Slovenije (Greens/EFA)']).to eq(0)
    expect(seats['Solidarnost (*)']).to eq(0)
    expect(seats['Zeleni Slovenije (*)']).to eq(0)
    expect(seats['Demokratična stranka upokojencev Slovenije (ALDE)']).to eq(1)
    expect(seats['Sanjska služba (*)']).to eq(0)
    expect(seats['Pozitivna Slovenija (*)']).to eq(0 + 1)
    expect(seats['Zares (*)']).to eq(0)
  end
end
