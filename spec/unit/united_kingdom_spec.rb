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

describe Sapor::UnitedKingdom, '#area_code' do
  it 'returns UK as the area code' do
    expect(Sapor::UnitedKingdom.instance.area_code).to eq('UK')
  end
end

describe Sapor::UnitedKingdom, '#coalitions' do
  def british_coalitions
    Sapor::UnitedKingdom.instance.coalitions
  end

  it 'returns a conservative cabinet as a coalition to track' do
    expect(british_coalitions).to include(['Conservative Party'])
  end

  it 'returns a labour cabinet as a coalition to track' do
    expect(british_coalitions).to include(['Labour Party'])
  end

  it 'returns a conservative-liberal democrat cabinet as a coalition to' \
     ' track' do
    expect(british_coalitions).to include(['Conservative Party',
                                           'Liberal Democrats'])
  end

  it 'returns a conservative-SNP cabinet as a coalition to' \
     ' track' do
    expect(british_coalitions).to include(['Conservative Party',
                                           'Scottish National Party'])
  end

  it 'returns a conservative-Plaid Cymru cabinet as a coalition to' \
     ' track' do
    expect(british_coalitions).to include(['Conservative Party', 'Plaid Cymru'])
  end

  it 'returns a conservative-SNP-Plaid Cymru cabinet as a coalition to' \
     ' track' do
    expect(british_coalitions).to include(['Conservative Party', 'Plaid Cymru',
                                           'Scottish National Party'])
  end

  it 'returns a labour-liberal democrat cabinet as a coalition to track' do
    expect(british_coalitions).to include(['Labour Party', 'Liberal Democrats'])
  end

  it 'returns a labour-SNP cabinet as a coalition to track' do
    expect(british_coalitions).to include(['Labour Party',
                                           'Scottish National Party'])
  end

  it 'returns a labour-Plaid Cymru cabinet as a coalition to track' do
    expect(british_coalitions).to include(['Labour Party', 'Plaid Cymru'])
  end

  it 'returns a labour-SNP-Plaid Cymru cabinet as a coalition to track' do
    expect(british_coalitions).to include(['Labour Party', 'Plaid Cymru',
                                           'Scottish National Party'])
  end

  it 'returns a labour-liberal democrat-SNP cabinet as a coalition to track' do
    expect(british_coalitions).to include(['Labour Party', 'Liberal Democrats',
                                           'Scottish National Party'])
  end

  it 'returns a labour-liberal democrat-Plaid Cymru cabinet as a coalition to' \
     ' track' do
    expect(british_coalitions).to include(['Labour Party', 'Liberal Democrats',
                                           'Plaid Cymru'])
  end

  it 'returns a labour-liberal democrat-SNP-Plaid Cymru cabinet as a' \
     ' coalition to track' do
    expect(british_coalitions).to include(['Labour Party', 'Liberal Democrats',
                                           'Plaid Cymru',
                                           'Scottish National Party'])
  end
end

describe Sapor::UnitedKingdom, '#no_of_seats' do
  it 'returns 650 as the number of seats' do
    expect(Sapor::UnitedKingdom.instance.no_of_seats).to eq(650)
  end
end

describe Sapor::UnitedKingdom, '#population_size' do
  it 'returns a population size of 30,697,525' do
    expect(Sapor::UnitedKingdom.instance.population_size).to eq(30_697_525)
  end
end

describe Sapor::UnitedKingdom, '#seats' do
  it 'calculates the number of seats for the election of 2015' do
    uk = Sapor::UnitedKingdom.instance
    results = uk.overall_election_results_of_2015
    seats = uk.seats(results)
    expect(seats['Conservative Party']).to eq(330)
    expect(seats['Labour Party']).to eq(232)
    expect(seats['Scottish National Party']).to eq(56)
    expect(seats['Liberal Democrats']).to eq(8)
    expect(seats['Democratic Unionist Party']).to eq(8)
    expect(seats['Sinn Féin']).to eq(4)
    expect(seats['Plaid Cymru']).to eq(3)
    expect(seats['Social Democratic & Labour Party']).to eq(3)
    expect(seats['Ulster Unionist Party']).to eq(2)
    expect(seats['UK Independence Party']).to eq(1)
    expect(seats['Green Party']).to eq(1)
    expect(seats['Speaker']).to eq(1)
    expect(seats['Indipendent']).to eq(1)
  end
end

describe Sapor::UnitedKingdom, '#threshold' do
  it 'returns there is no threshold' do
    expect(Sapor::UnitedKingdom.instance.threshold).to be_nil
  end
end
