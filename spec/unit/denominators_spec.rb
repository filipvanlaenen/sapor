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

describe Sapor::DhondtDenominators, '#get' do
  it 'returns [1, 2, 3, 4, 5] as the five first elements' do
    denominators = Sapor::DhondtDenominators.get(5).each.to_a
    expect(denominators).to eq([1, 2, 3, 4, 5])
  end
end

describe Sapor::SainteLague12Denominators, '#get' do
  it 'returns [1.2, 3, 5, 7, 9] as the five first elements' do
    denominators = Sapor::SainteLague12Denominators.get(5).each.to_a
    expect(denominators).to eq([1.2, 3, 5, 7, 9])
  end
end

describe Sapor::SainteLague14Denominators, '#get' do
  it 'returns [1.4, 3, 5, 7, 9] as the five first elements' do
    denominators = Sapor::SainteLague14Denominators.get(5).each.to_a
    expect(denominators).to eq([1.4, 3, 5, 7, 9])
  end
end
