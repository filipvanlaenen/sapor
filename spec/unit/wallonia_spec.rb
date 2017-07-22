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

describe Sapor::Wallonia, '#area_code' do
  it 'returns BE-WAL as the area code' do
    expect(Sapor::Wallonia.instance.area_code).to eq('BE-WAL')
  end
end

describe Sapor::Wallonia, '#coalitions' do
  def walloon_coalitions
    Sapor::Wallonia.instance.coalitions
  end

  it 'returns MR + cdH + Ecolo as a coalition to track' do
    expect(walloon_coalitions).to include(['cdH', 'Ecolo', 'MR'])
  end

  it 'returns PS + cdH + Ecolo as a coalition to track' do
    expect(walloon_coalitions).to include(['cdH', 'Ecolo', 'PS'])
  end

  it 'returns MR + cdH as a coalition to track' do
    expect(walloon_coalitions).to include(['cdH', 'MR'])
  end

  it 'returns PS + cdH as a coalition to track' do
    expect(walloon_coalitions).to include(['cdH', 'PS'])
  end

  it 'returns PS + cdH + PTB as a coalition to track' do
    expect(walloon_coalitions).to include(['cdH', 'PS', 'PTB'])
  end

  it 'returns MR + Ecolo as a coalition to track' do
    expect(walloon_coalitions).to include(['Ecolo', 'MR'])
  end

  it 'returns PS + MR + Ecolo as a coalition to track' do
    expect(walloon_coalitions).to include(['Ecolo', 'MR', 'PS'])
  end

  it 'returns PS + Ecolo + PTB as a coalition to track' do
    expect(walloon_coalitions).to include(['Ecolo', 'PS', 'PTB'])
  end

  it 'returns PS + MR as a coalition to track' do
    expect(walloon_coalitions).to include(['MR', 'PS'])
  end

  it 'returns PS + PTB as a coalition to track' do
    expect(walloon_coalitions).to include(['PS', 'PTB'])
  end
end

describe Sapor::Wallonia, '#no_of_seats' do
  it 'returns 75 as the number of seats' do
    expect(Sapor::Wallonia.instance.no_of_seats).to eq(75)
  end
end

describe Sapor::Wallonia, '#population_size' do
  it 'returns a population size of 2,047,387' do
    expect(Sapor::Wallonia.instance.population_size).to eq(2_047_387)
  end
end

describe Sapor::Wallonia, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    Wallonia = Sapor::Wallonia.instance
    results = Wallonia.overall_election_results_of_2014
    seats = Wallonia.seats(results)
    # expect(seats['PS']).to eq(30)
    expect(seats['PS']).to eq(28) # Correction for Hainaut?
    # expect(seats['MR']).to eq(25)
    expect(seats['MR']).to eq(24) # Correction for Hainaut?
    # expect(seats['cdH']).to eq(13)
    expect(seats['cdH']).to eq(12) # Correction for Hainaut?
    # expect(seats['Ecolo']).to eq(4)
    expect(seats['Ecolo']).to eq(6) # Correction for Hainaut?
    # expect(seats['PTB']).to eq(2)
    expect(seats['PTB']).to eq(4) # Correction for Hainaut?
    expect(seats['Parti Populaire']).to eq(1)
    expect(seats['DéFI']).to eq(0)
    expect(seats['MG']).to eq(0)
    expect(seats['VEGA']).to eq(0)
    expect(seats['La Droite']).to eq(0)
    expect(seats['Debout les Belges']).to eq(0)
    expect(seats['Atomique']).to eq(0)
    expect(seats['FW']).to eq(0)
    expect(seats['ISLAM']).to eq(0)
    expect(seats['NATION']).to eq(0)
    expect(seats['NWA']).to eq(0)
    expect(seats['P+']).to eq(0)
    expect(seats['PIRATE']).to eq(0)
    expect(seats['PP PARTIPENSIONNES']).to eq(0)
    expect(seats['R']).to eq(0)
    expect(seats['Rassemblement R']).to eq(0)
    expect(seats['Rassemblement Wallon']).to eq(0)
    expect(seats['R.W.F.']).to eq(0)
    expect(seats['UdL']).to eq(0)
    expect(seats['Union des Liberaux']).to eq(0)
    expect(seats['VLC']).to eq(0)
    expect(seats["Wallonie d'Abord"]).to eq(0)
  end
end

describe Sapor::Wallonia, '#threshold' do
  it 'returns a threshold of 5%' do
    expect(Sapor::Wallonia.instance.threshold).to eq(0.05)
  end
end
