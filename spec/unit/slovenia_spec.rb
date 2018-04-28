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

describe Sapor::Slovenia, '#area_code' do
  it 'returns SI as the area code' do
    expect(Sapor::Slovenia.instance.area_code).to eq('SI')
  end
end

describe Sapor::Slovenia, '#no_of_seats' do
  it 'returns 90 as the number of seats' do
    expect(Sapor::Slovenia.instance.no_of_seats).to eq(90)
  end
end

describe Sapor::Slovenia, '#population_size' do
  it 'returns a population size of 874,291' do
    expect(Sapor::Slovenia.instance.population_size).to \
      eq(874_291)
  end
end

describe Sapor::Slovenia, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Stranka Mira Cerarja' => 301_563,
                'Slovenska demokratska stranka' => 181_052,
                'Demokratična stranka upokojencev Slovenije' => 88_968,
                'Socialni demokrati' => 52_249,
                'Združena levica' => 52_189,
                'Nova Slovenija–Krščanski demokrati' => 48_846,
                'Zavezništvo Alenke Bratušek' => 38_293,
                'Slovenska ljudska stranka' => 34_548,
                'Pozitivna Slovenija' => 25_975,
                'Slovenska nacionalna stranka' => 19_218,
                'Piratska stranka Slovenije' => 11_737,
                'Stranka Verjamem' => 6_800,
                'Državljanska lista' => 5_556,
                'Zeleni Slovenije' => 4_629,
                'Enakopravni deželani–Naprej Slovenija' => 2_125,
                'Liberalno gospodarska stranka' => 458,
                'Stranka Humana Slovenija' => 85 }
    seats = Sapor::Slovenia.instance.seats(results)
    expect(seats['Stranka Mira Cerarja']).to eq(36)
    expect(seats['Slovenska demokratska stranka']).to eq(21)
    expect(seats['Demokratična stranka upokojencev Slovenije']).to eq(10)
    expect(seats['Socialni demokrati']).to eq(6)
    expect(seats['Združena levica']).to eq(6)
    expect(seats['Nova Slovenija–Krščanski demokrati']).to eq(5)
    expect(seats['Zavezništvo Alenke Bratušek']).to eq(4)
    expect(seats['Hungarian and Italian minorities']).to eq(2)
    expect(seats['Slovenska ljudska stranka']).to eq(0)
    expect(seats['Pozitivna Slovenija']).to eq(0)
    expect(seats['Slovenska nacionalna stranka']).to eq(0)
    expect(seats['Piratska stranka Slovenije']).to eq(0)
    expect(seats['Stranka Verjamem']).to eq(0)
    expect(seats['Državljanska lista']).to eq(0)
    expect(seats['Zeleni Slovenije']).to eq(0)
    expect(seats['Enakopravni deželani–Naprej Slovenija']).to eq(0)
    expect(seats['Liberalno gospodarska stranka']).to eq(0)
    expect(seats['Stranka Humana Slovenija']).to eq(0)
  end
end
