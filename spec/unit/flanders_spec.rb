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

describe Sapor::Flanders, '#area_code' do
  it 'returns BE-VLG as the area code' do
    expect(Sapor::Flanders.instance.area_code).to eq('BE-VLG')
  end
end

describe Sapor::Flanders, '#coalitions' do
  def flemish_coalitions
    Sapor::Flanders.instance.coalitions
  end

  it 'returns N-VA + CD&V as a coalition to track' do
    expect(flemish_coalitions).to include(['N-VA', 'CD&V'])
  end

  it 'returns N-VA + CD&V + Open Vld as a coalition to track' do
    expect(flemish_coalitions).to include(['N-VA', 'CD&V', 'Open Vld'])
  end
end

describe Sapor::Flanders, '#no_of_seats' do
  it 'returns 124 as the number of seats' do
    expect(Sapor::Flanders.instance.no_of_seats).to eq(124)
  end
end

describe Sapor::Flanders, '#population_size' do
  it 'returns a population size of 4,202,462' do
    expect(Sapor::Flanders.instance.population_size).to eq(4_202_462)
  end
end

describe Sapor::Flanders, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    flanders = Sapor::Flanders.instance
    results = flanders.overall_election_results_of_2014
    seats = flanders.seats(results)
    expect(seats['N-VA']).to eq(43)
    expect(seats['CD&V']).to eq(27)
    expect(seats['Open Vld']).to eq(19)
    expect(seats['sp.a']).to eq(18)
    expect(seats['Groen']).to eq(10)
    expect(seats['Vlaams Belang']).to eq(6)
    expect(seats['PVDA']).to eq(0)
    expect(seats['UF']).to eq(1)
    expect(seats['Piratenpartij']).to eq(0)
    expect(seats['GENOEG']).to eq(0)
    expect(seats['ROSSEM']).to eq(0)
    expect(seats['ROEL']).to eq(0)
    expect(seats['VCP']).to eq(0)
    expect(seats['MAMA']).to eq(0)
    expect(seats['SD&P']).to eq(0)
    expect(seats['VITAL']).to eq(0)
    expect(seats['PENSIOEN PLUS']).to eq(0)
  end
end

describe Sapor::Flanders, '#threshold' do
  it 'returns a threshold of 5%' do
    expect(Sapor::Flanders.instance.threshold).to eq(0.05)
  end
end
