
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
  it 'returns 709 as the number of seats' do
    expect(Sapor::Germany.instance.no_of_seats).to eq(709)
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
    results = { 'Christlich Demokratische Union Deutschlands' => 12_447_656,
                'Sozialdemokratische Partei Deutschlands' => 9_539_381,
                'Alternative für Deutschland' => 5_878_115,
                'Freie Demokratische Partei' => 4_999_449,
                'Die Linke' => 4_297_270,
                'Bündnis 90/Die Grünen' => 4_158_400,
                'Christlich-Soziale Union in Bayern' => 2_869_688,
                'Freie Wähler' => 463_292,
                'Die PARTEI' => 454_349,
                'Partei Mensch Umwelt Tierschutz' => 374_179,
                'Nationaldemokratische Partei Deutschlands' => 176_020,
                'Piratenpartei Deutschland' => 173_476,
                'Ökologisch-Demokratische Partei' => 144_809,
                'Bündnis Grundeinkommen' => 97_539,
                'V-Partei³' => 64_073,
                'Deutsche Mitte' => 63_203,
                'Demokratie in Bewegung' => 60_914,
                'Bayernpartei' => 58_037,
                'Allianz Deutscher Demokraten' => 41_251,
                'Allianz für Menschenrechte, Tier- und Naturschutz' => 32_221,
                'Marxistisch-Leninistische Partei Deutschlands' => 18_198,
                'Partei für Gesundheitsforschung' => 23_404,
                'Deutsche Kommunistische Partei' => 11_558,
                'Menschliche Welt' => 11_661,
                'Die Grauen–Für alle Generationen' => 10_009,
                'Ab jetzt – Demokratie durch Volksabstimmung' => 9_631,
                'Bürgerrechtsbewegung Solidarität' => 6_693,
                'Partei der Humanisten' => 5_991,
                'Magdeburger Gartenpartei' => 5_617,
                'Die Urbane. Eine HipHop Partei' => 3_032,
                'Die Rechte' => 2_054,
                'Sozialistische Gleichheitspartei' => 1_291,
                'Bergpartei, die Überpartei' => 911,
                'Partei der Vernunft' => 533 }
    seats = Sapor::Germany.instance.seats(results)
    expect(seats['Christlich Demokratische Union Deutschlands']).to eq(200)
    expect(seats['Sozialdemokratische Partei Deutschlands']).to eq(153)
    expect(seats['Alternative für Deutschland']).to eq(94)
    expect(seats['Freie Demokratische Partei']).to eq(80)
    expect(seats['Die Linke']).to eq(69)
    expect(seats['Bündnis 90/Die Grünen']).to eq(67)
    expect(seats['Christlich-Soziale Union in Bayern']).to eq(46)
    expect(seats['Freie Wähler']).to eq(0)
    expect(seats['Die PARTEI']).to eq(0)
    expect(seats['Partei Mensch Umwelt Tierschutz']).to eq(0)
    expect(seats['Nationaldemokratische Partei Deutschlands']).to eq(0)
    expect(seats['Piratenpartei Deutschland']).to eq(0)
    expect(seats['Ökologisch-Demokratische Partei']).to eq(0)
    expect(seats['Bündnis Grundeinkommen']).to eq(0)
    expect(seats['V-Partei³']).to eq(0)
    expect(seats['Deutsche Mitte']).to eq(0)
    expect(seats['Demokratie in Bewegung']).to eq(0)
    expect(seats['Bayernpartei']).to eq(0)
    expect(seats['Allianz Deutscher Demokraten']).to eq(0)
    expect(seats['Allianz für Menschenrechte, Tier- und Naturschutz']).to eq(0)
    expect(seats['Marxistisch-Leninistische Partei Deutschlands']).to eq(0)
    expect(seats['Partei für Gesundheitsforschung']).to eq(0)
    expect(seats['Deutsche Kommunistische Partei']).to eq(0)
    expect(seats['Menschliche Welt']).to eq(0)
    expect(seats['Die Grauen–Für alle Generationen']).to eq(0)
    expect(seats['Ab jetzt – Demokratie durch Volksabstimmung']).to eq(0)
    expect(seats['Bürgerrechtsbewegung Solidarität']).to eq(0)
    expect(seats['Partei der Humanisten']).to eq(0)
    expect(seats['Magdeburger Gartenpartei']).to eq(0)
    expect(seats['Die Urbane. Eine HipHop Partei']).to eq(0)
    expect(seats['Die Rechte']).to eq(0)
    expect(seats['Sozialistische Gleichheitspartei']).to eq(0)
    expect(seats['Bergpartei, die Überpartei']).to eq(0)
    expect(seats['Partei der Vernunft']).to eq(0)
  end

  it 'calculates the number of seats for the election of 2017' do
    results = { 'Christlich Demokratische Union Deutschlands' => 12_447_656,
                'Sozialdemokratische Partei Deutschlands' => 9_539_381,
                'Alternative für Deutschland' => 5_878_115,
                'Freie Demokratische Partei' => 4_999_449,
                'Die Linke' => 4_297_270,
                'Bündnis 90/Die Grünen' => 4_158_400,
                'Christlich-Soziale Union in Bayern' => 2_869_688,
                'Other' => 463_292 + 454_349 + 374_179 + 176_020 + 173_476 +
                           144_809 + 97_539 + 64_073 + 63_203 + 60_914 +
                           58_037 + 41_251 + 32_221 + 18_198 + 23_404 + 11_558 +
                           11_661 + 10_009 + 9_631 + 6_693 + 5_991 + 5_617 +
                           3_032 + 2_054 + 1_291 + 911 + 533 }
    seats = Sapor::Germany.instance.seats(results)
    expect(seats['Christlich Demokratische Union Deutschlands']).to eq(200)
    expect(seats['Sozialdemokratische Partei Deutschlands']).to eq(153)
    expect(seats['Alternative für Deutschland']).to eq(94)
    expect(seats['Freie Demokratische Partei']).to eq(80)
    expect(seats['Die Linke']).to eq(69)
    expect(seats['Bündnis 90/Die Grünen']).to eq(67)
    expect(seats['Christlich-Soziale Union in Bayern']).to eq(46)
    expect(seats['Other']).to eq(0)
  end
end
