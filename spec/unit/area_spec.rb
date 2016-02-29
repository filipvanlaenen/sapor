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

NORTH = 'North'
SOUTH = 'South'

RED = 'Red'
BLUE = 'Blue'

NORTH_RED_LINE = "#{NORTH} | #{RED} | 5"
NORTH_BLUE_LINE = "#{NORTH} | #{BLUE} | 6"
SOUTH_RED_LINE = "#{SOUTH} | #{RED} | 7"
SOUTH_BLUE_LINE_WITH_THOUSANDS_SEPARATOR = "#{SOUTH} | #{BLUE} | 8,888,888"
EMPTY_LINE = ' '
COMMENT = '# A comment'
BROKEN_LINE = 'Broken line'

describe Sapor::Area, '#lines_to_election_results' do
  it 'converts a single line to 1 constituency' do
    area = Sapor::Area.new
    election_results = area.lines_to_election_results(NORTH_RED_LINE)
    expect(election_results.size).to eq(1)
  end

  it 'converts two lines for the same constituency to 1 constituency' do
    area = Sapor::Area.new
    lines = [NORTH_RED_LINE, NORTH_BLUE_LINE].join("\n")
    election_results = area.lines_to_election_results(lines)
    expect(election_results.size).to eq(1)
  end

  it 'converts two lines for two constituencies to 2 constituencies' do
    area = Sapor::Area.new
    lines = [NORTH_RED_LINE, SOUTH_RED_LINE].join("\n")
    election_results = area.lines_to_election_results(lines)
    expect(election_results.size).to eq(2)
  end

  it 'ignores empty lines' do
    area = Sapor::Area.new
    lines = [NORTH_RED_LINE, EMPTY_LINE].join("\n")
    election_results = area.lines_to_election_results(lines)
    expect(election_results.size).to eq(1)
  end

  it 'ignores comments' do
    area = Sapor::Area.new
    lines = [NORTH_RED_LINE, COMMENT].join("\n")
    election_results = area.lines_to_election_results(lines)
    expect(election_results.size).to eq(1)
  end

  it 'sets the number of votes for a party in a constituency correctly' do
    area = Sapor::Area.new
    election_results = area.lines_to_election_results(NORTH_RED_LINE)
    expect(election_results[NORTH][RED]).to eq(5)
  end

  it 'ignores thousands separators' do
    area = Sapor::Area.new
    election_results = area.lines_to_election_results(\
      SOUTH_BLUE_LINE_WITH_THOUSANDS_SEPARATOR)
    expect(election_results[SOUTH][BLUE]).to eq(8_888_888)
  end

  it 'raises an ArgumentError when a line is broken' do
    area = Sapor::Area.new
    expect { area.lines_to_election_results(BROKEN_LINE) }.to \
      raise_error(ArgumentError, "Broken line: #{BROKEN_LINE}.")
  end

  it 'raises an ArgumentError if the same choice is added twice to the same ' \
     'constituency' do
    area = Sapor::Area.new
    lines = [NORTH_RED_LINE, NORTH_RED_LINE].join("\n")
    expect { area.lines_to_election_results(lines) }.to \
      raise_error(ArgumentError, "Choice #{RED} appeared twice in " \
                                 "constituency #{NORTH}.")
  end
end

describe Sapor::Area, '#summarize_election_results' do
  it 'summarizes one result to one result' do
    area = Sapor::Area.new
    election_results = area.lines_to_election_results(NORTH_RED_LINE)
    summary = area.summarize_election_results(election_results)
    expect(summary[RED]).to eq(5)
  end

  it 'summarizes results of same choice in two constituencies' do
    area = Sapor::Area.new
    lines = [NORTH_RED_LINE, SOUTH_RED_LINE].join("\n")
    election_results = area.lines_to_election_results(lines)
    summary = area.summarize_election_results(election_results)
    expect(summary[RED]).to eq(12)
  end
end
