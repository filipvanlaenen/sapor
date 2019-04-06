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

describe Sapor::EuropeanUnionGreatBritain, '#area_code' do
  it 'returns EU[GB-GBN] as the area code' do
    expect(Sapor::EuropeanUnionGreatBritain.instance.area_code).to \
      eq('EU[GB-GBN]')
  end
end

describe Sapor::EuropeanUnionGreatBritain, '#no_of_seats' do
  it 'returns 70 as the number of seats' do
    expect(Sapor::EuropeanUnionGreatBritain.instance.no_of_seats).to eq(70)
  end
end

describe Sapor::EuropeanUnionGreatBritain, '#population_size' do
  it 'returns a population size of 16,454,950 (UK) - 626,125 (NI)' do
    expect(Sapor::EuropeanUnionGreatBritain.instance.population_size).to \
      eq(16_454_950 - 626_125)
  end
end

describe Sapor::EuropeanUnionGreatBritain, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    great_britain = Sapor::EuropeanUnionGreatBritain.instance
    results = great_britain.overall_election_results_of_2014
    seats = great_britain.seats(results)
    expect(seats['UK Independence Party (ENF)']).to eq(24)
    expect(seats['Labour Party (S&D)']).to eq(20)
    expect(seats['Conservative Party (ECR)']).to eq(19)
    expect(seats['Green Party (Greens/EFA)']).to eq(3)
    expect(seats['Scottish National Party (Greens/EFA)']).to eq(2)
    expect(seats['Liberal Democrats (ALDE)']).to eq(1)
    expect(seats['Plaid Cymru (Greens/EFA)']).to eq(1)
    expect(seats['Alliance EPP: European People’s Party UK (EPP)']).to eq(0)
    expect(seats['Animal Welfare Party (GUE/NGL)']).to eq(0)
    expect(seats['Britain First (*)']).to eq(0)
    expect(seats['British National Party (*)']).to eq(0)
    expect(seats['Christian Peoples Alliance (ECR)']).to eq(0)
    expect(seats['Communities United Party (*)']).to eq(0)
    expect(seats['English Democrats (*)']).to eq(0)
    expect(seats['Europeans Party (*)']).to eq(0)
    expect(seats['Harmony Party (*)']).to eq(0)
    expect(seats['Independence from Europe (*)']).to eq(0)
    expect(seats['Liberty Great Britain (*)']).to eq(0)
    expect(seats['National Health Action Party (*)']).to eq(0)
    expect(seats['National Liberal Party (*)']).to eq(0)
    expect(seats['No2EU (*)']).to eq(0)
    expect(seats['Peace Party (*)']).to eq(0)
    expect(seats['Pirate Party UK (*)']).to eq(0)
    expect(seats['Roman Party (*)']).to eq(0)
    expect(seats['Socialist Equality Party (*)']).to eq(0)
    expect(seats['Socialist Labour Party (*)']).to eq(0)
    expect(seats['Socialist Party of Great Britain (*)']).to eq(0)
    expect(seats['We Demand a Referendum Now (*)']).to eq(0)
    expect(seats['Yorkshire Party (Greens/EFA)']).to eq(0)
    expect(seats['YOURVoice (*)']).to eq(0)
  end
end
