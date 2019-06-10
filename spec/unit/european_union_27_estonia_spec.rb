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

describe Sapor::EuropeanUnion27Estonia, '#area_code' do
  it 'returns EU27[EE] as the area code' do
    expect(Sapor::EuropeanUnion27Estonia.instance.area_code).to \
      eq('EU27[EE]')
  end
end

describe Sapor::EuropeanUnion27Estonia, '#no_of_seats' do
  it 'returns 7 as the number of seats' do
    expect(Sapor::EuropeanUnion27Estonia.instance.no_of_seats).to eq(7)
  end
end

describe Sapor::EuropeanUnion27Estonia, '#population_size' do
  it 'returns a population size of 332,859' do
    expect(Sapor::EuropeanUnion27Estonia.instance.population_size).to \
      eq(332_859)
  end
end

describe Sapor::EuropeanUnion27Estonia, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Eesti Reformierakond (ALDE)' => 79_849,
                'Eesti Keskerakond (ALDE)' => 73_419,
                'Isamaa ja Res Publica Liit (EPP)' => 45_765,
                'Sotsiaaldemokraatlik Erakond (S&D)' => 44_550,
                'INDREK TARAND (Greens/EFA)' => 43_369,
                'Eesti Konservatiivne Rahvaerakond (NI)' => 13_247,
                'TANEL TALVE (*)' => 10_073,
                'SILVER MEIKAR (*)' => 6018,
                'Eesti Iseseisvuspartei (*)' => 4158,
                'KRISTIINA OJULAND (*)' => 3024,
                'KRISTA MULENOK (*)' => 1266,
                'Erakond Eestimaa Rohelised (Greens/EFA)' => 986,
                'RENE KUULMANN (*)' => 632,
                'JEVGENI KRIŠTAFOVITŠ (*)' => 594,
                'IMRE MÜRK (*)' => 330,
                'OLGA SÕTNIK (*)' => 328,
                'Eestimaa Ühendatud Vasakpartei (*)' => 226,
                'SVETLANA IVNITSKAJA (*)' => 167,
                'TAIRA AASA (*)' => 126,
                'ROMAN UBAKIVI (*)' => 96,
                'DMITRI SILBER (*)' => 	86,
                'ANDRES INN (*)' => 72,
                'LANCE GARETH EDWARD BOXALL (*)' => 64,
                'JOERI WIERSMA (*)' => 48 }
    seats = Sapor::EuropeanUnion27Estonia.instance.seats(results)
    expect(seats['Eesti Reformierakond (ALDE)']).to eq(2)
    expect(seats['Eesti Keskerakond (ALDE)']).to eq(1 + 1)
    expect(seats['Isamaa ja Res Publica Liit (EPP)']).to eq(1)
    expect(seats['Sotsiaaldemokraatlik Erakond (S&D)']).to eq(1)
    expect(seats['INDREK TARAND (Greens/EFA)']).to eq(1)
    expect(seats['Eesti Konservatiivne Rahvaerakond (NI)']).to eq(0)
    expect(seats['TANEL TALVE (*)']).to eq(0)
    expect(seats['SILVER MEIKAR (*)']).to eq(0)
    expect(seats['Eesti Iseseisvuspartei (*)']).to eq(0)
    expect(seats['KRISTIINA OJULAND (*)']).to eq(0)
    expect(seats['KRISTA MULENOK (*)']).to eq(0)
    expect(seats['Erakond Eestimaa Rohelised (Greens/EFA)']).to eq(0)
    expect(seats['RENE KUULMANN (*)']).to eq(0)
    expect(seats['JEVGENI KRIŠTAFOVITŠ (*)']).to eq(0)
    expect(seats['IMRE MÜRK (*)']).to eq(0)
    expect(seats['OLGA SÕTNIK (*)']).to eq(0)
    expect(seats['Eestimaa Ühendatud Vasakpartei (*)']).to eq(0)
    expect(seats['SVETLANA IVNITSKAJA (*)']).to eq(0)
    expect(seats['TAIRA AASA (*)']).to eq(0)
    expect(seats['ROMAN UBAKIVI (*)']).to eq(0)
    expect(seats['DMITRI SILBER (*)']).to eq(0)
    expect(seats['ANDRES INN (*)']).to eq(0)
    expect(seats['LANCE GARETH EDWARD BOXALL (*)']).to eq(0)
    expect(seats['JOERI WIERSMA (*)']).to eq(0)
  end
end
