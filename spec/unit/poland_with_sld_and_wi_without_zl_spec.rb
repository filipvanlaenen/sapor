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

describe Sapor::PolandWithSldAndWiWithoutZL, '#area_code' do
  it 'returns PL∪{SLD,Wi}\{ZL} as the area code' do
    expect(Sapor::PolandWithSldAndWiWithoutZL.instance.area_code).to eq('PL∪{SLD,Wi}\{ZL}')
  end
end

describe Sapor::PolandWithSldAndWiWithoutZL, '#no_of_seats' do
  it 'returns 460 as the number of seats' do
    expect(Sapor::PolandWithSldAndWiWithoutZL.instance.no_of_seats).to eq(460)
  end
end

describe Sapor::PolandWithSldAndWiWithoutZL, '#population_size' do
  it 'returns a population size of 15,200,671' do
    expect(Sapor::PolandWithSldAndWiWithoutZL.instance.population_size).to eq(15_200_671)
  end
end

describe Sapor::PolandWithSldAndWiWithoutZL, '#seats' do
  it 'calculates the number of seats for the election of 2015 correctly' do
    PolandWithSldAndWiWithoutZL = Sapor::PolandWithSldAndWiWithoutZL.instance
    results = PolandWithSldAndWiWithoutZL.overall_election_results_of_2015
    seats = PolandWithSldAndWiWithoutZL.seats(results)
    expect(seats['Prawo i Sprawiedliwość']).to eq(235 - 16)
    expect(seats['Platforma Obywatelska']).to eq(138 - 14)
    expect(seats['Kukiz’15']).to eq(42 - 4)
    expect(seats['.Nowoczesna']).to eq(28 - 6)
    expect(seats['Polskie Stronnictwo Ludowe']).to eq(16 - 16)
    expect(seats['Mniejszość Niemiecka']).to eq(1)
    expect(seats['Sojusz Lewicy Demokratycznej']).to eq(0 + 29)
    expect(seats['Wiosna']).to eq(0 + 27)
    expect(seats['Partia Razem']).to eq(0)
    expect(seats['KORWiN']).to eq(0)
    expect(seats['JOW Bezpartyjni']).to eq(0)
    expect(seats['Stonoga Partia Polska']).to eq(0)
    expect(seats['Ruch Społeczny Rzeczypospolitej Polskiej']).to eq(0)
    expect(seats['Zjednoczeni dla Śląska']).to eq(0)
    expect(seats['Samoobrona']).to eq(0)
    expect(seats['Grzegorz Braun „Szczęść Boże!”']).to eq(0)
    expect(seats['Kongres Nowej Prawicy']).to eq(0)
    expect(seats['Obywatele do Parlamentu']).to eq(0)
  end
end
