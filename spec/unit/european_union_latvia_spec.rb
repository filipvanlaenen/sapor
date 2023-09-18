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

describe Sapor::EuropeanUnionLatvia, '#area_code' do
  it 'returns EU[LV] as the area code' do
    expect(Sapor::EuropeanUnionLatvia.instance.area_code).to eq('EU[LV]')
  end
end

describe Sapor::EuropeanUnionLatvia, '#no_of_seats' do
  it 'returns 9 as the number of seats' do
    expect(Sapor::EuropeanUnionLatvia.instance.no_of_seats).to eq(9)
  end
end

describe Sapor::EuropeanUnionLatvia, '#population_size' do
  it 'returns a population size of 470.460' do
    expect(Sapor::EuropeanUnionLatvia.instance.population_size).to \
      eq(470_460)
  end
end

describe Sapor::EuropeanUnionLatvia, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Vienotība (EPP)' => 204_979,
                'Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un ' \
                  'Brīvībai/LNNK” (ECR)' => 63_229,
                'Sociāldemokrātiskā Partija “Saskaņa” (S&D)' => 57_863,
                'Zaļo un Zemnieku savienība (ALDE)' => 36_637,
                'Latvijas Krievu savienība (Greens/EFA)' => 28_303,
                'Alternative (*)' => 16_566,
                'Latvijas Reģionu apvienība (*)' => 11_035,
                'Latvijas attīstībai (ALDE)' => 9_421,
                'Latvijas Sociālistiskā partija (NI)' => 6_817,
                'Latvijas Sociāldemokrātiskā Strādnieku partija (S&D)' => 1_462,
                'Kristīgi demokrātiskā savienība (ECR)' => 1_453,
                'Latvijas Atdzimšanas partija (*)' => 1_252,
                'Par prezidentālu republiku (*)' => 672,
                'Suverenitāte (*)' => 599 }
    seats = Sapor::EuropeanUnionLatvia.instance.seats(results)
    expect(seats['Vienotība (EPP)']).to eq(4 + 1)
    expect(seats['Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un ' \
                   'Brīvībai/LNNK” (ECR)']).to eq(1)
    expect(seats['Sociāldemokrātiskā Partija “Saskaņa” (S&D)']).to eq(1)
    expect(seats['Zaļo un Zemnieku savienība (ALDE)']).to eq(1)
    expect(seats['Latvijas Krievu savienība (Greens/EFA)']).to eq(1)
    expect(seats['Alternative (*)']).to eq(0)
    expect(seats['Latvijas Reģionu apvienība (*)']).to eq(0)
    expect(seats['Latvijas attīstībai (ALDE)']).to eq(0)
    expect(seats['Latvijas Sociālistiskā partija (NI)']).to eq(0)
    expect(seats['Latvijas Sociāldemokrātiskā Strādnieku partija (S&D)']).to \
      eq(0)
    expect(seats['Kristīgi demokrātiskā savienība (ECR)']).to eq(0)
    expect(seats['Latvijas Atdzimšanas partija (*)']).to eq(0)
    expect(seats['Par prezidentālu republiku (*)']).to eq(0)
    expect(seats['Suverenitāte (*)']).to eq(0)
  end
end
