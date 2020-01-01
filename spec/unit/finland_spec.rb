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

describe Sapor::Finland, '#area_code' do
  it 'returns FI as the area code' do
    expect(Sapor::Finland.instance.area_code).to eq('FI')
  end
end

describe Sapor::Finland, '#no_of_seats' do
  it 'returns 200 as the number of seats' do
    expect(Sapor::Finland.instance.no_of_seats).to eq(200)
  end
end

describe Sapor::Finland, '#population_size' do
  it 'returns a population size of 2,968,459' do
    expect(Sapor::Finland.instance.population_size).to eq(2_968_459)
  end
end

describe Sapor::Finland, '#seats' do
  it 'calculates the number of seats for the election of 2015 adjusted for' \
     ' the seat distribution for 2019' do
    Finland = Sapor::Finland.instance
    results = Finland.overall_election_results_of_2015
    seats = Sapor::Finland.instance.seats(results)
    expect(seats['Suomen Keskusta']).to eq(49 - 1)
    expect(seats['Perussuomalaiset']).to eq(38)
    expect(seats['Kansallinen Kokoomus']).to eq(37)
    expect(seats['Suomen Sosialidemokraattinen Puolue']).to eq(34)
    expect(seats['Vihreä liitto']).to eq(15 + 1)
    expect(seats['Vasemmistoliitto']).to eq(12)
    expect(seats['Svenska folkpartiet i Finland']).to eq(9)
    expect(seats['Kristillisdemokraatit']).to eq(5)
    expect(seats['Åländsk samling']).to eq(1)
    expect(seats['Piraattipuolue']).to eq(0)
    expect(seats['Itsenäisyyspuolue']).to eq(0)
    expect(seats['Suomen Kommunistinen Puolue']).to eq(0)
    expect(seats['Muutos 2011']).to eq(0)
    expect(
      seats['Kommunistinen Työväenpuolue–Rauhan ja Sosialismin puolesta']
    ).to eq(0)
    expect(seats['Suomen Työväenpuolue']).to eq(0)
    expect(seats['Köyhien Asialla']).to eq(0)
    expect(seats['Liberalerna på Åland']).to eq(0)
  end
end
