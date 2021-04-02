# frozen_string_literal: true

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

describe Sapor::Scotland, '#area_code' do
  it 'returns GB-SCT as the area code' do
    expect(Sapor::Scotland.instance.area_code).to eq('GB-SCT')
  end
end

describe Sapor::Scotland, '#no_of_seats' do
  it 'returns 129 as the number of seats' do
    expect(Sapor::Scotland.instance.no_of_seats).to eq(129)
  end
end

describe Sapor::Scotland, '#population_size' do
  it 'returns a population size of 2,285,752' do
    expect(Sapor::Scotland.instance.population_size).to eq(2_285_752)
  end
end

describe Sapor::Scotland, '#seats' do
  it 'calculates the number of seats for the election of 2016 correctly' do
    Scotland = Sapor::Scotland.instance
    results = Scotland.overall_regional_election_results_of_2016
    seats = Scotland.seats(results)
    expect(seats['Scottish National Party']).to eq(63)
    expect(seats['Scottish Conservative & Unionist Party']).to eq(31)
    expect(seats['Scottish Labour']).to eq(24)
    expect(seats['Scottish Greens']).to eq(6)
    expect(seats['Scottish Liberal Democrats']).to eq(5)
    expect(seats['UK Independence Party']).to eq(0)
    expect(seats['Solidarity–Scotland’s Socialist Movement']).to eq(0)
    expect(seats['Scottish Christian']).to eq(0)
    expect(seats['Scottish Socialist Party']).to eq(0) # RISE–Scotland’s Left Alliance
    expect(seats['Women’s Equality Party']).to eq(0)
    expect(seats['British Unionist Party']).to eq(0)
    expect(seats['Clydesdale and South Scotland Independent']).to eq(0)
    expect(seats['Animal Welfare Party']).to eq(0)
    expect(seats['Scottish Libertarian']).to eq(0)
    expect(seats['National Front']).to eq(0)
    expect(seats['Communist Party of Britain']).to eq(0)
#    expect(seats['Trade Unionist and Socialist Coalition']).to eq(0)
    expect(seats['Independent']).to eq(0)
  end
end
