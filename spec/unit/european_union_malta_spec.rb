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

describe Sapor::EuropeanUnionMalta, '#area_code' do
  it 'returns EU[MT] as the area code' do
    expect(Sapor::EuropeanUnionMalta.instance.area_code).to \
      eq('EU[MT]')
  end
end

describe Sapor::EuropeanUnionMalta, '#no_of_seats' do
  it 'returns 6 as the number of seats' do
    expect(Sapor::EuropeanUnionMalta.instance.no_of_seats).to eq(6)
  end
end

describe Sapor::EuropeanUnionMalta, '#population_size' do
  it 'returns a population size of 260,258' do
    expect(Sapor::EuropeanUnionMalta.instance.population_size).to \
      eq(260_258)
  end
end

describe Sapor::EuropeanUnionMalta, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Partit Laburista (S&D)' => 134_462,
                'Partit Nazzjonalista (EPP)' => 100_785,
                'Alternattiva Demokratika (Greens/EFA)' => 7_418,
                'Imperium Europa (*)' => 6_761,
                'Ajkla (*)' => 1_208,
                'Alleanza Bidla (*)' => 1_015,
                'Alleanza Liberali (*)' => 202 }
    seats = Sapor::EuropeanUnionMalta.instance.seats(results)
    expect(seats['Partit Laburista (S&D)']).to eq(3 + 1)
    expect(seats['Partit Nazzjonalista (EPP)']).to eq(3 - 1)
    expect(seats['Alternattiva Demokratika (Greens/EFA)']).to eq(0)
    expect(seats['Imperium Europa (*)']).to eq(0)
    expect(seats['Ajkla (*)']).to eq(0)
    expect(seats['Alleanza Bidla (*)']).to eq(0)
    expect(seats['Alleanza Liberali (*)']).to eq(0)
  end
end
