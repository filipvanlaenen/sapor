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

describe Sapor::Poll, '#from_file' do
  it 'reads a poll from a file and extracts area' do
    poll = Sapor::Poll.from_file(SAMPLE_FILE)
    expect(poll.area).to eq('Foo')
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
