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

def dichotomy_of_eight
  Sapor::Dichotomy.new(2, 5, 8)
end

def dichotomy_of_nine
  Sapor::Dichotomy.new(2, 5, 9)
end

def dichotomy_of_thousand
  Sapor::Dichotomy.new(2, 5, 1000)
end

def dichotomy_of_nine_hundred_ninety_nine
  Sapor::Dichotomy.new(2, 5, 999)
end

describe Sapor::Dichotomy, '#new' do
  it 'creates an array with a value at 50% of the population size' do
    expect(dichotomy_of_eight.values).to eq([4])
  end

  it 'creates an array with a value at 50% of the population size' \
     ' (rounding)' do
    expect(dichotomy_of_nine.values).to eq([4])
  end

  it 'creates an array with a combination for 50% of the population size' do
    expect(dichotomy_of_eight.combinations(4)).to eq(24.to_lf)
  end
end

describe Sapor::Dichotomy, '#refine' do
  it 'adds values after one refinement (power of three)' do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    expect(dichotomy.values.sort).to eq([1, 4, 7])
  end

  it 'adds values after one refinement (small population)' do
    dichotomy = dichotomy_of_nine
    dichotomy.refine
    expect(dichotomy.values.sort).to eq([1, 4, 7])
  end

  it 'adds values after one refinement (large population)' do
    dichotomy = dichotomy_of_thousand
    dichotomy.refine
    expect(dichotomy.values.sort).to eq([167, 500, 833])
  end

  it 'adds values after two refinements (power of three)' do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.values.sort).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
  end

  it 'adds values after two refinements (small population)' do
    dichotomy = dichotomy_of_nine
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.values.sort).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
  end

  it 'adds values after two refinements (small population)' do
    dichotomy = Sapor::Dichotomy.new(2, 5, 60)
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.values.sort).to eq([3, 10, 17, 23, 30, 37, 43, 50, 57])
  end

  it 'adds values after two refinements (large population)' do
    dichotomy = dichotomy_of_thousand
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.values.sort).to eq([56, 167, 278, 389, 500, 611, 722, 833,
                                         944])
  end

  it "doesn't add values when population size is reached" do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.values.sort).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
  end

  it 'fills up the values when population size is reached' do
    dichotomy = dichotomy_of_nine
    dichotomy.refine
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.values.sort).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'fills up the values when population size is reached' do
    dichotomy = Sapor::Dichotomy.new(2, 5, 11)
    dichotomy.refine
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.values.sort).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])
  end

  it 'adds combinations after a refinement' do
    dichotomy = dichotomy_of_thousand
    dichotomy.refine
    expect(dichotomy.combinations(167)).to eq(1_330_493_216_416.to_lf)
    expect(dichotomy.combinations(833)).to eq(264_177_353_440.to_lf)
  end

  it 'adds combinations of zero for impossible values' do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    expect(dichotomy.combinations(1)).to eq(0.to_lf)
    expect(dichotomy.combinations(7)).to eq(0.to_lf)
  end
end

describe Sapor::Dichotomy, '#most_probable_value' do
  it 'returns the single value after new' do
    expect(dichotomy_of_eight.most_probable_value).to eq(4)
  end

  it 'returns the one probable value after one refinement' do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    expect(dichotomy.most_probable_value).to eq(4)
  end

  it 'returns the new most probable value after two refinements' do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.most_probable_value).to eq(3)
  end
end

describe Sapor::Dichotomy, '#most_probable_fraction' do
  it 'returns the fraction of the single value after new' do
    expect(dichotomy_of_eight.most_probable_fraction).to eq(0.5)
  end

  it 'returns the one probable value after one refinement' do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    expect(dichotomy.most_probable_fraction).to eq(0.5)
  end

  it 'returns the new most probable value after two refinements' do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.most_probable_fraction).to eq(0.375)
  end
end

describe Sapor::Dichotomy, '#value_confidence_interval' do
  it 'returns [0, population_size] values after new for default level 95%' do
    expect(dichotomy_of_eight.value_confidence_interval).to eq([0, 8])
  end

  it 'returns [0, population_size] values after new for level 80%' do
    expect(dichotomy_of_eight.value_confidence_interval(0.8)).to eq([0, 8])
  end

  it 'returns the value confidence interval after one refinement' do
    dichotomy = Sapor::Dichotomy.new(20, 50, 80)
    dichotomy.refine
    expect(dichotomy.value_confidence_interval).to eq([27, 53])
  end

  it 'returns the value confidence interval after full refinement' do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.value_confidence_interval).to eq([2, 5])
  end

  it 'returns the 80% value confidence interval after full refinement' do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.value_confidence_interval(0.8)).to eq([2, 5])
  end

  it 'returns the value confidence interval after two refinements' do
    dichotomy = dichotomy_of_thousand
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.value_confidence_interval).to eq([112, 777])
  end

  it 'returns the 80% value confidence interval after two refinements' do
    dichotomy = dichotomy_of_thousand
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.value_confidence_interval(0.8)).to eq([112, 666])
  end

  it 'returns the value confidence interval after three refinements' do
    dichotomy = dichotomy_of_thousand
    dichotomy.refine
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.value_confidence_interval).to eq([112, 777])
  end

  it 'can return a confidence interval starting at 0 after refinements' do
    dichotomy = Sapor::Dichotomy.new(0, 5, 1000)
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.value_confidence_interval).to eq([0, 555])
  end

  it 'can return a confidence interval ending at population size after ' \
     'refinements' do
    dichotomy = Sapor::Dichotomy.new(5, 5, 1000)
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.value_confidence_interval).to eq([445, 1000])
  end
end

describe Sapor::Dichotomy, '#confidence_interval' do
  it 'returns [0%, 100%] after new for default level 95%' do
    expect(dichotomy_of_eight.confidence_interval).to eq([0.0, 1.0])
  end

  it 'returns the default 95% confidence interval after one refinement' do
    dichotomy = Sapor::Dichotomy.new(20, 50, 80)
    dichotomy.refine
    expect(dichotomy.confidence_interval).to eq([0.3375, 0.6625])
  end

  it 'returns the default 95% confidence interval after three refinements' do
    dichotomy = dichotomy_of_thousand
    dichotomy.refine
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.confidence_interval).to eq([0.112, 0.777])
  end

  it 'returns the 80% confidence interval after three refinements' do
    dichotomy = dichotomy_of_thousand
    dichotomy.refine
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.confidence_interval(0.8)).to eq([0.186, 0.666])
  end
end

describe Sapor::Dichotomy, '#error_estimate' do
  it 'is 0 when population size is reached' do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.error_estimate).to eq(0)
  end

  it 'is at least the resolution (no refinement)' do
    dichotomy = dichotomy_of_eight
    expect(dichotomy.error_estimate).to eq(1.0)
  end

  it 'is at least the resolution (one refinement)' do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    expect(dichotomy.error_estimate).to eq(1.to_f / 3)
  end
end
