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

SAMPLE_POLL_ARRAY = ['foo=bar', 'baz=qux', '==', 'a=1', 'b=2']
SAMPLE_METADATA = { 'Area' => 'UT' }
SAMPLE_RESULTS = { 'Red' => 1, 'Green' => 2, 'Blue' => 3, 'Other' => 1 }
MAX_ERROR = 0.05
MAX_VALUE_ERROR = 50_000

def sample_poll
  Sapor::Poll.new(SAMPLE_METADATA.dup, SAMPLE_RESULTS.dup)
end

describe Sapor::Poll, '#as_hashes' do
  it 'converts an array of lines into an array with two hashes' do
    hashes = Sapor::Poll.as_hashes(SAMPLE_POLL_ARRAY)
    expect(hashes.size).to eq(2)
  end

  it 'extracts the metadata into the first array' do
    hashes = Sapor::Poll.as_hashes(SAMPLE_POLL_ARRAY)
    expect(hashes[0]).to eq('foo' => 'bar', 'baz' => 'qux')
  end

  it 'extracts the results into the second array' do
    hashes = Sapor::Poll.as_hashes(SAMPLE_POLL_ARRAY)
    expect(hashes[1]).to eq('a' => '1', 'b' => '2')
  end
end

describe Sapor::Poll, '#new' do
  it 'sets the area' do
    expect(sample_poll.area.area_code).to eq('UT')
  end

  it 'sets the results' do
    expect(sample_poll.result('Red')).to eq(1)
    expect(sample_poll.result('Green')).to eq(2)
    expect(sample_poll.result('Blue')).to eq(3)
  end
end

describe Sapor::Poll, '#most_probable_value' do
  it 'returns nil if no analysis has been run' do
    expect(sample_poll.most_probable_value('Blue')).to be_nil
  end

  it 'gets the most probable value after analysis (50%)' do
    poll = sample_poll
    poll.analyze(MAX_ERROR)
    expect(poll.most_probable_value('Blue')).to \
      be_within(MAX_VALUE_ERROR).of(428_571)
  end

  it 'gets the most probable value after analysis (33%)' do
    poll = sample_poll
    poll.analyze(MAX_ERROR)
    expect(poll.most_probable_value('Green')).to \
      be_within(MAX_VALUE_ERROR).of(285_714)
  end
end

describe Sapor::Poll, '#most_probable_fraction' do
  it 'returns nil if no analysis has been run' do
    expect(sample_poll.most_probable_fraction('Blue')).to be_nil
  end

  it 'gets the most probable fraction after analysis (50%)' do
    poll = sample_poll
    poll.analyze(MAX_ERROR)
    expect(poll.most_probable_fraction('Blue')).to \
      be_within(MAX_ERROR).of(3.to_f / 7.to_f)
  end

  it 'gets the most probable fraction after analysis (33%)' do
    poll = sample_poll
    poll.analyze(MAX_ERROR)
    expect(poll.most_probable_fraction('Green')).to \
      be_within(MAX_ERROR).of(2.to_f / 7.to_f)
  end
end

describe Sapor::Poll, '#confidence_interval' do
  it 'returns nil if no analysis has been run' do
    expect(sample_poll.confidence_interval('Blue')).to be_nil
  end
end
