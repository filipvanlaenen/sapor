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

describe Sapor::Denmark, '#area_code' do
  it 'returns DK as the area code' do
    expect(Sapor::Denmark.instance.area_code).to eq('DK')
  end
end

describe Sapor::Denmark, '#no_of_seats' do
  it 'returns 179 as the number of seats' do
    expect(Sapor::Denmark.instance.no_of_seats).to eq(175)
  end
end

describe Sapor::Denmark, '#population_size' do
  it 'returns a population size of 3,518,987' do
    expect(Sapor::Denmark.instance.population_size).to eq(3_518_987)
  end
end

describe Sapor::Denmark, '#seats' do
  it 'calculates the number of seats for the election of 2015 correctly' do
    Denmark = Sapor::Denmark.instance
    results = Denmark.overall_election_results_of_2015
    seats = Denmark.seats(results)
    expect(seats['Socialdemokraterne']).to eq(47 - 2)
    expect(seats['Dansk Folkeparti']).to eq(37 - 1)
    expect(seats['Venstre']).to eq(34 - 1)
    expect(seats['Enhedslisten–De Rød-Grønne']).to eq(14 - 1)
    expect(seats['Liberal Alliance']).to eq(13)
    expect(seats['Alternativet']).to eq(9 - 1)
    expect(seats['Radikale Venstre']).to eq(8)
    expect(seats['Socialistisk Folkeparti']).to eq(7)
    expect(seats['Det Konservative Folkeparti']).to eq(6)
    expect(seats['Nye Borgerlige']).to eq(6)
    expect(seats['Kristendemokraterne']).to eq(0)
  end
end
