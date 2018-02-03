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

SAMPLE_ELECTION_RESULT = { 'Yellow' => 47_000, 'White' => 16_000,
                           'Red' => 15_800, 'Green' => 12_000, 'Blue' => 6_100,
                           'Pink' => 3_100 }.freeze

ALABAMA_PARADOX_ELECTION_RESULT = { 'Yellow' => 1500, 'White' => 1500,
                                    'Red' => 900, 'Green' => 500, 'Blue' => 500,
                                    'Pink' => 200 }.freeze

NO_OF_SEATS = 10

HARE_QUOTA = Sapor::LargestRemainder.new(NO_OF_SEATS, Sapor::HareQuota)
DROOP_QUOTA = Sapor::LargestRemainder.new(NO_OF_SEATS, Sapor::DroopQuota)

describe Sapor::LargestRemainder, '#project' do
  it 'produces the correct result for the Hare quota' do
    projection = HARE_QUOTA.project(SAMPLE_ELECTION_RESULT)
    expect(projection['Yellow']).to eq(5)
    expect(projection['White']).to eq(2)
    expect(projection['Red']).to eq(1)
    expect(projection['Green']).to eq(1)
    expect(projection['Blue']).to eq(1)
    expect(projection['Pink']).to eq(0)
  end

  it 'produces the correct result for the 25 seat Alabama paradox for the ' \
       'Hare quota' do
    alabama25 = Sapor::LargestRemainder.new(25, Sapor::HareQuota)
    projection = alabama25.project(ALABAMA_PARADOX_ELECTION_RESULT)
    expect(projection['Yellow']).to eq(7)
    expect(projection['White']).to eq(7)
    expect(projection['Red']).to eq(4)
    expect(projection['Green']).to eq(3)
    expect(projection['Blue']).to eq(3)
    expect(projection['Pink']).to eq(1)
  end

  it 'produces the correct result for the 26 seat Alabama paradox for the ' \
       'Hare quota' do
    alabama26 = Sapor::LargestRemainder.new(26, Sapor::HareQuota)
    projection = alabama26.project(ALABAMA_PARADOX_ELECTION_RESULT)
    expect(projection['Yellow']).to eq(8)
    expect(projection['White']).to eq(8)
    expect(projection['Red']).to eq(5)
    expect(projection['Green']).to eq(2)
    expect(projection['Blue']).to eq(2)
    expect(projection['Pink']).to eq(1)
  end

  it 'produces the correct result for the Droop quota' do
    projection = DROOP_QUOTA.project(SAMPLE_ELECTION_RESULT)
    expect(projection['Yellow']).to eq(5)
    expect(projection['White']).to eq(2)
    expect(projection['Red']).to eq(2)
    expect(projection['Green']).to eq(1)
    expect(projection['Blue']).to eq(0)
    expect(projection['Pink']).to eq(0)
  end
end
