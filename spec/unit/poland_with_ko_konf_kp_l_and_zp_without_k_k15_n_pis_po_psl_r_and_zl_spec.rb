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

describe Sapor::PolandWithKoKonfKpLAndZpWithoutKK15NPisPoPslRAndZl, '#area_code' do
  it 'returns PL∪{KO,KP,Konf,L,ZP}\{K,K15,N,PO,PSL,PiS,R,ZL} as the area code' do
    expect(Sapor::PolandWithKoKonfKpLAndZpWithoutKK15NPisPoPslRAndZl.instance.area_code).to eq('PL∪{KO,KP,Konf,L,ZP}\{K,K15,N,PO,PSL,PiS,R,ZL}')
  end
end

describe Sapor::PolandWithKoKonfKpLAndZpWithoutKK15NPisPoPslRAndZl, '#no_of_seats' do
  it 'returns 460 as the number of seats' do
    expect(Sapor::PolandWithKoKonfKpLAndZpWithoutKK15NPisPoPslRAndZl.instance.no_of_seats).to eq(460)
  end
end

describe Sapor::PolandWithKoKonfKpLAndZpWithoutKK15NPisPoPslRAndZl, '#population_size' do
  it 'returns a population size of 15,200,671' do
    expect(Sapor::PolandWithKoKonfKpLAndZpWithoutKK15NPisPoPslRAndZl.instance.population_size).to eq(15_200_671)
  end
end

describe Sapor::PolandWithKoKonfKpLAndZpWithoutKK15NPisPoPslRAndZl, '#seats' do
  it 'calculates the number of seats for the election of 2015 correctly' do
    PolandWithKoKonfKpLAndZpWithoutKK15NPisPoPslRAndZl = Sapor::PolandWithKoKonfKpLAndZpWithoutKK15NPisPoPslRAndZl.instance
    results = PolandWithKoKonfKpLAndZpWithoutKK15NPisPoPslRAndZl.overall_election_results_of_2015
    seats = PolandWithKoKonfKpLAndZpWithoutKK15NPisPoPslRAndZl.seats(results)
    expect(seats['Zjednoczona Prawica']).to eq(235 - 36)
    expect(seats['Koalicja Obywatelska']).to eq(138 + 20)
    expect(seats['Koalicja Polska']).to eq(42 +16 + 2)
    expect(seats['Mniejszość Niemiecka']).to eq(1)
    expect(seats['Lewica']).to eq(0 + 42)
    expect(seats['Konfederacja']).to eq(0)
    expect(seats['Bezpartyjni Samorządowcy']).to eq(0)
    expect(seats['Stonoga Partia Polska']).to eq(0)
    expect(seats['Ruch Społeczny Rzeczypospolitej Polskiej']).to eq(0)
    expect(seats['Zjednoczeni dla Śląska']).to eq(0)
    expect(seats['Samoobrona']).to eq(0)
    expect(seats['Grzegorz Braun „Szczęść Boże!”']).to eq(0)
    expect(seats['Kongres Nowej Prawicy']).to eq(0)
    expect(seats['Obywatele do Parlamentu']).to eq(0)
  end
end
