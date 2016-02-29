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

describe Sapor::BinomialsCache, '#binomial' do
  it 'returns the correct binomial' do
    actual = Sapor::BinomialsCache.binomial(10, 20)
    expected = 10.large_float_binomial_by_product_of_divisions(20)
    expect(actual).to eq(expected)
  end

  it 'returns the same binomial when asked a second time' do
    first = Sapor::BinomialsCache.binomial(10, 21)
    second = Sapor::BinomialsCache.binomial(10, 21)
    expect(second).to eq(first)
  end
end
