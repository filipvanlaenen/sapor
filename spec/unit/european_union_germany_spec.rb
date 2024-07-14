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

describe Sapor::EuropeanUnionGermany, '#area_code' do
  it 'returns EU[DE] as the area code' do
    expect(Sapor::EuropeanUnionGermany.instance.area_code).to eq('EU[DE]')
  end
end

describe Sapor::EuropeanUnionGermany, '#no_of_seats' do
  it 'returns 96 as the number of seats' do
    expect(Sapor::EuropeanUnionGermany.instance.no_of_seats).to eq(96)
  end
end

describe Sapor::EuropeanUnionGermany, '#population_size' do
  it 'returns a population size of 39,796,212' do
    expect(Sapor::EuropeanUnionGermany.instance.population_size).to \
      eq(39_796_212)
  end
end

describe Sapor::EuropeanUnionGermany, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'CDU (EPP)' => 8_812_653, 'SPD (S&D)' => 8_003_628,
                'BÜNDNIS 90/DIE GRÜNEN (Greens/EFA)' => 3_139_274,
                'DIE LINKE (GUE/NGL)' => 2_168_455,
                'Alternative für Deutschland (EFDD)' => 2_070_014,
                'CSU (EPP)' => 1_567_448, 'FDP (ALDE)' => 986_841,
                'FREIE WÄHLER (ALDE)' => 428_800,
                'PIRATEN (Greens/EFA)' => 425_044,
                'Partei Mensch Umwelt Tierschutz (GUE/NGL)' => 366_598,
                'NPD (—)' => 301_139,
                'Familien-Partei Deutschlands (ECR)' => 202_803,
                'ÖDP (Greens/EFA)' => 185_244,
                'Die PARTEI (—)' => 184_709, 'Die Republikaner (—)' => 109_757,
                'Volksabstimmung (—)' => 88_535,
                'Bayernpartei (Greens/EFA)' => 62_438,
                'Partei Bibeltreuer Christen (ECR)' => 55_336,
                'Bürgerbewegung pro NRW (—)' => 52_649,
                'AUF (ECR)' => 50_953, 'Christliche Mitte (—)' => 30_136,
                'DKP (GUE/NGL)' => 25_147, 'MLPD (—)' => 18_198,
                'BüSo (—)' => 10_369,
                'Sozialistische Gleichheitspartei (—)' => 8_924 }
    seats = Sapor::EuropeanUnionGermany.instance.seats(results)
    expect(seats['CDU (EPP)']).to eq(29)
    expect(seats['SPD (S&D)']).to eq(27)
    expect(seats['BÜNDNIS 90/DIE GRÜNEN (Greens/EFA)']).to eq(11)
    expect(seats['DIE LINKE (GUE/NGL)']).to eq(7)
    expect(seats['Alternative für Deutschland (EFDD)']).to eq(7)
    expect(seats['CSU (EPP)']).to eq(5)
    expect(seats['FDP (ALDE)']).to eq(3)
    expect(seats['FREIE WÄHLER (ALDE)']).to eq(1)
    expect(seats['PIRATEN (Greens/EFA)']).to eq(1)
    expect(seats['Partei Mensch Umwelt Tierschutz (GUE/NGL)']).to eq(1)
    expect(seats['NPD (—)']).to eq(1)
    expect(seats['Familien-Partei Deutschlands (ECR)']).to eq(1)
    expect(seats['ÖDP (Greens/EFA)']).to eq(1)
    expect(seats['Die PARTEI (—)']).to eq(1)
    expect(seats['Die Republikaner (—)']).to eq(0)
    expect(seats['Volksabstimmung (—)']).to eq(0)
    expect(seats['Bayernpartei (Greens/EFA)']).to eq(0)
    expect(seats['Partei Bibeltreuer Christen (ECR)']).to eq(0)
    expect(seats['Bürgerbewegung pro NRW (—)']).to eq(0)
    expect(seats['AUF (ECR)']).to eq(0)
    expect(seats['Christliche Mitte (—)']).to eq(0)
    expect(seats['DKP (GUE/NGL)']).to eq(0)
    expect(seats['MLPD (—)']).to eq(0)
    expect(seats['BüSo (—)']).to eq(0)
    expect(seats['Sozialistische Gleichheitspartei (—)']).to eq(0)
  end
end
