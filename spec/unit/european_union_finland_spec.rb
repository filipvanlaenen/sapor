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

describe Sapor::EuropeanUnionFinland, '#area_code' do
  it 'returns EU[FI] as the area code' do
    expect(Sapor::EuropeanUnionFinland.instance.area_code).to eq('EU[FI]')
  end
end

describe Sapor::EuropeanUnionFinland, '#no_of_seats' do
  it 'returns 13 as the number of seats' do
    expect(Sapor::EuropeanUnionFinland.instance.no_of_seats).to eq(13)
  end
end

describe Sapor::EuropeanUnionFinland, '#population_size' do
  it 'returns a population size of 1,830,045' do
    expect(Sapor::EuropeanUnionFinland.instance.population_size).to \
      eq(1_830_045)
  end
end

describe Sapor::EuropeanUnionFinland, '#seats' do
  it 'calculates the number of seats using the votes of the 2014 election' do
    results = { 'Kansallinen Kokoomus (EPP)' => 390_376,
                'Suomen Keskusta (ALDE)' => 339_895,
                'Perussuomalaiset (EFDD)' => 222_457,
                'Suomen Sosialidemokraattinen Puolue (S&D)' => 212_781,
                'Vihreä liitto (Greens/EFA)' => 161_263,
                'Vasemmistoliitto (GUE/NGL)' => 161_074,
                'Svenska folkpartiet i Finland (ALDE)' => 116_747,
                'Kristillisdemokraatit (EPP)' => 90_586,
                'Piraattipuolue (Greens/EFA)' => 12_378,
                'Suomen Kommunistinen Puolue (GUE/NGL)' => 5_932,
                'Itsenäisyyspuolue (—)' => 5_668,
                'Muutos 2011 (—)' => 4_768,
                'Köyhien Asialla (—)' => 2_667,
                'Sinivalkoinen Rintama (—)' => 1_176,
                'Kristiina Ilmarinen (—)' => 526 }
    seats = Sapor::EuropeanUnionFinland.instance.seats(results)
    expect(seats['Kansallinen Kokoomus (EPP)']).to eq(3)
    expect(seats['Suomen Keskusta (ALDE)']).to eq(3)
    expect(seats['Perussuomalaiset (EFDD)']).to eq(2)
    expect(seats['Suomen Sosialidemokraattinen Puolue (S&D)']).to eq(2)
    expect(seats['Vihreä liitto (Greens/EFA)']).to eq(1)
    expect(seats['Vasemmistoliitto (GUE/NGL)']).to eq(1)
    expect(seats['Svenska folkpartiet i Finland (ALDE)']).to eq(1)
    expect(seats['Kristillisdemokraatit (EPP)']).to eq(0)
    expect(seats['Piraattipuolue (Greens/EFA)']).to eq(0)
    expect(seats['Suomen Kommunistinen Puolue (GUE/NGL)']).to eq(0)
    expect(seats['Itsenäisyyspuolue (—)']).to eq(0)
    expect(seats['Muutos 2011 (—)']).to eq(0)
    expect(seats['Köyhien Asialla (—)']).to eq(0)
    expect(seats['Sinivalkoinen Rintama (—)']).to eq(0)
    expect(seats['Kristiina Ilmarinen (—)']).to eq(0)
  end
end
