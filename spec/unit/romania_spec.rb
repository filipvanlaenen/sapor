
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

describe Sapor::Romania, '#area_code' do
  it 'returns RO as the area code' do
    expect(Sapor::Romania.instance.area_code).to eq('RO')
  end
end

describe Sapor::Romania, '#no_of_seats' do
  it 'returns 312 as the number of seats' do
    expect(Sapor::Romania.instance.no_of_seats).to eq(312)
  end
end

describe Sapor::Romania, '#population_size' do
  it 'returns a population size of 7,047,384' do
    expect(Sapor::Romania.instance.population_size).to \
      eq(7_047_384)
  end
end

describe Sapor::Romania, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Partidul Social Democrat' => 3_204_864,
                'Partidul Național Liberal' => 1_412_377,
                'Uniunea Salvați România' => 625_154,
                'Uniunea Democrată Maghiară din România' => 435_969,
                'Alianța Liberalilor și Democraților' => 396_386,
                'Partidul Mișcarea Populară' => 376_891,
                'Partidul România Unită' => 196_397,
                'Partidul România Mare' => 73_264,
                'Partidul Ecologist Român' => 62_414,
                'Alianța Noastră România' => 61_206,
                'Partidul Socialist Român' => 24_580,
                'Partida Romilor „Pro Europa”' => 13_126 }
    seats = Sapor::Romania.instance.seats(results)
    expect(seats['Partidul Social Democrat']).to eq(154 + 2)
    expect(seats['Partidul Național Liberal']).to eq(69 - 1)
    expect(seats['Uniunea Salvați România']).to eq(30)
    expect(seats['Uniunea Democrată Maghiară din România']).to eq(21)
    expect(seats['Alianța Liberalilor și Democraților']).to eq(20 - 1)
    expect(seats['Partidul Mișcarea Populară']).to eq(18)
    expect(seats['Partidul România Unită']).to eq(0)
    expect(seats['Partidul România Mare']).to eq(0)
    expect(seats['Partidul Ecologist Român']).to eq(0)
    expect(seats['Alianța Noastră România']).to eq(0)
    expect(seats['Partidul Socialist Român']).to eq(0)
    expect(seats['Partida Romilor „Pro Europa”']).to eq(0)
  end
end
