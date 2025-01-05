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

describe Sapor::BelgiumWallonia, '#area_code' do
  it 'returns BE[WAL] as the area code' do
    expect(Sapor::BelgiumWallonia.instance.area_code).to eq('BE[WAL]')
  end
end

describe Sapor::BelgiumWallonia, '#no_of_seats' do
  it 'returns 47 as the number of seats' do
    expect(Sapor::BelgiumWallonia.instance.no_of_seats).to eq(47)
  end
end

describe Sapor::BelgiumWallonia, '#population_size' do
  it 'returns a population size of 2,115,622' do
    expect(Sapor::BelgiumWallonia.instance.population_size).to eq(2_115_622)
  end
end

describe Sapor::BelgiumWallonia, '#seats' do
  it 'calculates the number of seats for the election of 2019' do
    belgium_wallonia = Sapor::BelgiumWallonia.instance
    results = belgium_wallonia.overall_election_results_of_2024
    seats = belgium_wallonia.seats(results)
    expect(seats['Mouvement Réformateur']).to eq(16)
    expect(seats['Les Engagés']).to eq(12)
    expect(seats['Parti Socialiste']).to eq(12)
    expect(seats['Parti du Travail de Belgique']).to eq(6)
    expect(seats['Ecolo']).to eq(1)
    expect(seats['DéFI']).to eq(0)
    expect(seats['Collectif Citoyen']).to eq(0)
    expect(seats['Lutte Ouvrière']).to eq(0)
  end
end
