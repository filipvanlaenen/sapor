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

describe Sapor::PolandWithKoSldAndWiWithoutNPoAndZl, '#area_code' do
  it 'returns PL∪{KO,SLD,Wi}\{N,PO,ZL} as the area code' do
    expect(Sapor::PolandWithKoSldAndWiWithoutNPoAndZl.instance.area_code).to eq('PL∪{KO,SLD,Wi}\{N,PO,ZL}')
  end
end

describe Sapor::PolandWithKoSldAndWiWithoutNPoAndZl, '#no_of_seats' do
  it 'returns 460 as the number of seats' do
    expect(Sapor::PolandWithKoSldAndWiWithoutNPoAndZl.instance.no_of_seats).to eq(460)
  end
end

describe Sapor::PolandWithKoSldAndWiWithoutNPoAndZl, '#population_size' do
  it 'returns a population size of 15,200,671' do
    expect(Sapor::PolandWithKoSldAndWiWithoutNPoAndZl.instance.population_size).to eq(15_200_671)
  end
end

describe Sapor::PolandWithKoSldAndWiWithoutNPoAndZl, '#seats' do
  it 'calculates the number of seats for the election of 2015 correctly' do
    PolandWithKoSldAndWiWithoutNPoAndZl = Sapor::PolandWithKoSldAndWiWithoutNPoAndZl.instance
    results = PolandWithKoSldAndWiWithoutNPoAndZl.overall_election_results_of_2015
    seats = PolandWithKoSldAndWiWithoutNPoAndZl.seats(results)
    expect(seats['Prawo i Sprawiedliwość']).to eq(235 - 24)
    expect(seats['Koalicja Obywatelska']).to eq(138 + 21)
    expect(seats['Kukiz’15']).to eq(42 - 7)
    expect(seats['Polskie Stronnictwo Ludowe']).to eq(16 - 16)
    expect(seats['Mniejszość Niemiecka']).to eq(1)
    expect(seats['Sojusz Lewicy Demokratycznej']).to eq(0 + 28)
    expect(seats['Wiosna']).to eq(0 + 26)
    expect(seats['Lewica Razem']).to eq(0)
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
