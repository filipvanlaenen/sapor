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

describe Sapor::EuropeanUnionBulgaria, '#area_code' do
  it 'returns EU[BG] as the area code' do
    expect(Sapor::EuropeanUnionBulgaria.instance.area_code).to eq('EU[BG]')
  end
end

describe Sapor::EuropeanUnionBulgaria, '#no_of_seats' do
  it 'returns 17 as the number of seats' do
    expect(Sapor::EuropeanUnionBulgaria.instance.no_of_seats).to eq(17)
  end
end

describe Sapor::EuropeanUnionBulgaria, '#population_size' do
  it 'returns a population size of 2,015,320' do
    expect(Sapor::EuropeanUnionBulgaria.instance.population_size).to \
      eq(2_015_320)
  end
end

describe Sapor::EuropeanUnionBulgaria, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Граждани за европейско развитие на България (EPP)' => 680_838,
                'КОАЛИЦИЯ ЗА БЪЛГАРИЯ (S&D)' => 424_037,
                'Движение за права и свободи (ALDE)' => 386_725,
                'БЪЛГАРИЯ БЕЗ ЦЕНЗУРА, ВМРО, ЗНС, ГЕРГЬОВДЕН (ECR)' => 238_629,
                'РЕФОРМАТОРСКИ БЛОК (EPP)' => 144_532,
                'АЛТЕРНАТИВА ЗА БЪЛГАРСКО ВЪЗРАЖДАНЕ (—)' => 90_061,
                'НАЦИОНАЛЕН ФРОНТ ЗА СПАСЕНИЕ НА БЪЛГАРИЯ (EFDD)' => 68_376,
                'АТАКА (—)' => 66_210,
                'ГЛАС НАРОДЕН (—)' => 22_440,
                'Коалиция КОД–Антония Първанова, Илиана Раева–ОБ, НДСВ, СДП' \
                  ' (—)' => 20_487,
                'ЗЕЛЕНИТЕ (—)' => 12_547,
                'БЪЛГАРСКАТА ЛЕВИЦА (—)' => 11_014,
                'СИНЬО ЕДИНСТВО (—)' => 10_786,
                'БКП (—)' => 9_318,
                'ЗЕЛЕНА ПАРТИЯ (—)' => 7_989,
                'Инициативен комитет–Виктор Тенчев Папазов (—)' => 7_652,
                'Инициативен комитет–Румяна Вълчева Угърчинска-Винсенти (—)' \
                  => 7_373,
                'БАСТА (—)' => 7_330,
                'Инициативен комитет–Евгения Златева Банева (—)' => 6_188,
                'ПАРТИЯ НА ЗЕЛЕНИТЕ (—)' => 5_218,
                'СЪЮЗ НА КОМУНИСТИТЕ В БЪЛГАРИЯ (—)' => 3_217,
                'БЪЛГАРСКА НАЦИОНАЛНО-ПАТРИОТИЧНА ПАРТИЯ (—)' => 3_000,
                'Християндемократическа партия на България (—)' => 2_964,
                'Коалиция НАЦИОНАЛИСТИЧЕСКИ ПАРТИИ НА БЪЛГАРИЯ (—)' => 2_499 }
    seats = Sapor::EuropeanUnionBulgaria.instance.seats(results)
    expect(seats['Граждани за европейско развитие на България (EPP)']).to eq(6)
    expect(seats['КОАЛИЦИЯ ЗА БЪЛГАРИЯ (S&D)']).to eq(4)
    expect(seats['Движение за права и свободи (ALDE)']).to eq(4)
    expect(seats['БЪЛГАРИЯ БЕЗ ЦЕНЗУРА, ВМРО, ЗНС, ГЕРГЬОВДЕН (ECR)']).to eq(2)
    expect(seats['РЕФОРМАТОРСКИ БЛОК (EPP)']).to eq(1)
    expect(seats['АЛТЕРНАТИВА ЗА БЪЛГАРСКО ВЪЗРАЖДАНЕ (—)']).to eq(0)
    expect(seats['НАЦИОНАЛЕН ФРОНТ ЗА СПАСЕНИЕ НА БЪЛГАРИЯ (EFDD)']).to eq(0)
    expect(seats['АТАКА (—)']).to eq(0)
    expect(seats['ГЛАС НАРОДЕН (—)']).to eq(0)
    expect(seats['Коалиция КОД–Антония Първанова, Илиана Раева–ОБ, НДСВ, СДП' \
                 ' (—)']).to eq(0)
    expect(seats['ЗЕЛЕНИТЕ (—)']).to eq(0)
    expect(seats['БЪЛГАРСКАТА ЛЕВИЦА (—)']).to eq(0)
    expect(seats['СИНЬО ЕДИНСТВО (—)']).to eq(0)
    expect(seats['БКП (—)']).to eq(0)
    expect(seats['ЗЕЛЕНА ПАРТИЯ (—)']).to eq(0)
    expect(seats['Инициативен комитет–Виктор Тенчев Папазов (—)']).to eq(0)
    expect(seats['Инициативен комитет–Румяна Вълчева Угърчинска-Винсенти' \
                 ' (—)']).to eq(0)
    expect(seats['БАСТА (—)']).to eq(0)
    expect(seats['Инициативен комитет–Евгения Златева Банева (—)']).to eq(0)
    expect(seats['ПАРТИЯ НА ЗЕЛЕНИТЕ (—)']).to eq(0)
    expect(seats['СЪЮЗ НА КОМУНИСТИТЕ В БЪЛГАРИЯ (—)']).to eq(0)
    expect(seats['БЪЛГАРСКА НАЦИОНАЛНО-ПАТРИОТИЧНА ПАРТИЯ (—)']).to eq(0)
    expect(seats['Християндемократическа партия на България (—)']).to eq(0)
    expect(seats['Коалиция НАЦИОНАЛИСТИЧЕСКИ ПАРТИИ НА БЪЛГАРИЯ (—)']).to eq(0)
  end
end
