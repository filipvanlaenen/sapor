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

describe Sapor::Latvia, '#area_code' do
  it 'returns LV as the area code' do
    expect(Sapor::Latvia.instance.area_code).to eq('LV')
  end
end

describe Sapor::Latvia, '#no_of_seats' do
  it 'returns 100 as the number of seats' do
    expect(Sapor::Latvia.instance.no_of_seats).to eq(100)
  end
end

describe Sapor::Latvia, '#population_size' do
  it 'returns a population size of 913,491' do
    expect(Sapor::Latvia.instance.population_size).to eq(913_491)
  end
end

describe Sapor::Latvia, '#seats' do
  it 'calculates the number of seats for the election of 2014 correctly' do
    Latvia = Sapor::Latvia.instance
    results = Latvia.overall_election_results_of_2014
    seats = Latvia.seats(results)
    expect(seats['Sociāldemokrātiskā Partija “Saskaņa”']).to eq(24)
    expect(seats['Vienotība']).to eq(23 - 1)
    expect(seats['Zaļo un Zemnieku savienība']).to eq(21)
    expect(seats['Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un Brīvībai/LNNK”']).to eq(17)
    expect(seats['Latvijas Reģionu apvienība']).to eq(8 - 1)
    expect(seats['No sirds Latvijai']).to eq(7)
    expect(seats['Latvijas Krievu savienība']).to eq(0 + 2)
    expect(seats['Latvijas attīstībai']).to eq(0)
    expect(seats['“Suverenitāte”']).to eq(0)
    expect(seats['Partija “Brīvība. Brīvs no bailēm, naida un dusmām”']).to eq(0)
    expect(seats['Politiskā partija Izaugsme']).to eq(0)
    expect(seats['Vienoti Latvijai']).to eq(0)
    expect(seats['Jaunā konservatīvā partija']).to eq(0)
  end
end
