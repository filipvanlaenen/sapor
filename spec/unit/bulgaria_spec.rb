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

describe Sapor::Bulgaria, '#area_code' do
  it 'returns BG as the area code' do
    expect(Sapor::Bulgaria.instance.area_code).to eq('BG')
  end
end

describe Sapor::Bulgaria, '#no_of_seats' do
  it 'returns 240 as the number of seats' do
    expect(Sapor::Bulgaria.instance.no_of_seats).to eq(240)
  end
end

describe Sapor::Bulgaria, '#population_size' do
  it 'returns a population size of 5,069,929' do
    expect(Sapor::Bulgaria.instance.population_size).to \
      eq(3_682_499 - 169_009)
  end
end

describe Sapor::Bulgaria, '#seats' do
  it 'calculates the number of seats for the election of 2017' do
    seats = Sapor::Bulgaria.instance.seats(Sapor::Bulgaria.instance.overall_election_results_of_2017)
    expect(seats['ПП ГЕРБ']).to eq(48)
    expect(seats['БСП за БЪЛГАРИЯ']).to eq(39 + 1 + 1 + 1) # Data mismatch in Враца, Плевен and Пловдив Град
    expect(seats['ОБЕДИНЕНИ ПАТРИОТИ – НФСБ, АТАКА и ВМРО']).to eq(14 - 1) # Data mismatch in Пловдив Град
    expect(seats['Движение за права и свободи – ДПС']).to eq(14)
    expect(seats['ВОЛЯ']).to eq(5 - 1 - 1) # Data mismatch in Враца and Плевен
    expect(seats['Обединение ДОСТ']).to eq(0)
    expect(seats['РЕФОРМАТОРСКИ БЛОК – ГЛАС НАРОДЕН']).to eq(0)
  end
end
