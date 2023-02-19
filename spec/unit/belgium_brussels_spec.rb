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
  it 'returns a population size of 501,459' do
    expect(Sapor::BelgiumBrussels.instance.population_size).to eq(501_459)
  end
end

describe Sapor::BelgiumBrussels, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    belgium_brussels = Sapor::BelgiumBrussels.instance
    results = belgium_brussels.overall_election_results_of_2019
    seats = belgium_brussels.seats(results)
    expect(seats['Ecolo']).to eq(4)
    expect(seats['Parti Socialiste']).to eq(3)
    expect(seats['Mouvement Réformateur']).to eq(3)
    expect(seats['Parti du Travail de Belgique']).to eq(2)
    expect(seats['DéFI']).to eq(2)
    expect(seats['Les Engagés']).to eq(1)
    expect(seats['Nieuw-Vlaamse Alliantie']).to eq(0)
    expect(seats['Listes Destexhe']).to eq(0)
    expect(seats['Open Vlaamse Liberalen en Democraten']).to eq(0)
    expect(seats['Parti Populaire']).to eq(0)
    expect(seats['Vlaams Belang']).to eq(0)
    expect(seats['Christen-Democratisch en Vlaams']).to eq(0)
  end
end
