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

describe Sapor::EuropeanUnion27Romania, '#area_code' do
  it 'returns EU27[RO] as the area code' do
    expect(Sapor::EuropeanUnion27Romania.instance.area_code).to eq('EU27[RO]')
  end
end

describe Sapor::EuropeanUnion27Romania, '#no_of_seats' do
  it 'returns 33 as the number of seats' do
    expect(Sapor::EuropeanUnion27Romania.instance.no_of_seats).to eq(33)
  end
end

describe Sapor::EuropeanUnion27Romania, '#population_size' do
  it 'returns a population size of 9,352,472' do
    expect(Sapor::EuropeanUnion27Romania.instance.population_size).to \
      eq(9_352_472)
  end
end

describe Sapor::EuropeanUnion27Romania, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Uniunea Social Democrată (S&D)' => 2_093_237,
                'Partidul Național Liberal (ALDE)' => 835_531,
                'Partidul Democrat Liberal (EPP)' => 680_853,
                'Mircea Diaconu (ALDE)' => 379_582,
                'Uniunea Democrată Maghiară din România (EPP)' => 350_689,
                'Partidul Mișcarea Populară (EPP)' => 345_973,
                'Partidul Poporului–Dan Diaconescu (—)' => 204_310,
                'Partidul România Mare (—)' => 150_484,
                'Forța Civică (EPP)' => 145_181,
                'Partidul Ecologist Român (—)' => 64_232 }
    seats = Sapor::EuropeanUnion27Romania.instance.seats(results)
    expect(seats['Uniunea Social Democrată (S&D)']).to eq(15 + 1)
    # Uniunea Social Democrata got in reality the extra seat from Mircea Diaconu
    expect(seats['Partidul Național Liberal (ALDE)']).to eq(6)
    expect(seats['Partidul Democrat Liberal (EPP)']).to eq(5)
    expect(seats['Partidul Democrat Liberal (EPP)']).to eq(5)
    expect(seats['Mircea Diaconu (ALDE)']).to eq(2) # Only one candidate
    expect(seats['Uniunea Democrată Maghiară din România (EPP)']).to eq(2)
    expect(seats['Partidul Mișcarea Populară (EPP)']).to eq(2)
    expect(seats['Partidul Poporului–Dan Diaconescu (—)']).to eq(0)
    expect(seats['Partidul România Mare (—)']).to eq(0)
    expect(seats['Forța Civică (EPP)']).to eq(0)
    expect(seats['Partidul Ecologist Român (—)']).to eq(0)
  end
end
