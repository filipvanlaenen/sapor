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

describe Sapor::Austria, '#area_code' do
  it 'returns AT as the area code' do
    expect(Sapor::Austria.instance.area_code).to eq('AT')
  end
end

describe Sapor::Austria, '#no_of_seats' do
  it 'returns 183 as the number of seats' do
    expect(Sapor::Austria.instance.no_of_seats).to eq(183)
  end
end

describe Sapor::Austria, '#population_size' do
  it 'returns a population size of 5,069,929' do
    expect(Sapor::Austria.instance.population_size).to \
      eq(5_069_929)
  end
end

describe Sapor::Austria, '#seats' do
  it 'calculates the number of seats for the election of 2017' do
    results = { 'Österreichische Volkspartei' => 1_595_526,
                'Sozialdemokratische Partei Österreichs' => 1_361_746,
                'Freiheitliche Partei Österreichs' => 1_316_442,
                'NEOS–Das Neue Österreich und Liberales Forum' => 268_518,
                'Liste Peter Pilz' => 223_544,
                'Die Grünen–Die Grüne Alternative' => 192_638,
                'Meine Stimme GILT' => 48_233,
                'Kommunistische Partei Österreichs' => 39_689,
                'Die Weissen' => 9_167,
                'Freie Liste Österreich' => 8_889,
                'Neue Bewegung für die Zukunft' => 2_724,
                'Obdachlose in der Politik' => 761,
                'Sozialistische Linkspartei' => 713,
                'EU-Austrittspartei' => 693,
                'Christliche Partei Österreichs' => 425,
                'Männerpartei' => 221 }
    seats = Sapor::Austria.instance.seats(results)
    expect(seats['Österreichische Volkspartei']).to eq(62)
    expect(seats['Sozialdemokratische Partei Österreichs']).to eq(52)
    expect(seats['Freiheitliche Partei Österreichs']).to eq(51)
    expect(seats['NEOS–Das Neue Österreich und Liberales Forum']).to eq(10)
    expect(seats['Liste Peter Pilz']).to eq(8)
    expect(seats['Die Grünen–Die Grüne Alternative']).to eq(0)
    expect(seats['Meine Stimme GILT']).to eq(0)
    expect(seats['Kommunistische Partei Österreichs']).to eq(0)
    expect(seats['Die Weissen']).to eq(0)
    expect(seats['Freie Liste Österreich']).to eq(0)
    expect(seats['Neue Bewegung für die Zukunft']).to eq(0)
    expect(seats['Obdachlose in der Politik']).to eq(0)
    expect(seats['Sozialistische Linkspartei']).to eq(0)
    expect(seats['EU-Austrittspartei']).to eq(0)
    expect(seats['Christliche Partei Österreichs']).to eq(0)
    expect(seats['Männerpartei']).to eq(0)
  end
end
