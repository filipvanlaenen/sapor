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

SAMPLE_RGB_ELECTION_RESULT = { 'Red' => 120, 'Green' => 120, 'Blue' => 100 }

SAMPLE_DETAILED_ELECTION_RESULT = { 'North' => { 'Red' => 50, 'Green' => 70
                                             },
                                    'South' => { 'Red' => 70, 'Green' => 50,
                                                 'Blue' => 100 } }

SAMPLE_SEAT_DISTRIBUTION = { 'North' => 3, 'South' => 5 }

PROPORTIONAL = Sapor::MultiDistrictProportional.new( \
  SAMPLE_RGB_ELECTION_RESULT, SAMPLE_DETAILED_ELECTION_RESULT,
  SAMPLE_SEAT_DISTRIBUTION, Sapor::DhondtDenominators)

describe Sapor::MultiDistrictProportional, '#project' do
  # Seat distribution:
  # North: Green 1 70, Red 1 50, Green 2 35, (Red 2 25)
  # South: Blue 1 100, Red 1 70, Green 1 50, Blue 2 50, Red 2 35, (Blue 3 33)
  it 'projects same result as last result if fed with last election result' do
    projection = PROPORTIONAL.project(SAMPLE_RGB_ELECTION_RESULT)
    expect(projection['Red']).to eq(3)
    expect(projection['Green']).to eq(3)
    expect(projection['Blue']).to eq(2)
  end

  # Seat distribution:
  # North: Green 1 62, Red 1 44, Green 2 31, (Red 2 22)
  # South: Blue 1 128, Red 1 62, Green 1 44, Blue 2 64, Blue 3 42, (Red 2 31)
  it 'extrapolates the seat distribution according to the new result' do
    new_result = { 'Red' => 100, 'Green' => 100, 'Blue' => 120 }
    projection = PROPORTIONAL.project(new_result)
    expect(projection['Red']).to eq(2)
    expect(projection['Green']).to eq(3)
    expect(projection['Blue']).to eq(3)
  end

  # Seat distribution:
  # North: Green 1 70, Red 1 50, Green 2 35 (Red 2 25, Green 3 23)
  # South: Blue 1 100, Red 1 70, Blue 2 50, Red 2 35, Blue 3 33, (Blue 4 25,
  #        Red 3 23, Green below threshold)
  it 'excludes parties below the threshold' do
    proportional = Sapor::MultiDistrictProportional.new( \
      SAMPLE_RGB_ELECTION_RESULT, SAMPLE_DETAILED_ELECTION_RESULT,
      SAMPLE_SEAT_DISTRIBUTION, Sapor::DhondtDenominators, 51.to_f / 220)
    projection = proportional.project(SAMPLE_RGB_ELECTION_RESULT)
    expect(projection['Red']).to eq(3)
    expect(projection['Green']).to eq(2)
    expect(projection['Blue']).to eq(3)
  end

  # Seat distribution:
  # North: Green 1 70, Red 1 50, Green 2 35, (Red 2 25)
  # South: Blue 1 100, Red 1 70, Green 1 50, Blue 2 50, Red 2 35, (Blue 3 33)
  it 'includes parties at the threshold' do
    proportional = Sapor::MultiDistrictProportional.new( \
      SAMPLE_RGB_ELECTION_RESULT, SAMPLE_DETAILED_ELECTION_RESULT,
      SAMPLE_SEAT_DISTRIBUTION, Sapor::DhondtDenominators, 50.to_f / 220)
    projection = proportional.project(SAMPLE_RGB_ELECTION_RESULT)
    expect(projection['Red']).to eq(3)
    expect(projection['Green']).to eq(3)
    expect(projection['Blue']).to eq(2)
  end
end
