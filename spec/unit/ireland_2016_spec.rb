
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

describe Sapor::Ireland2016, '#area_code' do
  it 'returns IE as the area code' do
    expect(Sapor::Ireland2016.instance.area_code).to eq('IE@2016')
  end
end

describe Sapor::Ireland2016, '#no_of_seats' do
  it 'returns 158 as the number of seats' do
    expect(Sapor::Ireland2016.instance.no_of_seats).to eq(158)
  end
end

describe Sapor::Ireland2016, '#population_size' do
  it 'returns a population size of 2,132,895' do
    expect(Sapor::Ireland2016.instance.population_size).to eq(2_132_895)
  end
end

describe Sapor::Ireland2016, '#seats' do
  it 'calculates the number of seats for the election of 2016 correctly' do
    Ireland = Sapor::Ireland2016.instance
    results = Ireland.overall_election_results_of_2016
    seats = Ireland.seats(results)
    expect(seats['Fine Gael']).to eq(49 + 5)
    expect(seats['Fianna Fáil']).to eq(44 + 6)
    expect(seats['Sinn Féin']).to eq(23 - 5)
    expect(seats['The Labour Party']).to eq(7 - 4)
    expect(seats['Anti-Austerity Alliance–People Before Profit']).to eq(6 - 2)
    expect(seats['Independents 4 Change']).to eq(4 - 2)
    expect(seats['Social Democrats']).to eq(3)
    expect(seats['Green Party/Comhaontas Glas']).to eq(2 - 1)
    expect(seats['Catholic Democrats']).to eq(0)
    expect(seats['Communist Party of Ireland']).to eq(0)
    expect(seats['Direct Democracy Ireland']).to eq(0)
    expect(seats['Fís Nua']).to eq(0)
    expect(seats['Irish Democratic Party']).to eq(0)
    expect(seats['Renua Ireland']).to eq(0)
    expect(seats['Workers’ Party']).to eq(0)
    expect(seats['Independent']).to eq(20 + 3)
  end
end
