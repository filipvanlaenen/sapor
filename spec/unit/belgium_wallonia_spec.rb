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
  it 'returns a population size of 2,073,953' do
    expect(Sapor::BelgiumWallonia.instance.population_size).to eq(2_073_953)
  end
end

describe Sapor::BelgiumWallonia, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    belgium_wallonia = Sapor::BelgiumWallonia.instance
    results = belgium_wallonia.overall_election_results_of_2014
    seats = belgium_wallonia.seats(results)
    expect(seats['PS']).to eq(18)
    expect(seats['MR']).to eq(16)
    expect(seats['cdH']).to eq(7)
    expect(seats['Ecolo']).to eq(4)
    expect(seats['PTB']).to eq(2)
    expect(seats['Parti Populaire']).to eq(1)
    expect(seats['DéFI']).to eq(0)
    expect(seats['MG']).to eq(0)
    expect(seats['LA DROITE']).to eq(0)
    expect(seats['DEBOUT LES BELGES']).to eq(0)
    expect(seats['B.U.B.']).to eq(0)
    expect(seats['CIM']).to eq(0)
    expect(seats['Faire place Nette']).to eq(0)
    expect(seats['FW']).to eq(0)
    expect(seats['ISLAM']).to eq(0)
    expect(seats['Lutte Ouvrière']).to eq(0)
    expect(seats['MOVE']).to eq(0)
    expect(seats['MGJOD']).to eq(0)
    expect(seats['NWA']).to eq(0)
    expect(seats['NATION']).to eq(0)
    expect(seats['PIRATE']).to eq(0)
    expect(seats['PP PARTIPENSIONNES']).to eq(0)
    expect(seats['P+']).to eq(0)
    expect(seats['RassemblementWalon']).to eq(0)
    expect(seats['R.W.F.']).to eq(0)
    expect(seats['VLC']).to eq(0)
    expect(seats['Vox Populi Belgica']).to eq(0)
    expect(seats["WALLONIE D'ABORD"]).to eq(0)
  end
end
