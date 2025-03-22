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

describe Sapor::EuropeanUnionLuxembourg, '#area_code' do
  it 'returns EU[LU] as the area code' do
    expect(Sapor::EuropeanUnionLuxembourg.instance.area_code).to eq('EU[LU]')
  end
end

describe Sapor::EuropeanUnionLuxembourg, '#no_of_seats' do
  it 'returns 6 as the number of seats' do
    expect(Sapor::EuropeanUnionLuxembourg.instance.no_of_seats).to eq(6)
  end
end

describe Sapor::EuropeanUnionLuxembourg, '#population_size' do
  it 'returns a population size of 1,385,139' do
    expect(Sapor::EuropeanUnionLuxembourg.instance.population_size).to \
      eq(1_385_139)
  end
end

describe Sapor::EuropeanUnionLuxembourg, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Chrëschtlech-Sozial Vollekspartei (EPP)' => 441_578,
                'déi gréng (Greens/EFA)' => 176_073,
                'Demokratesch Partei (ALDE)' => 173_255,
                'Lëtzebuerger Sozialistesch Aarbechterpartei (S&D)' => 137_504,
                'Alternativ Demokratesch Reformpartei (ECR)' => 88_298,
                'Déi Lénk (GUE/NGL)' => 67_544,
                'Kommunistesch Partei Lëtzebuerg (*)' => 17_506,
                'Piratepartei Lëtzebuerg (Greens/EFA)' => 49_553,
                'Partei fir Integral Demokratie (*)' => 21_303 }
    seats = Sapor::EuropeanUnionLuxembourg.instance.seats(results)
    expect(seats['Chrëschtlech-Sozial Vollekspartei (EPP)']).to eq(3)
    expect(seats['déi gréng (Greens/EFA)']).to eq(1)
    expect(seats['Demokratesch Partei (ALDE)']).to eq(1)
    expect(seats['Lëtzebuerger Sozialistesch Aarbechterpartei (S&D)']).to eq(1)
    expect(seats['Alternativ Demokratesch Reformpartei (ECR)']).to eq(0)
    expect(seats['Déi Lénk (GUE/NGL)']).to eq(0)
    expect(seats['Kommunistesch Partei Lëtzebuerg (*)']).to eq(0)
    expect(seats['Piratepartei Lëtzebuerg (Greens/EFA)']).to eq(0)
    expect(seats['Partei fir Integral Demokratie (*)']).to eq(0)
  end
end
