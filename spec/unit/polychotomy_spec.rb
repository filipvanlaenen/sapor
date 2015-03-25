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

def pentachotomy(max_error = 0.01)
  results = { 'Red' => 1, 'Green' => 2, 'Blue' => 3, 'Yellow' => 6,
              'Other' => 1 }
  dichotomies = Sapor::Dichotomies.new(results, 1000)
  dichotomies.refine
  dichotomies.refine
  dichotomies.refine
  Sapor::Polychotomy.new(results, 1000, dichotomies, max_error)
end

describe Sapor::Polychotomy, '#new' do
  it 'extracts the 99.99% confidence intervals as ranges for max 1% error' do
    expect(pentachotomy.range('Red').size).to eq(17)
    expect(pentachotomy.range('Green').size).to eq(19)
    expect(pentachotomy.range('Blue').size).to eq(20)
    expect(pentachotomy.range('Yellow').size).to eq(22)
  end

  it 'extracts the 99.9999% confidence intervals as ranges for max 0.1%' \
     ' error' do
    expect(pentachotomy(0.001).range('Red').size).to eq(20)
    expect(pentachotomy(0.001).range('Green').size).to eq(22)
    expect(pentachotomy(0.001).range('Blue').size).to eq(23)
    expect(pentachotomy(0.001).range('Yellow').size).to eq(25)
  end

  it 'sets the incrementer for every choice' do
    expect(pentachotomy.incrementer('Red')).to eq(1)
    expect(pentachotomy.incrementer('Green')).to eq(3)
    expect(pentachotomy.incrementer('Blue')).to eq(7)
    expect(pentachotomy.incrementer('Yellow')).to eq(13)
  end

  # TODO: A test case where one range has to be extended
  # TODO: A test case where two ranges have to be extended
end

describe Sapor::Polychotomy, '#no_of_simulations' do
  it 'is 0 by default (no refinement)' do
    polychotomy = pentachotomy
    expect(polychotomy.no_of_simulations).to eq(0)
  end

  it 'is 1 after 1 refinement' do
    polychotomy = pentachotomy
    polychotomy.refine
    expect(polychotomy.no_of_simulations).to eq(1)
  end

  it 'is 2 after 2 refinements' do
    polychotomy = pentachotomy
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.no_of_simulations).to eq(2)
  end

  it 'is 4 after 3 refinements' do
    polychotomy = pentachotomy
    polychotomy.refine
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.no_of_simulations).to eq(4)
  end

  # TODO: A test case runs all possible simulations (until counters are 0 again)
end

describe Sapor::Polychotomy, '#no_of_data_points' do
  it 'is 0 by default (no refinement)' do
    polychotomy = pentachotomy
    expect(polychotomy.no_of_data_points).to eq(0)
  end

  it 'is 7 after 1 refinement' do
    polychotomy = pentachotomy
    polychotomy.refine
    expect(polychotomy.no_of_data_points).to eq(7)
  end

  it 'is 19 after 2 refinements' do
    polychotomy = pentachotomy
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.no_of_data_points).to eq(19)
  end

  it 'is 38 after 3 refinements' do
    polychotomy = pentachotomy
    polychotomy.refine
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.no_of_data_points).to eq(38)
  end

  # TODO: A test case that runs all the simulations
end

describe Sapor::Polychotomy, '#most_probable_fraction' do
  it 'is nil by default (no refinement)' do
    polychotomy = pentachotomy
    expect(polychotomy.most_probable_fraction('Red')).to be_nil
    expect(polychotomy.most_probable_fraction('Green')).to be_nil
    expect(polychotomy.most_probable_fraction('Blue')).to be_nil
    expect(polychotomy.most_probable_fraction('Yellow')).to be_nil
  end

  it 'returns a value after the first refinement' do
    polychotomy = pentachotomy
    polychotomy.refine
    expect(polychotomy.most_probable_fraction('Red').round(2)).to eq(0.28)
    expect(polychotomy.most_probable_fraction('Green').round(2)).to eq(0.09)
    expect(polychotomy.most_probable_fraction('Blue').round(2)).to eq(0.35)
    expect(polychotomy.most_probable_fraction('Yellow').round(2)).to eq(0.20)
  end

  it 'returns an updated value after the second refinement' do
    polychotomy = pentachotomy
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.most_probable_fraction('Red').round(2)).to eq(0.28)
    expect(polychotomy.most_probable_fraction('Green').round(2)).to eq(0.09)
    expect(polychotomy.most_probable_fraction('Blue').round(2)).to eq(0.35)
    expect(polychotomy.most_probable_fraction('Yellow').round(2)).to eq(0.20)
  end

  it 'returns an updated value after the third refinement' do
    polychotomy = pentachotomy
    polychotomy.refine
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.most_probable_fraction('Red').round(2)).to eq(0.17)
    expect(polychotomy.most_probable_fraction('Green').round(2)).to eq(0.09)
    expect(polychotomy.most_probable_fraction('Blue').round(2)).to eq(0.24)
    expect(polychotomy.most_probable_fraction('Yellow').round(2)).to eq(0.46)
  end
end

describe Sapor::Polychotomy, '#error_estimate' do
  it 'is 1 by default (no refinement)' do
    polychotomy = pentachotomy
    expect(polychotomy.error_estimate).to eq(1.0)
  end

  it 'is 1 after the first refinement' do
    polychotomy = pentachotomy
    polychotomy.refine
    expect(polychotomy.error_estimate).to eq(1.0)
  end

  it 'is at least the difference between the most probable fractions (two' \
     ' refinements)' do
    polychotomy = pentachotomy
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.error_estimate.round(3)).to eq(0.185)
  end

  it 'is at least the difference between the most probable fractions (three' \
     ' refinements)' do
    polychotomy = pentachotomy
    polychotomy.refine
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.error_estimate.round(3)).to eq(0.259)
  end
end
