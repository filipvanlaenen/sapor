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

SAMPLE_FILE = File.join('spec', 'integration', 'sample.poll')
MAX_ERROR = 0.05

#
# Logger logging messages to an array.
#
class ArrayLogger
  attr_reader :messages

  def initialize
    @messages = []
  end

  def info(message)
    @messages << message
  end
end

#
# LoggerBuilder that creates ArrayLogger instances.
#
class ArrayLoggerBuilder
  def create_logger
    ArrayLogger.new
  end
end

Sapor::LogFacade.logger_builder = ArrayLoggerBuilder.new

describe Sapor::Poll, '#from_file' do
  it 'reads a poll from a file and extracts area' do
    poll = Sapor::Poll.from_file(SAMPLE_FILE)
    expect(poll.area.area_code).to eq('UT')
  end

  it 'reads a poll from a file and extracts first result' do
    poll = Sapor::Poll.from_file(SAMPLE_FILE)
    expect(poll.result('Red')).to eq(1)
  end

  it 'reads a poll from a file and extracts last result' do
    poll = Sapor::Poll.from_file(SAMPLE_FILE)
    expect(poll.result('Blue')).to eq(3)
  end
end

describe Sapor::Poll, '#analyze' do
  it 'logs “Analyzing as a set of dichotomies...”' do
    poll = Sapor::Poll.from_file(SAMPLE_FILE)
    poll.analyze(MAX_ERROR)
    expect(poll.logger.messages).to include('Analyzing as a set of' \
                                            ' dichotomies...')
  end

  it 'logs “Analyzing as a polychotomy...”' do
    poll = Sapor::Poll.from_file(SAMPLE_FILE)
    poll.analyze(MAX_ERROR)
    expect(poll.logger.messages).to include('Analyzing as a polychotomy...')
  end

  it 'logs “Done.” at the end' do
    poll = Sapor::Poll.from_file(SAMPLE_FILE)
    poll.analyze(MAX_ERROR)
    expect(poll.logger.messages.last).to eq('Done.')
  end

  it 'logs error estimates' do
    poll = Sapor::Poll.from_file(SAMPLE_FILE)
    poll.analyze(MAX_ERROR)
    expect(poll.logger.messages).to include('Error estimate: ε ≤ 33.3%.')
  end

  it 'logs MPV and CI(95%) reports from Dichotomies' do
    poll = Sapor::Poll.from_file(SAMPLE_FILE)
    poll.analyze(MAX_ERROR)
    expected_report = 'Most probable fractions and 95% confidence' +
                      " intervals:\n" +
                      "Choice    MPF      CI(95%)\n" +
                      "Yellow   46.3%   22.2%– 74.1%\n" +
                      "Blue     24.1%    7.4%– 51.9%\n" +
                      "Green    16.7%    3.7%– 44.4%\n" +
                      "Red       9.3%    0.0%– 37.0%\n" +
                      'Other     9.3%    0.0%– 37.0%'
    expect(poll.logger.messages).to include(expected_report)
  end
end
