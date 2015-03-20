# encoding: utf-8
#
# Statistical Analysis of Polling Results (SAPoR)
# Copyright (C) 2014 Filip van Laenen <f.a.vanlaenen@ieee.org>
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

describe Sapor::Combinations, '#new' do
  it 'creates a combinations object with an empty set of values' do
    combinations = Sapor::Combinations.new
    expect(combinations).to be_empty
  end
end

describe Sapor::Combinations, '#[]=' do
  it 'sets a value-combinations pair' do
    combinations = Sapor::Combinations.new
    combinations[1] = 2
    expect(combinations[1]).to eq(2)
  end
end

describe Sapor::Combinations, '#size' do
  it 'returns 0 for an empty object' do
    combinations = Sapor::Combinations.new
    expect(combinations.size).to eq(0)
  end

  it 'returns 1 when a value-combinations pair has been added' do
    combinations = Sapor::Combinations.new
    combinations[1] = 2
    expect(combinations.size).to eq(1)
  end
end

describe Sapor::Combinations, '#values' do
  it 'returns an empty array for an empty object' do
    combinations = Sapor::Combinations.new
    expect(combinations.values).to eq([])
  end

  it 'returns 1 when a value-combinations pair has been added' do
    combinations = Sapor::Combinations.new
    combinations[1] = 2
    expect(combinations.values).to eq([1])
  end
end

describe Sapor::Combinations, '#most_probable_value' do
  it "returns the single value if there's only one value" do
    combinations = Sapor::Combinations.new
    combinations[1] = 2
    expect(combinations.most_probable_value).to eq(1)
  end

  it 'returns the first of two values if that has the greatest number ' \
     'of combinations' do
    combinations = Sapor::Combinations.new
    combinations[1] = 2
    combinations[2] = 1
    expect(combinations.most_probable_value).to eq(1)
  end

  it 'returns the second of two values if that has the greatest number ' \
     'of combinations' do
    combinations = Sapor::Combinations.new
    combinations[1] = 1
    combinations[2] = 2
    expect(combinations.most_probable_value).to eq(2)
  end
end

describe Sapor::Combinations, '#confidence_interval' do
  it 'returns the single value as boundaries (default)' do
    combinations = Sapor::Combinations.new
    combinations[5] = 2
    expect(combinations.confidence_interval(0.95)).to eq([5, 5])
  end

  it 'returns the full interval as boundaries if single value (extensive)' do
    combinations = Sapor::Combinations.new
    combinations[5] = 2
    expect(combinations.confidence_interval(0.95, 10)).to eq([0, 10])
  end

  it 'returns the boundaries (default)' do
    combinations = Sapor::Combinations.new
    combinations[3] = 2
    combinations[7] = 2
    expect(combinations.confidence_interval(0.95)).to eq([3, 7])
  end

  it 'returns the full interval as boundaries (extensive)' do
    combinations = Sapor::Combinations.new
    combinations[3] = 2
    combinations[7] = 2
    expect(combinations.confidence_interval(0.95, 10)).to eq([0, 10])
  end

  it 'returns the values in between as boundaries (even)' do
    combinations = Sapor::Combinations.new
    combinations[5] = 1
    combinations[10] = 98
    combinations[15] = 1
    expect(combinations.confidence_interval(0.95)).to eq([8, 12])
  end

  it 'returns the values in between as boundaries (odd)' do
    combinations = Sapor::Combinations.new
    combinations[6] = 1
    combinations[10] = 98
    combinations[14] = 1
    expect(combinations.confidence_interval(0.95)).to eq([8, 12])
  end
end

describe Sapor::Combinations, '#confidence_interval_values' do
  it 'extracts the single value as confidence interval value' do
    combinations = Sapor::Combinations.new
    combinations[5] = 2
    expect(combinations.confidence_interval_values(0.95)).to eq([5])
  end

  it 'extracts all values as confidence intervalue values' do
    combinations = Sapor::Combinations.new
    combinations[3] = 2
    combinations[7] = 2
    expect(combinations.confidence_interval_values(0.95).sort).to eq([3, 7])
  end

  it 'extracts the middle values as confidence interval values' do
    combinations = Sapor::Combinations.new
    combinations[5] = 1
    combinations[10] = 98
    combinations[15] = 1
    expect(combinations.confidence_interval_values(0.95)).to eq([10])
  end
end
