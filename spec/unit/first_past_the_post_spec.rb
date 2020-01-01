# encoding: utf-8
#
# Statistical Analysis of Polling Results (SAPoR)
# Copyright (C) 2020 Filip van Laenen <f.a.vanlaenen@ieee.org>
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

SAMPLE_RG_ELECTION_RESULT = { 'Red' => 91_811, 'Green' => 190_934 }.freeze

SAMPLE_DETAILED_ELECTION_RESULT = { 'North' => { 'Red' => 50, 'Green' => 70 },
                                    'South' => { 'Red' => 70, 'Green' => 50,
                                                 'Blue' => 100 } }.freeze

FPTP = Sapor::FirstPastThePost.new(SAMPLE_RG_ELECTION_RESULT,
                                   SAMPLE_DETAILED_ELECTION_RESULT)

describe Sapor::FirstPastThePost, '#project' do
  it 'projects same result as last result if fed with last election result' do
    projection = FPTP.project(SAMPLE_RG_ELECTION_RESULT)
    expect(projection['Red']).to eq(0)
    expect(projection['Green']).to eq(1)
    expect(projection['Other']).to eq(1)
  end

  it 'it moves a seat to Red if Red is polling well enough' do
    projection = FPTP.project('Red' => 91_811 * 70 / 49,
                              'Green' => 190_934)
    expect(projection['Red']).to eq(1)
    expect(projection['Green']).to eq(0)
    expect(projection['Other']).to eq(1)
  end

  it 'it moves a seat away from Other if Red is polling well enough' do
    projection = FPTP.project('Red' => 91_811 * 101 / 70,
                              'Green' => 190_934 * 70 / 101)
    expect(projection['Red']).to eq(2)
    expect(projection['Green']).to eq(0)
    expect(projection['Other']).to eq(0)
  end
end
