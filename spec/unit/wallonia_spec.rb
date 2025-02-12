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

describe Sapor::Wallonia, '#area_code' do
  it 'returns BE-WAL as the area code' do
    expect(Sapor::Wallonia.instance.area_code).to eq('BE-WAL')
  end
end

describe Sapor::Wallonia, '#no_of_seats' do
  it 'returns 75 as the number of seats' do
    expect(Sapor::Wallonia.instance.no_of_seats).to eq(75)
  end
end

describe Sapor::Wallonia, '#population_size' do
  it 'returns a population size of 2,068,766' do
    expect(Sapor::Wallonia.instance.population_size).to eq(2_068_766)
  end
end

describe Sapor::Wallonia, '#seats' do
  it 'calculates the number of seats for the election of 2019' do
    Wallonia = Sapor::Wallonia.instance
    results = Wallonia.overall_election_results_of_2024
    seats = Wallonia.seats(results)
    expect(seats['Mouvement Réformateur']).to eq(26)
    expect(seats['Parti Socialiste']).to eq(19)
    expect(seats['Les Engagés']).to eq(17)
    expect(seats['Parti du Travail de Belgique']).to eq(8)
    expect(seats['Ecolo']).to eq(5)
    expect(seats['Chez Nous']).to eq(0)
    expect(seats['DéFI']).to eq(0)
    expect(seats['Collectif Citoyen']).to eq(0)
    expect(seats['Reprise en Main Citoyenne']).to eq(0)
  end
end

describe Sapor::Wallonia, '#threshold' do
  it 'returns a threshold of 5%' do
    expect(Sapor::Wallonia.instance.threshold).to eq(0.05)
  end
end
