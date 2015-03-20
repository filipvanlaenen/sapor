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

require 'prime'

module Sapor
  #
  # Represents a polychotomy.
  #
  class Polychotomy
    include PercentageFormatter

    attr_reader :error_estimate, :no_of_data_points, :no_of_simulations

    OTHER = 'Other'

    def initialize(results, population_size, dichotomies, max_error)
      @results = results
      @choices = results.keys
      @population_size = population_size
      @ranges = extract_ranges_from_dichotomies(dichotomies, max_error)
      @choices.sort! do | a, b |
        if a == OTHER
          1
        elsif b == OTHER
          -1
        else
          @ranges[a].size <=> @ranges[b].size
        end
      end
      @incrementers = create_incrementers
      @counters = initialize_counters
      @no_of_simulations = 0
      @no_of_data_points = 0
      @simulations = create_new_simulations
      @error_estimate = 1.0
    end

    def extract_ranges_from_dichotomies(dichotomies, max_error)
      ranges = {}
      level = 1 - (max_error**2)
      @choices.each do | choice |
        unless choice == OTHER
          ranges[choice] = dichotomies.confidence_interval_values(choice, level).sort
        end
      end
      ranges
    end

    def initialize_counters
      counters = {}
      @choices.each do | choice |
        counters[choice] = 0 unless choice == OTHER
      end
      counters
    end

    def create_incrementers
      incrementers = {}
      incrementer = 0
      @choices.each do | choice |
        unless choice == OTHER
          incrementer = next_incrementer(incrementer)
          incrementers[choice] = incrementer
        end
      end
      incrementers
    end

    def next_incrementer(incrementer)
      incrementer += 1
      while incrementer > 1 &&
            (!prime?(incrementer) || !relative_prime?(incrementer))
        incrementer += 1
      end
      incrementer
    end

    def prime?(number)
      Prime.instance.prime?(number)
    end

    def relative_prime?(incrementer)
      @ranges.values.map { | range | range.size.gcd(incrementer) }.max == 1
    end

    def range(choice)
      @ranges[choice]
    end

    def space_size
      @ranges.values.map { | range | range.size }.inject(1, :*)
    end

    def incrementer(choice)
      @incrementers[choice]
    end

    def increment_counters
      @choices.each do | choice |
        unless choice == OTHER
          @counters[choice] += @incrementers[choice]
          @counters[choice] = @counters[choice].modulo(@ranges[choice].size)
        end
      end
    end

    def all_counters_back_at_zero?
      @counters.max == 0
    end

    def other_value
      sum = 0
      @choices.each do | choice |
        unless choice == OTHER
          sum += @ranges[choice][@counters[choice]]
        end
      end
      @population_size - sum
    end

    def valid_simulation?
      other_value >= 0
    end

    def simulate(simulations)
      combinations = other_value.large_float_binomial_by_product_of_divisions(@results[OTHER])
      @choices.each do | choice |
        unless choice == OTHER
          combinations *= @ranges[choice][@counters[choice]].large_float_binomial_by_product_of_divisions(@results[choice])
        end
      end
      @choices.each do | choice |
        unless choice == OTHER
          simulations[choice][@counters[choice]] += combinations
        end
      end
    end

    def create_new_simulations
      simulations = {}
      @choices.each do | choice |
        unless choice == OTHER
          simulations[choice] = Array.new(@ranges[choice].size, 0.to_lf)
        end
      end
      simulations
    end

    def calculate_most_probable_value(choice, simulations)
      @ranges[choice][simulations[choice].each_with_index.max[1]]
    end

    def most_probable_value(choice)
      if @no_of_simulations == 0
        nil
      else
        calculate_most_probable_value(choice, @simulations)
      end
    end

    def calculate_most_probable_fraction(choice, simulations)
      # TODO: Should rather aggregate per intervals of max_error
      calculate_most_probable_value(choice, simulations).to_f / @population_size
    end

    def most_probable_fraction(choice)
      if @no_of_simulations == 0
        nil
      else
        calculate_most_probable_fraction(choice, @simulations)
      end
    end

    def calculate_error_estimate(new_simulations)
      error_estimate = 0
      @choices.each do | choice |
        unless choice == OTHER
          delta = (calculate_most_probable_fraction(choice, new_simulations) - calculate_most_probable_fraction(choice, @simulations)).abs
          error_estimate = [error_estimate, delta].max
        end
      end
      error_estimate
    end

    def merge_simulations(simulations1, simulations2)
      merged_simulations = {}
      @choices.each do | choice |
        unless choice == OTHER
          merged_simulations[choice] = Array.new(@ranges[choice].size)
          @ranges[choice].size.times do | i |
            merged_simulations[choice][i] = simulations1[choice][i] + simulations2[choice][i] 
          end
        end
      end
      merged_simulations
    end

    def refine
      no_of_new_simulations = 0
      new_simulations = create_new_simulations
      while @no_of_data_points == 0 ||
            (no_of_new_simulations == 0 && !all_counters_back_at_zero?) ||
            (no_of_new_simulations < @no_of_simulations &&
             !all_counters_back_at_zero?)
        increment_counters
        if valid_simulation?
          simulate(new_simulations)
          no_of_new_simulations += 1
        end
        @no_of_data_points += 1
      end
      @error_estimate = calculate_error_estimate(new_simulations) unless @no_of_simulations == 0
      @simulations = merge_simulations(@simulations, new_simulations)
      @no_of_simulations += no_of_new_simulations
    end

    def sort_choices_by_mpv
      sorted_choices = @choices.reject { | choice | choice == OTHER }
      sorted_choices.sort do | a, b |
        mpv_a = most_probable_fraction(a)
        mpv_b = most_probable_fraction(b)
        mpv_b <=> mpv_a
      end
    end

    def create_report_line(choice, max_choice_width)
      choice.ljust(max_choice_width) + ' ' + \
      as_table_percentage(most_probable_fraction(choice))
    end

    def report
      choice_lengths = @choices.map { | choice | choice.length }
      max_choice_width = choice_lengths.max
      sorted_choices = sort_choices_by_mpv
      lines = sorted_choices.map do | choice |
        create_report_line(choice, max_choice_width)
      end
      "Most probable fractions:\n" +
      "Choice   MPV  \n" +
      lines.join("\n")
    end

    def format_large_number(number)
      number.to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
    end

    def progress_report
      space_size_ratio = space_size / @no_of_data_points
      if (space_size_ratio > 10)
        space_size_ratio = format_large_number(space_size_ratio.round)
      else
        space_size_ratio = space_size_ratio.round(1)
      end
      "#{@no_of_simulations} simulations out of #{@no_of_data_points} data points, 1 / #{space_size_ratio} of search space size (#{format_large_number(space_size)})."
    end
  end
end
