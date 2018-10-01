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

describe Sapor::Estonia, '#area_code' do
  it 'returns EE as the area code' do
    expect(Sapor::Estonia.instance.area_code).to eq('EE')
  end
end

describe Sapor::Estonia, '#no_of_seats' do
  it 'returns 101 as the number of seats' do
    expect(Sapor::Estonia.instance.no_of_seats).to eq(101)
  end
end

describe Sapor::Estonia, '#population_size' do
  it 'returns a population size of 577,910' do
    expect(Sapor::Estonia.instance.population_size).to eq(577_910)
  end
end

describe Sapor::Estonia, '#seats' do
  it 'calculates the number of seats for the election of 2015' do
    results = { 'Eesti Reformierakond' => 158_971,
                'Eesti Keskerakond' => 142_460,
                'Sotsiaaldemokraatlik Erakond' => 87_190,
                'Erakond Isamaa ja Res Publica Liit' => 78_697,
                'Eesti Vabaerakond' => 49_883,
                'Eesti Konservatiivne Rahvaerakond' => 46_883,
                'Erakond Eestimaa Rohelised' => 5_193,
                'Rahva Ühtsuse Erakond' => 2_289,
                'Eesti Iseseisvuspartei' => 1_047,
                'Üksikkandidaadid' => 887,
                'Eestimaa Ühendatud Vasakpartei' => 764 }
    seats = Sapor::Estonia.instance.seats(results)
    expect(seats['Eesti Reformierakond']).to eq(30)
    expect(seats['Eesti Keskerakond']).to eq(27)
    expect(seats['Sotsiaaldemokraatlik Erakond']).to eq(15)
    expect(seats['Erakond Isamaa ja Res Publica Liit']).to eq(14)
    expect(seats['Eesti Vabaerakond']).to eq(8)
    expect(seats['Eesti Konservatiivne Rahvaerakond']).to eq(7)
    expect(seats['Erakond Eestimaa Rohelised']).to eq(0)
    expect(seats['Rahva Ühtsuse Erakond']).to eq(0)
    expect(seats['Eesti Iseseisvuspartei']).to eq(0)
    expect(seats['Üksikkandidaadid']).to eq(0)
    expect(seats['Eestimaa Ühendatud Vasakpartei']).to eq(0)
  end
end
