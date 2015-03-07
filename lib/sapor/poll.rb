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
    include PercentageFormatter
    attr_reader :area, :logger

    AREA_KEY = 'Area'

    def self.line_to_hash(line, current, results)
      if line.chomp.eql?('==')
        current = results
      else
        elements = line.chomp.split('=')
        current[elements.first] = elements.last
      end
      current
    end

    def self.as_hashes(lines)
      metadata = {}
      results = {}
      current = metadata
      lines.each do | line |
        current = line_to_hash(line, current, results)
      end
      [metadata, results]
    end

    def self.from_lines(lines)
      hashes = as_hashes(lines)
      metadata = hashes.first
      results = hashes.last
      new(metadata, results)
    end

    def self.from_file(filename)
      from_lines(File.open(filename))
    end

    def initialize(metadata, results)
      @logger = LogFacade.create_logger
      @area = metadata.delete(AREA_KEY)
      @results = interpret(results)
    end

    def interpret(results)
      interpreted = {}
      results.each_pair do |key, value|
        interpreted[key] = value.to_i
      end
      interpreted
    end

    def result(choice)
      @results[choice]
    end

    def most_probable_value(choice)
      @analysis.most_probable_value(choice) unless @analysis.nil?
    end

    def most_probable_fraction(choice)
      @analysis.most_probable_fraction(choice) unless @analysis.nil?
    end

    def confidence_interval(choice, level = 0.95)
      @analysis.confidence_interval(choice, level) unless @analysis.nil?
    end

    def population_size
      1_000_000 # TODO: Should be looked up using @area
    end

    def analyze(max_error = 0.001)
      @analysis = Dichotomies.new(@results, population_size)
      while @analysis.error_estimate > max_error
        @analysis.refine
        error_estimate_as_percentage = as_percentage(@analysis.error_estimate)
        @logger.info("Error estimate: ε ≤ #{error_estimate_as_percentage}.")
      end
      @logger.info('Done.')
    end
  end
end
