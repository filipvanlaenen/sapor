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
  it 'returns a population size of 17,199,701 (UK) - 572,447 (NI)' do
    expect(Sapor::EuropeanUnionGreatBritain.instance.population_size).to \
      eq(17_199_701 - 572_447)
  end
end

describe Sapor::EuropeanUnionGreatBritain, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    great_britain = Sapor::EuropeanUnionGreatBritain.instance
    results = great_britain.overall_election_results_of_2019
    seats = great_britain.seats(results)
    expect(seats['Brexit Party (NI)']).to eq(29)
    expect(seats['Liberal Democrats (RE)']).to eq(16)
    expect(seats['Labour Party (S&D)']).to eq(10)
    expect(seats['Green Party (Greens/EFA)']).to eq(7)
    expect(seats['Conservative Party (ECR)']).to eq(4)
    expect(seats['Scottish National Party (Greens/EFA)']).to eq(3)
    expect(seats['Plaid Cymru (Greens/EFA)']).to eq(1)
    expect(seats['Change UK (RE)']).to eq(0)
    expect(seats['UK Independence Party (ID)']).to eq(0)
    expect(seats['Yorkshire Party (Greens/EFA)']).to eq(0)
    expect(seats['English Democrats (*)']).to eq(0)
    expect(seats['UK European Union Party (*)']).to eq(0)
    expect(seats['Animal Welfare Party (GUE/NGL)']).to eq(0)
    expect(seats['Women’s Equality Party (*)']).to eq(0)
    expect(seats['Independent Network (*)']).to eq(0)
    expect(seats['Socialist Party of Great Britain (*)']).to eq(0)
    expect(seats['Independent: Alan Kirkby (*)']).to eq(0)
    expect(seats['Independent: Andrea Venzon (*)']).to eq(0)
    expect(seats['Independent: Andrew Medhurst (*)']).to eq(0)
    expect(seats['Independent: Attila Csordas (*)']).to eq(0)
    expect(seats['Independent: Claudia McDowell (*)']).to eq(0)
    expect(seats['Independent: David Victor Round (*)']).to eq(0)
    expect(seats['Independent: Daze Aghaji (*)']).to eq(0)
    expect(seats['Independent: Gordon Edgar (*)']).to eq(0)
    expect(seats['Independent: Henry Muss (*)']).to eq(0)
    expect(seats['Independent: Ian Sowden (*)']).to eq(0)
    expect(seats['Independent: Jason Guy Spencer McMahon (*)']).to eq(0)
    expect(seats['Independent: Ken Parke (*)']).to eq(0)
    expect(seats['Independent: Kofi Klu (*)']).to eq(0)
    expect(seats['Independent: Larch Maxey (*)']).to eq(0)
    expect(seats['Independent: Michael Jeffrey Tuberville (*)']).to eq(0)
    expect(seats['Independent: Mike Shad (*)']).to eq(0)
    expect(seats['Independent: Mohammad Aslam (*)']).to eq(0)
    expect(seats['Independent: Mothiur Rahman (*)']).to eq(0)
    expect(seats['Independent: Neville Seed (*)']).to eq(0)
    expect(seats['Independent: Roger Hallam (*)']).to eq(0)
    expect(seats['Independent: Simon Rood (*)']).to eq(0)
    expect(seats['Independent: Tommy Robinson (*)']).to eq(0)
    expect(seats['Independent: Zoe Lafferty (*)']).to eq(0)
  end
end
