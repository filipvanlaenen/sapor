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

describe Sapor::EuropeanUnionItaly, '#area_code' do
  it 'returns EU[IT] as the area code' do
    expect(Sapor::EuropeanUnionItaly.instance.area_code).to eq('EU[IT]')
  end
end

describe Sapor::EuropeanUnionItaly, '#no_of_seats' do
  it 'returns 76 as the number of seats' do
    expect(Sapor::EuropeanUnionItaly.instance.no_of_seats).to eq(76)
  end
end

describe Sapor::EuropeanUnionItaly, '#population_size' do
  it 'returns a population size of 23,414,083' do
    expect(Sapor::EuropeanUnionItaly.instance.population_size).to \
      eq(23_414_083)
  end
end

describe Sapor::EuropeanUnionItaly, '#seats' do
  it 'calculates the number of seats using the votes of the 2014 election' do
    results = { 'Partito Democratico (S&D)' => 11_203_231,
                'Movimento 5 Stelle (EFDD)' => 5_792_865,
                'Forza Italia (EPP)' => 4_614_364,
                'Lega Nord (ENF)' => 1_688_197,
                'Nuovo Centrodestra–Unione di Centro (EPP)' => 1_202_350,
                'L’Altra Europa con Tsipras (GUE/NGL)' => 1_108_457,
                'Fratelli d’Italia (—)' => 1_006_513,
                'Verdi Europei–Green Italia (Greens/EFA)' => 250_102,
                'Scelta Europea (ALDE)' => 197_942,
                'Italia dei Valori (ALDE)' => 181_373,
                'Südtiroler Volkspartei (EPP)' => 138_037,
                'Io Cambio–MAIE (—)' => 50_978 }
    seats = Sapor::EuropeanUnionItaly.instance.seats(results)
    expect(seats['Partito Democratico (S&D)']).to eq(31 + 1 + 1)
    expect(seats['Movimento 5 Stelle (EFDD)']).to eq(17)
    expect(seats['Forza Italia (EPP)']).to eq(13 + 1 - 1)
    expect(seats['Lega Nord (ENF)']).to eq(5)
    expect(seats['Nuovo Centrodestra–Unione di Centro (EPP)']).to eq(3 + 1)
    expect(seats['L’Altra Europa con Tsipras (GUE/NGL)']).to eq(3)
    expect(seats['Fratelli d’Italia (—)']).to eq(0)
    expect(seats['Verdi Europei–Green Italia (Greens/EFA)']).to eq(0)
    expect(seats['Scelta Europea (ALDE)']).to eq(0)
    expect(seats['Italia dei Valori (ALDE)']).to eq(0)
    expect(seats['Südtiroler Volkspartei (EPP)']).to eq(1)
    expect(seats['Io Cambio–MAIE (—)']).to eq(0)
  end
end
