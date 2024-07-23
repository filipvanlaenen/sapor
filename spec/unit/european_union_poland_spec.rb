# encoding: utf-8
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

describe Sapor::EuropeanUnionPoland, '#area_code' do
  it 'returns EU[PL] as the area code' do
    expect(Sapor::EuropeanUnionPoland.instance.area_code).to eq('EU[PL]')
  end
end

describe Sapor::EuropeanUnionPoland, '#no_of_seats' do
  it 'returns 53 as the number of seats' do
    expect(Sapor::EuropeanUnionPoland.instance.no_of_seats).to eq(53)
  end
end

describe Sapor::EuropeanUnionPoland, '#population_size' do
  it 'returns a population size of 11,761,825' do
    expect(Sapor::EuropeanUnionPoland.instance.population_size).to \
      eq(11_761_825)
  end
end

describe Sapor::EuropeanUnionPoland, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Platforma Obywatelska (EPP)' => 2_271_215,
                'Prawo i Sprawiedliwość (ECR)' => 2_246_870,
                'Sojusz Lewicy Demokratycznej–Unia Pracy (S&D)' => 667_319,
                'Kongres Nowej Prawicy (ENF)' => 505_586,
                'Polskie Stronnictwo Ludowe (EPP)' => 480_846,
                'Solidarna Polska Zbigniewa Ziobro (EFDD)' => 281_079,
                'Europa Plus–Twój Ruch (ALDE)' => 252_779,
                'Polska Razem (ECR)' => 223_733,
                'Ruch Narodowy (—)' => 98_626,
                'Partia Zieloni (Greens/EFA)' => 22_481,
                'Demokracja Bezpośrednia (—)' => 16_222,
                'Samoobrona (—)' => 2_729 }
    seats = Sapor::EuropeanUnionPoland.instance.seats(results)
    expect(seats['Platforma Obywatelska (EPP)']).to eq(19 + 1)
    expect(seats['Prawo i Sprawiedliwość (ECR)']).to eq(19 + 1)
    expect(seats['Sojusz Lewicy Demokratycznej–Unia Pracy (S&D)']).to eq(5)
    expect(seats['Kongres Nowej Prawicy (ENF)']).to eq(4)
    expect(seats['Polskie Stronnictwo Ludowe (EPP)']).to eq(4)
    expect(seats['Solidarna Polska Zbigniewa Ziobro (EFDD)']).to eq(0)
    expect(seats['Europa Plus–Twój Ruch (ALDE)']).to eq(0)
    expect(seats['Polska Razem (ECR)']).to eq(0)
    expect(seats['Ruch Narodowy (—)']).to eq(0)
    expect(seats['Partia Zieloni (Greens/EFA)']).to eq(0)
    expect(seats['Demokracja Bezpośrednia (—)']).to eq(0)
    expect(seats['Samoobrona (—)']).to eq(0)
  end
end
