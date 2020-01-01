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

describe Sapor::Sweden20140914, '#area_code' do
  it 'returns SE@20140914 as the area code' do
    expect(Sapor::Sweden20140914.instance.area_code).to eq('SE@20140914')
  end
end

describe Sapor::Sweden20140914, '#no_of_seats' do
  it 'returns 349 as the number of seats' do
    expect(Sapor::Sweden20140914.instance.no_of_seats).to eq(349)
  end
end

describe Sapor::Sweden20140914, '#population_size' do
  it 'returns a population size of 6,231,573' do
    expect(Sapor::Sweden20140914.instance.population_size).to \
      eq(6_231_573)
  end
end

describe Sapor::Sweden20140914, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Sveriges socialdemokratiska arbetareparti' => 1_932_711,
                'Moderata samlingspartiet' => 1_453_517,
                'Sverigedemokraterna' => 801_178,
                'Miljöpartiet de gröna' => 429_275,
                'Centerpartiet' => 380_937,
                'Vänsterpartiet' => 356_331,
                'Folkpartiet liberalerna' => 337_773,
                'Kristdemokraterna' => 284_806,
                'Feministiskt initiativ' => 194_719,
                'Piratpartiet' => 26_515,
                'Enhet' => 6_277,
                'Svenskarnas parti' => 4_189,
                'Djurens parti'	=> 4_093,
                'Kristna Värdepartiet' => 3_553,
                'Landsbygdspartiet oberoende' => 3_450,
                'SPI Välfärden' => 3_369,
                'Direktdemokraterna' => 1_417,
                'Klassiskt liberala partiet' => 1_210,
                'Vägvalet' => 1_037,
                'Rättvisepartiet Socialisterna' => 791,
                'Sveriges kommunistiska parti' => 558,
                'Framstegspartiet' => 196,
                'Europeiska arbetarpartiet'	=> 140,
                'Hälsopartiet' => 131,
                'Fredsdemokraterna' => 56,
                'Gula partiet' => 35,
                'Nya partiet' => 32,
                'Frihetliga rättvisepartiet' => 32,
                'Skånepartiet' => 28,
                'De nya svenskarna' => 18,
                'Reformist Neutral Partiet' => 11,
                'Republikanerna' => 9,
                'Djurägarpartiet' => 3,
                'Humandemokraterna' => 2 }
    seats = Sapor::Sweden20140914.instance.seats(results)
    expect(seats['Sveriges socialdemokratiska arbetareparti']).to eq(113 - 1)
    expect(seats['Moderata samlingspartiet']).to eq(84 + 1)
    expect(seats['Sverigedemokraterna']).to eq(49 - 2)
    expect(seats['Miljöpartiet de gröna']).to eq(25)
    expect(seats['Centerpartiet']).to eq(22)
    expect(seats['Vänsterpartiet']).to eq(21)
    expect(seats['Folkpartiet liberalerna']).to eq(19 + 1)
    expect(seats['Kristdemokraterna']).to eq(16 + 1)
    expect(seats['Feministiskt initiativ']).to eq(0)
    expect(seats['Piratpartiet']).to eq(0)
    expect(seats['Enhet']).to eq(0)
    expect(seats['Svenskarnas parti']).to eq(0)
    expect(seats['Djurens parti']).to eq(0)
    expect(seats['Kristna Värdepartiet']).to eq(0)
    expect(seats['Landsbygdspartiet oberoende']).to eq(0)
    expect(seats['SPI Välfärden']).to eq(0)
    expect(seats['Direktdemokraterna']).to eq(0)
    expect(seats['Klassiskt liberala partiet']).to eq(0)
    expect(seats['Vägvalet']).to eq(0)
    expect(seats['Rättvisepartiet Socialisterna']).to eq(0)
    expect(seats['Sveriges kommunistiska parti']).to eq(0)
    expect(seats['Framstegspartiet']).to eq(0)
    expect(seats['Europeiska arbetarpartiet']).to eq(0)
    expect(seats['Hälsopartiet']).to eq(0)
    expect(seats['Fredsdemokraterna']).to eq(0)
    expect(seats['Gula partiet']).to eq(0)
    expect(seats['Nya partiet']).to eq(0)
    expect(seats['Frihetliga rättvisepartiet']).to eq(0)
    expect(seats['Skånepartiet']).to eq(0)
    expect(seats['De nya svenskarna']).to eq(0)
    expect(seats['Reformist Neutral Partiet']).to eq(0)
    expect(seats['Republikanerna']).to eq(0)
    expect(seats['Djurägarpartiet']).to eq(0)
    expect(seats['Humandemokraterna']).to eq(0)
  end
end
