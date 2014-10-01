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

module Sapor
  #
  # Represents a poll.
  #
  class Poll
    attr_reader :region

    def self.read_file(filename)
      file = File.open(filename, 'r')
      lines = []
      line = file.gets
      while line
        lines << line
        line = file.gets
      end
      file.close
      lines
    end

    def self.line_to_hash(line, current, metadata, results)
      if line == '=='
        current = results
      else
        elements = line.chomp.split('=')
        current[elements[0]] = elements[1]
      end
      current
    end

    def self.as_hashes(lines)
      metadata = {}
      results = {}
      current = metadata
      lines.each do | line |
        current = line_to_hash(line, current, metadata, results)
      end
      [metadata, results]
    end

    def self.from_lines(lines)
      hashes = as_hashes(lines)
      metadata = hashes[0]
      results = hashes[1]
      new(metadata, results)
    end

    def self.from_file(filename)
      from_lines(read_file(filename))
    end

    def initialize(metadata, results)
      @region = metadata['Region']
    end
  end
end
