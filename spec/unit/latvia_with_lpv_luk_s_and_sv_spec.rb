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

describe Sapor::LatviaWithLpvLukSAndSv, '#area_code' do
  it 'returns LV∪{LPV,LuK,S,SV} as the area code' do
    expect(Sapor::LatviaWithLpvLukSAndSv.instance.area_code).to eq('LV∪{LPV,LuK,S,SV}')
  end
end

describe Sapor::LatviaWithLpvLukSAndSv, '#no_of_seats' do
  it 'returns 100 as the number of seats' do
    expect(Sapor::LatviaWithLpvLukSAndSv.instance.no_of_seats).to eq(100)
  end
end

describe Sapor::LatviaWithLpvLukSAndSv, '#population_size' do
  it 'returns a population size of 839,000' do
    expect(Sapor::LatviaWithLpvLukSAndSv.instance.population_size).to eq(839_000)
  end
end

describe Sapor::LatviaWithLpvLukSAndSv, '#seats' do
  it 'calculates the number of seats for the election of 2018 adjusted to 2022 seats correctly' do
    LatviaWithLpvLukSAndSv = Sapor::LatviaWithLpvLukSAndSv.instance
    results = LatviaWithLpvLukSAndSv.overall_election_results_of_2018
    seats = LatviaWithLpvLukSAndSv.seats(results)
    expect(seats['Sociāldemokrātiskā partija “Saskaņa”']).to eq(23 - 8 + 1)
    expect(seats['Stabilitātei!']).to eq(23 - 8 - 1)
    expect(seats['Politiskā partija „KPV LV”']).to eq(16 - 5)
    expect(seats['Likums un kārtība']).to eq(16 - 5)
    expect(seats['Latvija pirmajā vietā']).to eq(16 - 6)
    expect(seats['Suverēnā vara']).to eq(8 + 1)
    expect(seats['Jaunā konservatīvā partija']).to eq(16 - 7)
    expect(seats['Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un ' \
                 'Brīvībai/LNNK”']).to eq(13 - 7)
    expect(seats['Attīstībai/Par!']).to eq(13 - 6 + 1)
    expect(seats['Zaļo un Zemnieku savienība']).to eq(11 - 5)
    expect(seats['Jaunā VIENOTĪBA']).to eq(8 - 8)
    expect(seats['Latvijas Reģionu Apvienība']).to eq(0)
    expect(seats['Latvijas Krievu savienība']).to eq(0)
    expect(seats['PROGRESĪVIE']).to eq(0)
    expect(seats['No sirds Latvijai']).to eq(0)
    expect(seats['Latviešu Nacionālisti']).to eq(0)
    expect(seats['Par Alternatīvu']).to eq(0)
    expect(seats['Apvienība SKG']).to eq(0)
    expect(seats['Rīcības partija']).to eq(0)
    expect(seats['Latvijas centriskā partija']).to eq(0)
  end
end
