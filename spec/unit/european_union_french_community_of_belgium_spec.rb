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

describe Sapor::EuropeanUnionFrenchCommunityOfBelgium, '#area_code' do
  it 'returns EU[BE-FRC] as the area code' do
    expect(
      Sapor::EuropeanUnionFrenchCommunityOfBelgium.instance.area_code
    ).to eq('EU[BE-FRC]')
  end
end

describe Sapor::EuropeanUnionFrenchCommunityOfBelgium, '#no_of_seats' do
  it 'returns 8 as the number of seats' do
    expect(
      Sapor::EuropeanUnionFrenchCommunityOfBelgium.instance.no_of_seats
    ).to eq(8)
  end
end

describe Sapor::EuropeanUnionFrenchCommunityOfBelgium, '#population_size' do
  it 'returns a population size of 2,581,399' do
    expect(
      Sapor::EuropeanUnionFrenchCommunityOfBelgium.instance.population_size
    ).to eq(2_581_399)
  end
end

describe Sapor::EuropeanUnionFrenchCommunityOfBelgium, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'PS (S&D)' => 713_375, 'MR (ALDE)' => 660_118,
                'Ecolo (Greens/EFA)' => 284_656, 'cdH (EPP)' => 276_879,
                'PTB (GUE/NGL)' => 133_472, 'Parti Populaire (EFDD)' => 145_538,
                'DéFI (ALDE)' => 82_631, 'Debout Les Belges! (*)' => 72_639 }
    seats = Sapor::EuropeanUnionFrenchCommunityOfBelgium.instance.seats(results)
    expect(seats['PS (S&D)']).to eq(3)
    expect(seats['MR (ALDE)']).to eq(3)
    expect(seats['Ecolo (Greens/EFA)']).to eq(1)
    expect(seats['cdH (EPP)']).to eq(1)
    expect(seats['PTB (GUE/NGL)']).to eq(0)
    expect(seats['Parti Populaire (EFDD)']).to eq(0)
    expect(seats['DéFI (ALDE)']).to eq(0)
    expect(seats['Debout Les Belges! (*)']).to eq(0)
  end
end
