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

describe Sapor::BelgiumFlanders, '#area_code' do
  it 'returns BE[VLG] as the area code' do
    expect(Sapor::BelgiumFlanders.instance.area_code).to eq('BE[VLG]')
  end
end

describe Sapor::BelgiumFlanders, '#no_of_seats' do
  it 'returns 87 as the number of seats' do
    expect(Sapor::BelgiumFlanders.instance.no_of_seats).to eq(87)
  end
end

describe Sapor::BelgiumFlanders, '#population_size' do
  it 'returns a population size of 4,206,305' do
    expect(Sapor::BelgiumFlanders.instance.population_size).to eq(4_206_305)
  end
end

describe Sapor::BelgiumFlanders, '#seats' do
  it 'calculates the number of seats for the election of 2019' do
    belgium_flanders = Sapor::BelgiumFlanders.instance
    results = belgium_flanders.overall_election_results_of_2019
    seats = belgium_flanders.seats(results)
    expect(seats['Nieuw-Vlaamse Alliantie']).to eq(25)
    expect(seats['Vlaams Belang']).to eq(18)
    expect(seats['Open Vlaamse Liberalen en Democraten']).to eq(12)
    expect(seats['Christen-Democratisch en Vlaams']).to eq(12)
    expect(seats['Vooruit']).to eq(9)
    expect(seats['Groen']).to eq(8)
    expect(seats['Partij van de Arbeid van België']).to eq(3)
    expect(seats['Belgische Unie – Union Belge']).to eq(0)
    expect(seats['de coöperatie']).to eq(0)
    expect(seats['DéFI']).to eq(0)
    expect(seats['Democratisch-Solidair Appèl']).to eq(0)
    expect(seats['DierAnimal']).to eq(0)
    expect(seats['Partij Vrede en Solidariteit']).to eq(0)
    expect(seats['Piratenpartij']).to eq(0)
    expect(seats['PRO']).to eq(0)
    expect(seats['Volt']).to eq(0)
  end
end
