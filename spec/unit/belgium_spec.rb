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

describe Sapor::Belgium, '#area_code' do
  it 'returns BE as the area code' do
    expect(Sapor::Belgium.instance.area_code).to eq('BE')
  end
end

describe Sapor::Belgium, '#coalitions' do
  def belgian_coalitions
    Sapor::Belgium.instance.coalitions
  end

  it 'returns N-VA + CD&V + Open Vld + MR (Michel) as a coalition to track' do
    expect(belgian_coalitions).to include(['N-VA', 'CD&V', 'Open Vld', 'MR'])
  end
end

describe Sapor::Belgium, '#no_of_seats' do
  it 'returns 150 as the number of seats' do
    expect(Sapor::Belgium.instance.no_of_seats).to eq(150)
  end
end

describe Sapor::Belgium, '#population_size' do
  it 'returns a population size of 6,744,547' do
    expect(Sapor::Belgium.instance.population_size).to eq(6_744_547)
  end
end

describe Sapor::Belgium, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    belgium = Sapor::Belgium.instance
    results = belgium.overall_election_results_of_2014
    seats = belgium.seats(results)
    expect(seats['N-VA']).to eq(33)
    expect(seats['PS']).to eq(23)
    expect(seats['MR']).to eq(20)
    expect(seats['CD&V']).to eq(18)
    expect(seats['Open Vld']).to eq(14)
    expect(seats['sp.a']).to eq(13)
    expect(seats['cdH']).to eq(9)
    expect(seats['Ecolo']).to eq(6)
    expect(seats['Groen']).to eq(6)
    expect(seats['Vlaams Belang']).to eq(3)
    expect(seats['PTB-GO!']).to eq(2)
    expect(seats['FDF']).to eq(2)
    expect(seats['Parti Populaire']).to eq(1)
    expect(seats['PVDA+']).to eq(0)
    expect(seats['Lijst Dedecker']).to eq(0)
    expect(seats['MG']).to eq(0)
    expect(seats['LA DROITE']).to eq(0)
    expect(seats['DEBOUT LES BELGES']).to eq(0)
    expect(seats['Agora Erasmus']).to eq(0)
    expect(seats['B.U.B.']).to eq(0)
    expect(seats['CIM']).to eq(0)
    expect(seats['Égalitaires!']).to eq(0)
    expect(seats['Faire place Nette']).to eq(0)
    expect(seats['FW']).to eq(0)
    expect(seats['GAUCHES COMMUNES']).to eq(0)
    expect(seats['ISLAM']).to eq(0)
    expect(seats['LaLutte-DeStrijd']).to eq(0)
    expect(seats['Lutte Ouvrière']).to eq(0)
    expect(seats['MOVE']).to eq(0)
    expect(seats['MGJOD']).to eq(0)
    expect(seats['NWA']).to eq(0)
    expect(seats['NATION']).to eq(0)
    expect(seats['PARTI LIBERTARIEN']).to eq(0)
    expect(seats['PIRATE']).to eq(0)
    expect(seats['Piratenpartij']).to eq(0)
    expect(seats['PP PARTIPENSIONNES']).to eq(0)
    expect(seats['PVGW']).to eq(0)
    expect(seats['P+']).to eq(0)
    expect(seats['RassemblementWalon']).to eq(0)
    expect(seats['R.O.S.S.E.M.']).to eq(0)
    expect(seats['R.W.F.']).to eq(0)
    expect(seats['SD&P']).to eq(0)
    expect(seats['VLC']).to eq(0)
    expect(seats['Vox Populi Belgica']).to eq(0)
    expect(seats["WALLONIE D'ABORD"]).to eq(0)
  end
end

describe Sapor::Belgium, '#threshold' do
  it 'returns a threshold of 5%' do
    expect(Sapor::Belgium.instance.threshold).to eq(0.05)
  end
end
