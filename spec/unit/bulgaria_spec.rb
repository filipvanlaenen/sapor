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

describe Sapor::Bulgaria, '#area_code' do
  it 'returns BG as the area code' do
    expect(Sapor::Bulgaria.instance.area_code).to eq('BG')
  end
end

describe Sapor::Bulgaria, '#no_of_seats' do
  it 'returns 240 as the number of seats' do
    expect(Sapor::Bulgaria.instance.no_of_seats).to eq(240)
  end
end

describe Sapor::Bulgaria, '#population_size' do
  it 'returns a population size of 5,069,929' do
    expect(Sapor::Bulgaria.instance.population_size).to \
      eq(3_682_499 - 169_009)
  end
end

describe Sapor::Bulgaria, '#seats' do
  it 'calculates the number of seats for the election of 2017' do
    results = { 'Граждани за европейско развитие на България' => 1_147_292,
                'Българска социалистическа партия' => 955_490,
                'Обединени Патриоти' => 318_513,
                'Движение за права и свободи' => 315_976,
                'Воля' => 145_637,
                'Реформаторски блок' => 107_407,
                'Да, България!' => 101_177,
                'Обединение ДОСТ' => 100_479,
                'Нова република'	=> 86_984,
                'АБВ–Движение 21' => 54_412,
                'Възраждане' => 37_896,
                'Зелена партия' => 10_159,
                'Българската пролет' => 9_232,
                'Движение Напред България' => 6_644,
                'Коалиция на недоволните' => 5_945,
                'ДРОМ' => 4_989,
                'Българско национално обединение' => 3_921,
                'Български демократичен център' => 3_130,
                'КОЙ–Българската левица и Зелена партия' => 2_916,
                'Национална републиканска партия' => 2_325 }
    seats = Sapor::Bulgaria.instance.seats(results)
    expect(seats['Граждани за европейско развитие на България']).to eq(95)
    expect(seats['Българска социалистическа партия']).to eq(80)
    expect(seats['Обединени Патриоти']).to eq(27)
    expect(seats['Движение за права и свободи']).to eq(26)
    expect(seats['Воля']).to eq(12)
    expect(seats['Реформаторски блок']).to eq(0)
    expect(seats['Да, България!']).to eq(0)
    expect(seats['Обединение ДОСТ']).to eq(0)
    expect(seats['Нова република']).to eq(0)
    expect(seats['АБВ–Движение 21']).to eq(0)
    expect(seats['Възраждане']).to eq(0)
    expect(seats['Зелена партия']).to eq(0)
    expect(seats['Българската пролет']).to eq(0)
    expect(seats['Движение Напред България']).to eq(0)
    expect(seats['Коалиция на недоволните']).to eq(0)
    expect(seats['ДРОМ']).to eq(0)
    expect(seats['Българско национално обединение']).to eq(0)
    expect(seats['Български демократичен център']).to eq(0)
    expect(seats['КОЙ–Българската левица и Зелена партия']).to eq(0)
    expect(seats['Национална републиканска партия']).to eq(0)
  end

  it 'does no allocate seats to Other' do
    results = { 'Граждани за европейско развитие на България' => 1_147_292,
                'Българска социалистическа партия' => 955_490,
                'Обединени Патриоти' => 318_513,
                'Движение за права и свободи' => 315_976,
                'Воля' => 145_637,
                'Other' => 107_407 + 101_177 + 100_479 + 86_984 + 54_412 + 37_896 + 10_159 + 9_232 + 6_644 + 5_945 + 4_989 + 3_921 + 3_130 + 2_916 + 2_325 }
    seats = Sapor::Bulgaria.instance.seats(results)
    expect(seats['Граждани за европейско развитие на България']).to eq(95)
    expect(seats['Българска социалистическа партия']).to eq(80)
    expect(seats['Обединени Патриоти']).to eq(27)
    expect(seats['Движение за права и свободи']).to eq(26)
    expect(seats['Воля']).to eq(12)
    expect(seats['Other']).to eq(0)
  end
end
