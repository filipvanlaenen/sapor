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

class ReferendumTestArea
  include Singleton

  def area_code
    'RA'
  end

  def population_size
    1_000
  end
end

REFERENDUM_TEST_AREA = ReferendumTestArea.instance

def referendum_pentachotomy(max_error = 0.01)
  results = { 'Red' => 1, 'Green' => 2, 'Blue' => 3, 'Yellow' => 6,
              'Other' => 1 }
  dichotomies = Sapor::Dichotomies.new(results, 1000)
  dichotomies.refine
  dichotomies.refine
  dichotomies.refine
  Sapor::ReferendumPolychotomy.new(results, REFERENDUM_TEST_AREA, dichotomies, max_error)
end

describe Sapor::ReferendumPolychotomy, '#new' do
  it 'extracts the 99.99% confidence intervals as ranges for max 1% error' do
    expect(referendum_pentachotomy.range('Red').size).to eq(17)
    expect(referendum_pentachotomy.range('Green').size).to eq(19)
    expect(referendum_pentachotomy.range('Blue').size).to eq(20)
    expect(referendum_pentachotomy.range('Yellow').size).to eq(22)
  end

  it 'extracts the 99.9999% confidence intervals as ranges for max 0.1%' \
     ' error' do
    expect(referendum_pentachotomy(0.001).range('Red').size).to eq(20)
    expect(referendum_pentachotomy(0.001).range('Green').size).to eq(22)
    expect(referendum_pentachotomy(0.001).range('Blue').size).to eq(23)
    expect(referendum_pentachotomy(0.001).range('Yellow').size).to eq(25)
  end

  # TODO: A test case where the construction of the enumerator fails
end

describe Sapor::ReferendumPolychotomy, '#error_estimate' do
  it 'is 1 by default (no refinement)' do
    polychotomy = referendum_pentachotomy
    expect(polychotomy.error_estimate).to eq(1.0)
  end

  it 'is 1 after the first refinement' do
    polychotomy = referendum_pentachotomy
    polychotomy.refine
    expect(polychotomy.error_estimate).to eq(1.0)
  end

  it 'is at least the difference between the most probable fractions (two' \
     ' refinements)' do
    polychotomy = referendum_pentachotomy
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.error_estimate.round(3)).to eq(0.333)
  end

  it 'is at least the difference between the most probable fractions (three' \
     ' refinements)' do
    polychotomy = referendum_pentachotomy
    polychotomy.refine
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.error_estimate.round(3)).to eq(0.259)
  end
end

describe Sapor::ReferendumPolychotomy, '#most_probable_fraction' do
  it 'is nil by default (no refinement)' do
    polychotomy = referendum_pentachotomy
    expect(polychotomy.most_probable_fraction('Red')).to be_nil
    expect(polychotomy.most_probable_fraction('Green')).to be_nil
    expect(polychotomy.most_probable_fraction('Blue')).to be_nil
    expect(polychotomy.most_probable_fraction('Yellow')).to be_nil
  end

  it 'returns a value after the first refinement' do
    polychotomy = referendum_pentachotomy
    polychotomy.refine
    expect(polychotomy.most_probable_fraction('Red').round(2)).to eq(0.02)
    expect(polychotomy.most_probable_fraction('Green').round(2)).to eq(0.02)
    expect(polychotomy.most_probable_fraction('Blue').round(2)).to eq(0.02)
    expect(polychotomy.most_probable_fraction('Yellow').round(2)).to eq(0.09)
  end

  it 'returns an updated value after the second refinement' do
    polychotomy = referendum_pentachotomy
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.most_probable_fraction('Red').round(2)).to eq(0.28)
    expect(polychotomy.most_probable_fraction('Green').round(2)).to eq(0.09)
    expect(polychotomy.most_probable_fraction('Blue').round(2)).to eq(0.35)
    expect(polychotomy.most_probable_fraction('Yellow').round(2)).to eq(0.20)
  end

  it 'returns an updated value after the third refinement' do
    polychotomy = referendum_pentachotomy
    polychotomy.refine
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.most_probable_fraction('Red').round(2)).to eq(0.35)
    expect(polychotomy.most_probable_fraction('Green').round(2)).to eq(0.09)
    expect(polychotomy.most_probable_fraction('Blue').round(2)).to eq(0.09)
    expect(polychotomy.most_probable_fraction('Yellow').round(2)).to eq(0.39)
  end
end

describe Sapor::ReferendumPolychotomy, '#no_of_data_points' do
  it 'is 0 by default (no refinement)' do
    polychotomy = referendum_pentachotomy
    expect(polychotomy.no_of_data_points).to eq(0)
  end

  it 'is 1 after 1 refinement' do
    polychotomy = referendum_pentachotomy
    polychotomy.refine
    expect(polychotomy.no_of_data_points).to eq(1)
  end

  it 'is 19 after 2 refinements' do
    polychotomy = referendum_pentachotomy
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.no_of_data_points).to eq(8)
  end

  it 'is 38 after 3 refinements' do
    polychotomy = referendum_pentachotomy
    polychotomy.refine
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.no_of_data_points).to eq(27)
  end

  # TODO: A test case that runs all the simulations
end

describe Sapor::ReferendumPolychotomy, '#no_of_simulations' do
  it 'is 0 by default (no refinement)' do
    polychotomy = referendum_pentachotomy
    expect(polychotomy.no_of_simulations).to eq(0)
  end

  it 'is 1 after 1 refinement' do
    polychotomy = referendum_pentachotomy
    polychotomy.refine
    expect(polychotomy.no_of_simulations).to eq(1)
  end

  it 'is 2 after 2 refinements' do
    polychotomy = referendum_pentachotomy
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.no_of_simulations).to eq(2)
  end

  it 'is 4 after 3 refinements' do
    polychotomy = referendum_pentachotomy
    polychotomy.refine
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.no_of_simulations).to eq(4)
  end

  # TODO: A test case that runs until the end of the enumerator
end

describe Sapor::ReferendumPolychotomy, '#progress_report' do
  it 'reports progress with the number of simulations and data points,' \
     ' together with the search space size and the fraction that already has' \
     ' been searched' do
    expected_report = '1 simulations out of 1 data points, 1 / 142,120 of' \
                      ' search space size (142,120).'
    polychotomy = referendum_pentachotomy
    polychotomy.refine
    expect(polychotomy.progress_report).to eq(expected_report)
  end

  it 'reports no of simulations and data points with thousands separator' do
    expected_report = '1,024 simulations out of 9,287 data points, 1 / 15' \
                      ' of search space size (142,120).'
    polychotomy = referendum_pentachotomy
    11.times { polychotomy.refine }
    expect(polychotomy.progress_report).to eq(expected_report)
  end

  it 'rounds the fraction of the space size searched with 1 decimal if' \
     ' larger than one tenth' do
    expected_report = '2,048 simulations out of 19,433 data points, 1 / 7.3' \
                      ' of search space size (142,120).'
    polychotomy = referendum_pentachotomy
    12.times { polychotomy.refine }
    expect(polychotomy.progress_report).to eq(expected_report)
  end
end

describe Sapor::ReferendumPolychotomy, '#report' do
  it 'produces a report after first refinement for short choice labels' do
    expected_report = 'Most probable rounded fractions, fractions and 95%' \
                      " confidence intervals:\n" \
                      "Choice  Result    MPRF    MPF      CI(95%)      P(>↓)   P(R↑)    P(R)   P(R↓)\n" \
                      "Yellow   46.2%    5.6%    9.3%    9.3%– 11.1%  100.0%            0.0%  100.0%\n" + # TODO: Shouldn't MPRF be 5.6% and CI 9.3%–9.3%?
                      "Blue     23.1%    1.9%    1.9%    1.9%–  3.7%    0.0%    0.0%    0.0%    0.0%\n" + # TODO: Shouldn't CI be 1.9%–1.9%?
                      "Green    15.4%    1.9%    1.9%    1.9%–  3.7%    0.0%    0.0%    0.0%  100.0%\n" + # TODO: Shouldn't CI be 1.9%–1.9%?
                      "Red       7.7%    1.9%    1.9%    1.9%–  3.7%          100.0%    0.0%" # TODO: Shouldn't CI be 1.9%–1.9%?
    polychotomy = referendum_pentachotomy
    polychotomy.refine
    expect(polychotomy.report).to eq(expected_report)
  end

  it 'produces a report by default for long choice labels' do
    results = { 'Dark Red' => 1, 'Light Green' => 2, 'Medium Blue' => 3,
                'Other' => 1 }
    dichotomies = Sapor::Dichotomies.new(results, 1000)
    dichotomies.refine
    dichotomies.refine
    dichotomies.refine
    polychotomy = Sapor::ReferendumPolychotomy.new(results, REFERENDUM_TEST_AREA, dichotomies, 0.01)
    polychotomy.refine
    expected_report = 'Most probable rounded fractions, fractions and 95%' \
                      " confidence intervals:\n" \
                      "Choice       Result    MPRF    MPF      CI(95%)      P(>↓)   P(R↑)    P(R)   P(R↓)\n" \
                      "Medium Blue   42.9%    1.9%    1.9%    1.9%–  3.7%    0.0%            0.0%    0.0%\n" + # TODO: Shouldn't CI be 1.9%–1.9%?
                      "Light Green   28.6%    1.9%    1.9%    1.9%–  3.7%    0.0%    0.0%    0.0%  100.0%\n" + # TODO: Shouldn't CI be 1.9%–1.9%?
                      "Dark Red      14.3%    1.9%    1.9%    1.9%–  3.7%          100.0%    0.0%" # TODO: Shouldn't CI be 1.9%–1.9%?
    expect(polychotomy.report).to eq(expected_report)
  end

  it 'produces a report by default for short choice labels' do
    results = { 'Red' => 1, 'Green' => 2, 'Blue' => 3, 'Other' => 1 }
    dichotomies = Sapor::Dichotomies.new(results, 1000)
    dichotomies.refine
    dichotomies.refine
    dichotomies.refine
    polychotomy = Sapor::ReferendumPolychotomy.new(results, REFERENDUM_TEST_AREA, dichotomies, 0.01)
    polychotomy.refine
    expected_report = 'Most probable rounded fractions, fractions and 95%' \
                      " confidence intervals:\n" \
                      "Choice  Result    MPRF    MPF      CI(95%)      P(>↓)   P(R↑)    P(R)   P(R↓)\n" \
                      "Blue     42.9%    1.9%    1.9%    1.9%–  3.7%    0.0%            0.0%    0.0%\n" + # TODO: Shouldn't CI be 1.9%–1.9%?
                      "Green    28.6%    1.9%    1.9%    1.9%–  3.7%    0.0%    0.0%    0.0%  100.0%\n" + # TODO: Shouldn't CI be 1.9%–1.9%?
                      "Red      14.3%    1.9%    1.9%    1.9%–  3.7%          100.0%    0.0%" # TODO: Shouldn't CI be 1.9%–1.9%?
    expect(polychotomy.report).to eq(expected_report)
  end

  it 'sorts line with the same results alphabetically' do
    results = { 'Red' => 1, 'Green' => 1, 'Blue' => 1, 'Other' => 1 }
    dichotomies = Sapor::Dichotomies.new(results, 1000)
    dichotomies.refine
    dichotomies.refine
    dichotomies.refine
    polychotomy = Sapor::ReferendumPolychotomy.new(results, REFERENDUM_TEST_AREA, dichotomies, 0.01)
    polychotomy.refine
    expected_report = 'Most probable rounded fractions, fractions and 95%' \
                      " confidence intervals:\n" \
                      "Choice  Result    MPRF    MPF      CI(95%)      P(>↓)   P(R↑)    P(R)   P(R↓)\n" \
                      "Blue     25.0%    1.9%    1.9%    1.9%–  3.7%    0.0%            0.0%    0.0%\n" + # TODO: Shouldn't CI be 1.9%–1.9%?
                      "Green    25.0%    1.9%    1.9%    1.9%–  3.7%    0.0%    0.0%    0.0%  100.0%\n" + # TODO: Shouldn't CI be 1.9%–1.9%?
                      "Red      25.0%    1.9%    1.9%    1.9%–  3.7%          100.0%    0.0%" # TODO: Shouldn't CI be 1.9%–1.9%?
    expect(polychotomy.report).to eq(expected_report)
  end
end
