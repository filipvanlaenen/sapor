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

describe Sapor::LatviaKpvPPar, '#area_code' do
  it 'returns LV∪{KPV,P,PAR} as the area code' do
    expect(Sapor::LatviaKpvPPar.instance.area_code).to eq('LV∪{KPV,P,PAR}')
  end
end

describe Sapor::LatviaKpvPPar, '#no_of_seats' do
  it 'returns 100 as the number of seats' do
    expect(Sapor::LatviaKpvPPar.instance.no_of_seats).to eq(100)
  end
end

describe Sapor::LatviaKpvPPar, '#population_size' do
  it 'returns a population size of 913,491' do
    expect(Sapor::LatviaKpvPPar.instance.population_size).to eq(913_491)
  end
end
