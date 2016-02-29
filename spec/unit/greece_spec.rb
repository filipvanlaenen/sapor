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

describe Sapor::Greece, '#area_code' do
  it 'returns GR as the area code' do
    expect(Sapor::Greece.instance.area_code).to eq('GR')
  end
end

describe Sapor::Greece, '#coalitions' do
  it 'returns at least ΣΥΡΙΖΑ and ΣΥΡΙΖΑ+ΑΝΕΛ as the coalitions to track' do
    expect(Sapor::Greece.instance.coalitions).to include(['ΣΥΡΙΖΑ'])
    expect(Sapor::Greece.instance.coalitions).to include(%w(ΣΥΡΙΖΑ ΑΝΕΛ))
  end
end

describe Sapor::Greece, '#no_of_seats' do
  it 'returns 300 as the number of seats' do
    expect(Sapor::Greece.instance.no_of_seats).to eq(300)
  end
end

describe Sapor::Greece, '#population_size' do
  it 'returns a population size of 9,949,684' do
    expect(Sapor::Greece.instance.population_size).to eq(9_949_684)
  end
end

describe Sapor::Greece, '#seats' do
  it 'calculates the number of seats for the election of 25 January 2015' \
     ' correctly' do
    greece = Sapor::Greece.instance
    results = { 'ΣΥΡΙΖΑ' => 2_245_978, 'ΝΔ' => 1_718_694, 'ΧΑ' => 388_387,
                'Το Ποτάμι' => 373_924, 'ΚΚΕ' => 338_188, 'ΑΝΕΛ' => 293_683,
                'ΠΑΣΟΚ-ΔΠ' => 289_469, 'Το Κίνημα' => 152_557, 'ΕΚ' => 110_923,
                'Τελεία' => 109_500, 'ΛΑΟΣ' => 63_669, 'ΑΝΤΑΡΣΥΑ' => 39_497,
                'Other' => 29_820 + 7_999 + 7_615 + 4_740 + 2_363 + 3_866 }
    seats = greece.seats(results)
    expect(seats['ΣΥΡΙΖΑ']).to eq(149)
    expect(seats['ΝΔ']).to eq(76)
    expect(seats['ΧΑ']).to eq(17)
    expect(seats['Το Ποτάμι']).to eq(17)
    expect(seats['ΚΚΕ']).to eq(15)
    expect(seats['ΑΝΕΛ']).to eq(13)
    expect(seats['ΠΑΣΟΚ-ΔΠ']).to eq(13)
    expect(seats['Το Κίνημα']).to eq(0)
    expect(seats['ΕΚ']).to eq(0)
    expect(seats['Τελεία']).to eq(0)
    expect(seats['ΛΑΟΣ']).to eq(0)
    expect(seats['ΑΝΤΑΡΣΥΑ']).to eq(0)
  end
end

describe Sapor::Greece, '#threshold' do
  it 'returns a threshold of 3%' do
    expect(Sapor::Greece.instance.threshold).to eq(0.03)
  end
end
