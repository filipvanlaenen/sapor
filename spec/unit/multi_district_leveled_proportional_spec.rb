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

SAMPLE_ELECTION_RESULT = { 'Red' => 120, 'Green' => 120, 'Blue' => 100 }

SAMPLE_DETAILED_ELECTION_RESULT = { 'North' => { 'Red' => 50, 'Green' => 70
                                             },
                                    'South' => { 'Red' => 70, 'Green' => 50,
                                                 'Blue' => 100 } }

SAMPLE_SEAT_DISTRIBUTION = { 'North' => 3, 'South' => 5 }

SAMPLE_LEVELING_SEATS = 2

SAMPLE_LEVELING_THRESHOLD = 0.05

SAMPLE_POLL_RESULT = { 'Red' => 120, 'Green' => 120 }

LEVELED = Sapor::MultiDistrictLeveledProportional.new( \
  SAMPLE_ELECTION_RESULT, SAMPLE_DETAILED_ELECTION_RESULT,
  SAMPLE_SEAT_DISTRIBUTION, SAMPLE_LEVELING_SEATS, SAMPLE_LEVELING_THRESHOLD,
  Sapor::SainteLague14Denominators)

describe Sapor::MultiDistrictLeveledProportional, '#project' do
  it 'projects same result as last result if fed with last election result' do
    projection = LEVELED.project(SAMPLE_POLL_RESULT)
    expect(projection['Red']).to eq(4)
    expect(projection['Green']).to eq(4)
    expect(projection['Blue']).to eq(2)
  end
end
