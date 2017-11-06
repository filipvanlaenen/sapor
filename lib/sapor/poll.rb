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

require 'yaml'

module Sapor
  OTHER = 'Other'.freeze

  #
  # Represents a poll.
  #
  class Poll
    include NumberFormatter
    attr_reader :area, :logger, :type

    AREA_KEY = 'Area'.freeze
    AREAS_MAP = {}
    [BelgiumBrussels.instance, BelgiumFlanders.instance, BelgiumWallonia.instance,
     Catalonia.instance, CataloniaWithoutJuntsPelSi.instance, Flanders.instance,
     France.instance, Greece.instance, Iceland.instance, Iceland2017.instance, Norway.instance,
     NorwegianMunicipality::BERGEN, NorwegianMunicipality::OSLO,
     NorwegianMunicipality::TRONDHEIM, UnitedKingdom.instance, Utopia.instance, Wallonia.instance].map { |area| AREAS_MAP[area.area_code] = area }

    TYPE_KEY = 'Type'.freeze
    REFERENDUM_TYPE_VALUE = 'Referendum'.freeze
    ELECTION_TYPE_VALUE = 'Election'.freeze

    DEFAULT_CONFIDENCE_LEVEL = 0.95

    def initialize(filename, metadata, results)
      @filename = filename
      @logger = LogFacade.create_logger
      @area_code = metadata.delete(AREA_KEY)
      @area = Poll.lookup_area(@area_code)
      @type = metadata.delete(TYPE_KEY)
      @results = interpret(results)
    end

    def analyze(options)
      analyze_as_dichotomies(options)
      analyze_as_polychotomy(options)
      @logger.info('Done.')
    end

    def continue_analysis(options)
      @logger = LogFacade.create_logger
      @logger.info('Continuing the analysis as a polychotomy...')
      @area = Poll.lookup_area(@area_code)
      @analysis.revive_volatile_fields(@logger)
      analyze_until_convergence(options)
      @logger.info('Done.')
    end

    def confidence_interval(choice, level = DEFAULT_CONFIDENCE_LEVEL)
      @analysis.confidence_interval(choice, level) unless @analysis.nil?
    end

    def most_probable_fraction(choice)
      @analysis.most_probable_fraction(choice) unless @analysis.nil?
    end

    def most_probable_value(choice)
      @analysis.most_probable_value(choice) unless @analysis.nil?
    end

    def result(choice)
      @results[choice]
    end

    def encode_with(coder)
      (instance_variables - [:@area, :@logger]).each do |var|
        var = var.to_s
        coder[var.gsub('@', '')] = eval(var)
      end
    end

    def self.lookup_area(area_code)
      AREAS_MAP[area_code]
    end

    private

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
      lines.each do |line|
        current = line_to_hash(line, current, results)
      end
      [metadata, results]
    end

    def self.from_lines(filename, lines)
      hashes = as_hashes(lines)
      metadata = hashes.first
      results = hashes.last
      new(filename, metadata, results)
    end

    def self.from_file(filename)
      from_lines(filename, File.open(filename))
    end

    def interpret(results)
      interpreted = {}
      results.each_pair do |key, value|
        interpreted[key] = value.to_i
      end
      interpreted
    end

    def population_size
      @area.population_size
    end

    def referendum?
      @type == REFERENDUM_TYPE_VALUE
    end

    def threshold
      if referendum?
        0.5
      else
        @area.threshold
      end
    end

    def analyze_until_convergence(options)
      while should_continue_analysis?(@analysis, options)
        @analysis.refine
        @logger.info(@analysis.report)
        @logger.info('Error estimate: ε ≤ ' +
                     three_digits_percentage(@analysis.error_estimate) +
                     '.')
        @logger.info(@analysis.progress_report)
        @analysis.write_outputs(@filename)
        save_state
      end
    end
    
    def should_continue_analysis?(analysis, options)
      analysis.kind_of?(Dichotomies) && (options.min_dichotomies_iterations > analysis.size || analysis.error_estimate > options.max_error) \
        || analysis.kind_of?(Polychotomy) && options.max_polychotomy_iterations > analysis.no_of_simulations && (options.min_polychotomy_iterations > analysis.no_of_simulations || analysis.error_estimate > options.max_error)
    end

    def analyze_as_dichotomies(options)
      @logger.info('Analyzing as a set of dichotomies...')
      @analysis = Dichotomies.new(@results, population_size, threshold)
      analyze_until_convergence(options)
    end

    def analyze_as_polychotomy(options)
      @logger.info('Analyzing as a polychotomy...')
      if referendum?
        @analysis = ReferendumPolychotomy.new(@results, @area, @analysis, options.max_error)
      else
        @analysis = RepresentativesPolychotomy.new(@results, @area, @analysis, options.max_error, @logger)
      end
      analyze_until_convergence(options)
    end
    
    def save_state
      new_yaml_file = @filename.gsub('.poll', '-state-new.yaml')
      open(new_yaml_file, 'w') do |file|
        file.write(to_yaml)
      end
      yaml_file = @filename.gsub('.poll', '-state.yaml')
      old_yaml_file = @filename.gsub('.poll', '-state-old.yaml')
      if File.exist?(old_yaml_file)
        File.delete(old_yaml_file)
      end
      if File.exist?(yaml_file)
        File.rename(yaml_file, old_yaml_file)
      end
      File.rename(new_yaml_file, yaml_file)
    end
  end
end
