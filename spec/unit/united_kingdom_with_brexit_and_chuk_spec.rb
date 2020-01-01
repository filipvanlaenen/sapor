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

describe Sapor::UnitedKingdomWithBrexitAndChuk, '#area_code' do
  it 'returns UK∪{BREXIT,ChUK} as the area code' do
    expect(Sapor::UnitedKingdomWithBrexitAndChuk.instance.area_code).to eq('UK∪{BREXIT,ChUK}')
  end
end

describe Sapor::UnitedKingdomWithBrexitAndChuk, '#no_of_seats' do
  it 'returns 650 as the number of seats' do
    expect(Sapor::UnitedKingdomWithBrexitAndChuk.instance.no_of_seats).to eq(650)
  end
end

describe Sapor::UnitedKingdomWithBrexitAndChuk, '#population_size' do
  it 'returns a population size of 32,204,124' do
    expect(Sapor::UnitedKingdomWithBrexitAndChuk.instance.population_size).to eq(32_204_124)
  end
end

describe Sapor::UnitedKingdomWithBrexitAndChuk, '#seats' do
  it 'calculates the number of seats for the election of 8 June 2017' do
    uk = Sapor::UnitedKingdomWithBrexitAndChuk.instance
    results = uk.overall_election_results_of_2017
    seats = uk.seats(results)
    expect(seats['Conservative Party']).to eq(317 + 1)
    expect(seats['Labour Party']).to eq(262)
    expect(seats['Scottish National Party']).to eq(35)
    expect(seats['Liberal Democrats']).to eq(12)
    expect(seats['Democratic Unionist Party']).to eq(10)
    expect(seats['Sinn Féin']).to eq(7)
    expect(seats['Plaid Cymru']).to eq(4)
    expect(seats['Social Democratic & Labour Party']).to eq(0)
    expect(seats['Ulster Unionist Party']).to eq(0)
    expect(seats['UK Independence Party']).to eq(0)
    expect(seats['Brexit Party']).to eq(0)
    expect(seats['Green Party']).to eq(1)
    expect(seats['Small or local party, or independent candidate']).to eq(1)
    expect(seats['Change UK']).to eq(0)
    expect(seats['All other candidates']).to eq(0)
  end
end

describe Sapor::UnitedKingdomWithBrexitAndChuk, '#threshold' do
  it 'returns there is no threshold' do
    expect(Sapor::UnitedKingdomWithBrexitAndChuk.instance.threshold).to be_nil
  end
end
