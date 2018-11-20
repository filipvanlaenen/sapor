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

describe Sapor::BelgiumBrussels, '#area_code' do
  it 'returns BE[BRU] as the area code' do
    expect(Sapor::BelgiumBrussels.instance.area_code).to eq('BE[BRU]')
  end
end

describe Sapor::BelgiumBrussels, '#no_of_seats' do
  it 'returns 15 as the number of seats' do
    expect(Sapor::BelgiumBrussels.instance.no_of_seats).to eq(15)
  end
end

describe Sapor::BelgiumBrussels, '#population_size' do
  it 'returns a population size of 498,725' do
    expect(Sapor::BelgiumBrussels.instance.population_size).to eq(498_725)
  end
end

describe Sapor::BelgiumBrussels, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    belgium_brussels = Sapor::BelgiumBrussels.instance
    results = belgium_brussels.overall_election_results_of_2014
    seats = belgium_brussels.seats(results)
    expect(seats['PS']).to eq(5)
    expect(seats['MR']).to eq(4)
    expect(seats['cdH']).to eq(2)
    expect(seats['Ecolo']).to eq(2)
    expect(seats['DéFI']).to eq(2)
    expect(seats['PTB']).to eq(0)
    expect(seats['Parti Populaire']).to eq(0)
    expect(seats['MG']).to eq(0)
    expect(seats['La Droite']).to eq(0)
    expect(seats['Debout les Belges']).to eq(0)
    expect(seats['Agora Erasmus']).to eq(0)
    expect(seats['Égalitaires!']).to eq(0)
    expect(seats['GAUCHES COMMUNES']).to eq(0)
    expect(seats['ISLAM']).to eq(0)
    expect(seats['LaLutte-DeStrijd']).to eq(0)
    expect(seats['NATION']).to eq(0)
    expect(seats['PARTI LIBERTARIEN']).to eq(0)
    expect(seats['Vlaams Belang']).to eq(0)
    expect(seats['Open Vld']).to eq(0)
    expect(seats['N-VA']).to eq(0)
    expect(seats['CD&V']).to eq(0)
    expect(seats['sp.a']).to eq(0)
  end
end
