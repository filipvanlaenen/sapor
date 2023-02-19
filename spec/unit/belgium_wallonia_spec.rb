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
  it 'returns 48 as the number of seats' do
    expect(Sapor::BelgiumWallonia.instance.no_of_seats).to eq(48)
  end
end

describe Sapor::BelgiumWallonia, '#population_size' do
  it 'returns a population size of 2,072,774' do
    expect(Sapor::BelgiumWallonia.instance.population_size).to eq(2_072_774)
  end
end

describe Sapor::BelgiumWallonia, '#seats' do
  it 'calculates the number of seats for the election of 2019' do
    belgium_wallonia = Sapor::BelgiumWallonia.instance
    results = belgium_wallonia.overall_election_results_of_2019
    seats = belgium_wallonia.seats(results)
    expect(seats['Parti Socialiste']).to eq(17)
    expect(seats['Mouvement Réformateur']).to eq(11)
    expect(seats['Ecolo']).to eq(9)
    expect(seats['Parti du Travail de Belgique']).to eq(7)
    expect(seats['Les Engagés']).to eq(4)
    expect(seats['DéFI']).to eq(0)
    expect(seats['AGIR']).to eq(0)
    expect(seats['Collectif Citoyen']).to eq(0)
    expect(seats['DierAnimal']).to eq(0)
    expect(seats['La Droite']).to eq(0)
    expect(seats['Les Belges d’Abord']).to eq(0)
    expect(seats['Listes Destexhe']).to eq(0)
    expect(seats['Lutte Ouvrière']).to eq(0)
    expect(seats['NATION']).to eq(0)
    expect(seats['Parti Communiste de Belgique']).to eq(0)
    expect(seats['Parti Populaire']).to eq(0)
    expect(seats['Turquoise']).to eq(0)
    expect(seats['Vlaams Belang']).to eq(0)
    expect(seats['Wallonie Insoumise']).to eq(0)
  end
end
