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

describe Sapor::EuropeanUnionPortugal, '#area_code' do
  it 'returns EU[PT] as the area code' do
    expect(Sapor::EuropeanUnionPortugal.instance.area_code).to eq('EU[PT]')
  end
end

describe Sapor::EuropeanUnionPortugal, '#no_of_seats' do
  it 'returns 21 as the number of seats' do
    expect(Sapor::EuropeanUnionPortugal.instance.no_of_seats).to eq(21)
  end
end

describe Sapor::EuropeanUnionPortugal, '#population_size' do
  it 'returns a population size of 3,084,505' do
    expect(Sapor::EuropeanUnionPortugal.instance.population_size).to \
      eq(3_084_505)
  end
end

describe Sapor::EuropeanUnionPortugal, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Partido Socialista (S&D)' => 1_033_158,
                'Aliança Portugal (EPP)' => 909_932,
                'Coligação Democrática Unitária (GUE/NGL)' => 416_446,
                'Partido da Terra (ALDE)' => 234_603,
                'Bloco de Esquerda (GUE/NGL)' => 149_628,
                'LIVRE (Greens/EFA)' => 71_602,
                'Partido pelos Animais e pela Natureza (GUE/NGL)' => 56_363,
                'PCTP/MRPP (—)' => 54_622,
                'Partido da Nova Democracia (ALDE)' => 23_046,
                'Partido Trabalhista Português (—)' => 22_531,
                'Partido Popular Monárquico (—)' => 17_732,
                'Partido Nacional Renovador (—)' => 15_036,
                'Movimento Alternativa Socialista (—)' => 12_442,
                'Portugal pro Vida (—)' => 12_017,
                'Partido Democrático do Atlântico (ALDE)' => 5_300,
                'Partido Operário de Unidade Socialista (—)' => 3_695 }
    seats = Sapor::EuropeanUnionPortugal.instance.seats(results)
    expect(seats['Partido Socialista (S&D)']).to eq(8)
    expect(seats['Aliança Portugal (EPP)']).to eq(7)
    expect(seats['Coligação Democrática Unitária (GUE/NGL)']).to eq(3)
    expect(seats['Partido da Terra (ALDE)']).to eq(2)
    expect(seats['Bloco de Esquerda (GUE/NGL)']).to eq(1)
    expect(seats['LIVRE (Greens/EFA)']).to eq(0)
    expect(seats['Partido pelos Animais e pela Natureza (GUE/NGL)']).to eq(0)
    expect(seats['PCTP/MRPP (—)']).to eq(0)
    expect(seats['Partido da Nova Democracia (ALDE)']).to eq(0)
    expect(seats['Partido Trabalhista Português (—)']).to eq(0)
    expect(seats['Partido Popular Monárquico (—)']).to eq(0)
    expect(seats['Partido Nacional Renovador (—)']).to eq(0)
    expect(seats['Movimento Alternativa Socialista (—)']).to eq(0)
    expect(seats['Portugal pro Vida (—)']).to eq(0)
    expect(seats['Partido Democrático do Atlântico (ALDE)']).to eq(0)
    expect(seats['Partido Operário de Unidade Socialista (—)']).to eq(0)
  end
end
