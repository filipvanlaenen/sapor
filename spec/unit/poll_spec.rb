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
