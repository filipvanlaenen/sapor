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

describe Sapor::Flanders, '#no_of_seats' do
  it 'returns 124 as the number of seats' do
    expect(Sapor::Flanders.instance.no_of_seats).to eq(124)
  end
end

describe Sapor::Flanders, '#population_size' do
  it 'returns a population size of 4,238,274' do
    expect(Sapor::Flanders.instance.population_size).to eq(4_238_274)
  end
end

describe Sapor::Flanders, '#seats' do
  it 'calculates the number of seats for the election of 2019' do
    flanders = Sapor::Flanders.instance
    results = flanders.overall_election_results_of_2019
    seats = flanders.seats(results)
    expect(seats['Nieuw-Vlaamse Alliantie']).to eq(35)
    expect(seats['Christen-Democratisch en Vlaams']).to eq(19)
    expect(seats['Open Vlaamse Liberalen en Democraten']).to eq(16)
    expect(seats['Socialistische Partij Anders']).to eq(13)
    expect(seats['Groen']).to eq(14)
    expect(seats['Vlaams Belang']).to eq(23)
    expect(seats['Partij van de Arbeid van België']).to eq(4)
    expect(seats['BE.ONE']).to eq(0)
    expect(seats['Burgerlijst']).to eq(0)
    expect(seats['de coöperatie']).to eq(0)
    expect(seats['Democratisch-Solidair Appèl']).to eq(0)
    expect(seats['DierAnimal']).to eq(0)
    expect(seats['Genoeg voor iedereen']).to eq(0)
    expect(seats['Piratenpartij']).to eq(0)
    expect(seats['Partij Vrede en Solidariteit']).to eq(0)
    expect(seats['PRO']).to eq(0)
    expect(seats['Referendumpartij']).to eq(0)
    expect(seats['Union des Francophones']).to eq(0)
  end
end

describe Sapor::Flanders, '#threshold' do
  it 'returns a threshold of 5%' do
    expect(Sapor::Flanders.instance.threshold).to eq(0.05)
  end
end
