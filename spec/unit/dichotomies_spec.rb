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

SAMPLE_RESULTS = { 'Red' => 1, 'Green' => 2, 'Blue' => 3, 'Other' => 1 }
SAMPLE_POPULATION_SIZE = 1_000_000

describe Sapor::Dichotomies, '#error_estimate' do
  it 'returns the largest error estimate of the underlying Dichotomy ' \
     'objects' do
    dichotomies = Sapor::Dichotomies.new(SAMPLE_RESULTS,
                                         SAMPLE_POPULATION_SIZE)
    expect(dichotomies.error_estimate).to eq(1)
  end
end

describe Sapor::Dichotomies, '#progress_report' do
  it 'reports progress as 1 data point by default' do
    dichotomies = Sapor::Dichotomies.new(SAMPLE_RESULTS,
                                         SAMPLE_POPULATION_SIZE)
    expect(dichotomies.progress_report).to eq('Number of data points: 1.')
  end

  it 'reports progress as 3 data points after the first refinement' do
    dichotomies = Sapor::Dichotomies.new(SAMPLE_RESULTS,
                                         SAMPLE_POPULATION_SIZE)
    dichotomies.refine
    expect(dichotomies.progress_report).to eq('Number of data points: 3.')
  end
end

describe Sapor::Dichotomies, '#report' do
  it 'produces a report by default for short choice labels' do
    dichotomies = Sapor::Dichotomies.new(SAMPLE_RESULTS,
                                         SAMPLE_POPULATION_SIZE)
    expected_report = 'Most probable fractions and 95% confidence ' +
                      "intervals:\n" +
                      "Choice   MPF      CI(95%)\n" +
                      "Blue    50.0% (  0.0%–100.0%)\n" +
                      "Green   50.0% (  0.0%–100.0%)\n" +
                      "Red     50.0% (  0.0%–100.0%)\n" +
                      'Other   50.0% (  0.0%–100.0%)'
    expect(dichotomies.report).to eq(expected_report)
  end

  it 'produces a report by default for long choice labels' do
    dichotomies = Sapor::Dichotomies.new({ 'Dark Red' => 1,
                                           'Light Green' => 2,
                                           'Medium Blue' => 3, 'Other' => 1 },
                                         SAMPLE_POPULATION_SIZE)
    expected_report = 'Most probable fractions and 95% confidence ' +
                      "intervals:\n" +
                      "Choice        MPF      CI(95%)\n" +
                      "Dark Red     50.0% (  0.0%–100.0%)\n" +
                      "Light Green  50.0% (  0.0%–100.0%)\n" +
                      "Medium Blue  50.0% (  0.0%–100.0%)\n" +
                      'Other        50.0% (  0.0%–100.0%)'
    expect(dichotomies.report).to eq(expected_report)
  end

  it 'produces a report after the first refinement' do
    dichotomies = Sapor::Dichotomies.new(SAMPLE_RESULTS,
                                         SAMPLE_POPULATION_SIZE)
    dichotomies.refine
    expected_report = 'Most probable fractions and 95% confidence ' +
                      "intervals:\n" +
                      "Choice   MPF      CI(95%)\n" +
                      "Blue    50.0% (  0.0%–100.0%)\n" +
                      "Green   16.7% (  0.0%– 66.7%)\n" +
                      "Red     16.7% (  0.0%– 66.7%)\n" +
                      'Other   16.7% (  0.0%– 66.7%)'
    expect(dichotomies.report).to eq(expected_report)
  end

  it 'sorts the choices according to MPF' do
    dichotomies = Sapor::Dichotomies.new({ 'Red' => 3, 'Green' => 2,
                                           'Blue' => 1, 'Other' => 1 },
                                         SAMPLE_POPULATION_SIZE)
    dichotomies.refine
    expected_report = 'Most probable fractions and 95% confidence ' +
                      "intervals:\n" +
                      "Choice   MPF      CI(95%)\n" +
                      "Red     50.0% (  0.0%–100.0%)\n" +
                      "Blue    16.7% (  0.0%– 66.7%)\n" +
                      "Green   16.7% (  0.0%– 66.7%)\n" +
                      'Other   16.7% (  0.0%– 66.7%)'
    expect(dichotomies.report).to eq(expected_report)
  end

  it "puts Other on the last line, even if it's listed first and largest" do
    dichotomies = Sapor::Dichotomies.new({ 'Other' => 4, 'Red' => 1,
                                           'Green' => 2, 'Blue' => 3 },
                                         SAMPLE_POPULATION_SIZE)
    dichotomies.refine
    expected_report = 'Most probable fractions and 95% confidence ' +
                      "intervals:\n" +
                      "Choice   MPF      CI(95%)\n" +
                      "Blue    16.7% (  0.0%– 66.7%)\n" +
                      "Green   16.7% (  0.0%– 66.7%)\n" +
                      "Red     16.7% (  0.0%– 66.7%)\n" +
                      'Other   50.0% (  0.0%– 66.7%)'
    expect(dichotomies.report).to eq(expected_report)
  end
end
