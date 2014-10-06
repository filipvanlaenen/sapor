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

describe Sapor::Dichotomy, '#new' do
  it 'creates an array with a value at 50% of the population size' do
    expect(dichotomy_of_eight.values).to eq([4])
  end

  it 'creates an array with a value at 50% of the population size' \
     ' (rounding)' do
    expect(dichotomy_of_nine.values).to eq([4])
  end

  it 'creates an array with a combination for 50% of the population size' do
    expect(dichotomy_of_eight.combinations).to eq([24.to_lf])
  end
end

describe Sapor::Dichotomy, '#refine' do
  it 'adds values after one refinement (power of three)' do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    expect(dichotomy.values).to eq([1, 4, 7])
  end

  it 'adds values after one refinement (small population)' do
    dichotomy = dichotomy_of_nine
    dichotomy.refine
    expect(dichotomy.values).to eq([1, 4, 7])
  end

  it 'adds values after one refinement (large population)' do
    dichotomy = dichotomy_of_thousand
    dichotomy.refine
    expect(dichotomy.values).to eq([167, 500, 833])
  end

  it 'adds values after two refinements (power of three)' do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.values).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
  end

  it 'adds values after two refinements (small population)' do
    dichotomy = dichotomy_of_nine
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.values).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
  end

  it 'adds values after two refinements (small population)' do
    dichotomy = dichotomy_of_thousand
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.values).to eq([56, 167, 278, 389, 500, 611, 722, 833,
                                    944])
  end

  it "doesn't add values when population size is reached" do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.values).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
  end

  it 'fills up the values when population size is reached' do
    dichotomy = dichotomy_of_nine
    dichotomy.refine
    dichotomy.refine
    dichotomy.refine
    expect(dichotomy.values).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'adds combinations after a refinement' do
    dichotomy = dichotomy_of_thousand
    dichotomy.refine
    expect(dichotomy.combinations).to eq([1_330_493_216_416.to_lf,
                                          2_583_385_375_000.to_lf,
                                          264_177_353_440.to_lf])
  end

  it 'adds combinations of zero for impossible values' do
    dichotomy = dichotomy_of_eight
    dichotomy.refine
    expect(dichotomy.combinations).to eq([0.to_lf, 24.to_lf, 0.to_lf])
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
