# encoding: utf-8
#
# Statistical Analysis of Polling Results (SAPoR)
# Copyright (C) 2016 Filip van Laenen <f.a.vanlaenen@ieee.org>
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

describe Sapor::EuropeanUnionIreland2019Ia, '#area_code' do
  it 'returns EU[IE]@2019∪{IA} as the area code' do
    expect(Sapor::EuropeanUnionIreland2019Ia.instance.area_code).to \
      eq('EU[IE]@2019∪{IA}')
  end
end

describe Sapor::EuropeanUnionIreland2019Ia, '#no_of_seats' do
  it 'returns 13 as the number of seats' do
    expect(Sapor::EuropeanUnionIreland2019Ia.instance.no_of_seats).to eq(13)
  end
end

describe Sapor::EuropeanUnionIreland2019Ia, '#population_size' do
  it 'returns a population size of 1,656,518' do
    expect(Sapor::EuropeanUnionIreland2019Ia.instance.population_size).to \
      eq(1_656_518)
  end
end
