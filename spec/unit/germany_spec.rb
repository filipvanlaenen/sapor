
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

describe Sapor::Germany, '#area_code' do
  it 'returns DE as the area code' do
    expect(Sapor::Germany.instance.area_code).to eq('DE')
  end
end

describe Sapor::Germany, '#no_of_seats' do
  it 'returns 735 as the number of seats' do
    expect(Sapor::Germany.instance.no_of_seats).to eq(735)
  end
end

describe Sapor::Germany, '#population_size' do
  it 'returns a population size of 46,976,341' do
    expect(Sapor::Germany.instance.population_size).to \
      eq(46_976_341)
  end
end

describe Sapor::Germany, '#seats' do
  it 'calculates the number of seats for the election of 2017' do
    results = { 'Sozialdemokratische Partei Deutschlands' => 11_955_434,
                'Christlich Demokratische Union Deutschlands' => 8_775_471,
                'Bündnis 90/Die Grünen' => 6_852_206,
                'Freie Demokratische Partei' => 5_319_952,
                'Alternative für Deutschland' => 4_803_902,
                'Christlich-Soziale Union in Bayern' => 2_402_827,
                'Die Linke' => 2_270_906,
                'Freie Wähler' => 1_127_784,
                'Partei Mensch Umwelt Tierschutz' => 675_353,
                'dieBasis' => 630_153,
                'Die PARTEI' => 461_570,
                'Team Todenhöfer' => 214_535,
                'Piratenpartei Deutschland' => 169_923,
                'Volt' => 165_474,
                'Ökologisch-Demokratische Partei' => 112_314,
                'Nationaldemokratische Partei Deutschlands' => 64_574,
                'Other' => 55_578 + 49_349 + 47_711 + 39_868 + 32_790 + 31_884 + 22_736 + 19_442 + 17_811 + 17_799 +
                           14_925 + 13_672 + 12_967 + 11_159 + 9_189 + 7_832 + 7_611 + 7_491 + 7_184 + 3_786 + 3_488 +
                           3_228 + 1_417 + 727 }
    seats = Sapor::Germany.instance.seats(results)
    expect(seats['Sozialdemokratische Partei Deutschlands']).to eq(206)
    expect(seats['Christlich Demokratische Union Deutschlands']).to eq(152)
    expect(seats['Bündnis 90/Die Grünen']).to eq(118)
    expect(seats['Freie Demokratische Partei']).to eq(92)
    expect(seats['Alternative für Deutschland']).to eq(83)
    expect(seats['Christlich-Soziale Union in Bayern']).to eq(45)
    expect(seats['Die Linke']).to eq(39)
    expect(seats['Freie Wähler']).to eq(0)
    expect(seats['Partei Mensch Umwelt Tierschutz']).to eq(0)
    expect(seats['dieBasis']).to eq(0)
    expect(seats['Die PARTEI']).to eq(0)
    expect(seats['Team Todenhöfer']).to eq(0)
    expect(seats['Piratenpartei Deutschland']).to eq(0)
    expect(seats['Volt']).to eq(0)
    expect(seats['Ökologisch-Demokratische Partei']).to eq(0)
    expect(seats['Nationaldemokratische Partei Deutschlands']).to eq(0)
    expect(seats['Other']).to eq(0)
  end

  it 'calculates the number of seats for the election of 2017 with large other' do
    results = { 'Sozialdemokratische Partei Deutschlands' => 11_955_434,
                'Christlich Demokratische Union Deutschlands' => 8_775_471,
                'Bündnis 90/Die Grünen' => 6_852_206,
                'Freie Demokratische Partei' => 5_319_952,
                'Alternative für Deutschland' => 4_803_902,
                'Christlich-Soziale Union in Bayern' => 2_402_827,
                'Die Linke' => 2_270_906,
                'Other' => 1_127_784 + 675_353 + 630_153 + 461_570 + 214_535 + 169_923 + 165_474 + 112_314 + 64_574 +
                           55_578 + 49_349 + 47_711 + 39_868 + 32_790 + 31_884 + 22_736 + 19_442 + 17_811 + 17_799 +
                           14_925 + 13_672 + 12_967 + 11_159 + 9_189 + 7_832 + 7_611 + 7_491 + 7_184 + 3_786 + 3_488 +
                           3_228 + 1_417 + 727 }
    seats = Sapor::Germany.instance.seats(results)
    expect(seats['Sozialdemokratische Partei Deutschlands']).to eq(206)
    expect(seats['Christlich Demokratische Union Deutschlands']).to eq(152)
    expect(seats['Bündnis 90/Die Grünen']).to eq(118)
    expect(seats['Freie Demokratische Partei']).to eq(92)
    expect(seats['Alternative für Deutschland']).to eq(83)
    expect(seats['Christlich-Soziale Union in Bayern']).to eq(45)
    expect(seats['Die Linke']).to eq(39)
    expect(seats['Other']).to eq(0)
  end
end
