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

INDEX = 'index-2014.txt'.freeze
TARGET = 'hungary-2014.txt'.freeze

BASE_URL = 'http://valasztas.hu/dyn/pv14/szavossz/en/'.freeze

DISTRICT_MATCHER = %r{<h2>Result of the single-member constituencies\s+(.*)\.\s*\(.*</h2>}m
RESULT_ROW_MATCHER = %r{<tr>\s*((<td[^>]*>[^<]*</td>\s*)+)}m
SEQUENCE_CELL_MATCHER = %r{<td[^>]*>&nbsp;(\d+)&nbsp;</td>}m
CELL_MATCHER = %r{<td[^>]*>([^<]*)</td>}m

File.open(TARGET, 'w') do |output|
  File.open(INDEX).each do |line|
    url = BASE_URL + line.chomp
    puts url
    content = `curl -s #{url}`.encode('utf-8', 'iso-8859-2')
    district = content.scan(DISTRICT_MATCHER).first.first.gsub(/&ndash;/, '–')
    puts district
    content.scan(RESULT_ROW_MATCHER) do |match|
      row = match.first
      unless row.scan(SEQUENCE_CELL_MATCHER).first.nil?
        cells = row.scan(CELL_MATCHER)
        party = cells[2].first
        result = cells[3].first.gsub(/&nbsp;/, '')
        output.puts "#{district} | #{party} | #{result}"
      end
    end
    output.puts
  end
end
