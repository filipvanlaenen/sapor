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

describe Sapor::PolandWithKoAndLWithoutNPoRAndZl, '#area_code' do
  it 'returns PL∪{KO,L}\{N,PO,R,ZL} as the area code' do
    expect(Sapor::PolandWithKoAndLWithoutNPoRAndZl.instance.area_code).to eq('PL∪{KO,L}\{N,PO,R,ZL}')
  end
end

describe Sapor::PolandWithKoAndLWithoutNPoRAndZl, '#no_of_seats' do
  it 'returns 460 as the number of seats' do
    expect(Sapor::PolandWithKoAndLWithoutNPoRAndZl.instance.no_of_seats).to eq(460)
  end
end

describe Sapor::PolandWithKoAndLWithoutNPoRAndZl, '#population_size' do
  it 'returns a population size of 15,200,671' do
    expect(Sapor::PolandWithKoAndLWithoutNPoRAndZl.instance.population_size).to eq(15_200_671)
  end
end

describe Sapor::PolandWithKoAndLWithoutNPoRAndZl, '#seats' do
  it 'calculates the number of seats for the election of 2015 correctly' do
    PolandWithKoAndLWithoutNPoRAndZl = Sapor::PolandWithKoAndLWithoutNPoRAndZl.instance
    results = PolandWithKoAndLWithoutNPoRAndZl.overall_election_results_of_2015
    seats = PolandWithKoAndLWithoutNPoRAndZl.seats(results)
    expect(seats['Prawo i Sprawiedliwość']).to eq(235 - 30)
    expect(seats['Koalicja Obywatelska']).to eq(138 + 24)
    expect(seats['Kukiz’15']).to eq(42 - 7)
    expect(seats['Polskie Stronnictwo Ludowe']).to eq(16 - 4)
    expect(seats['Mniejszość Niemiecka']).to eq(1)
    expect(seats['Lewica']).to eq(0 + 45)
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
