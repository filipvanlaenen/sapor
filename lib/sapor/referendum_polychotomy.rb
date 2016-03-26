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

require 'prime'

module Sapor
  #
  # Represents a polychotomy for a referendum.
  #
  class ReferendumPolychotomy < Polychotomy
    include NumberFormatter

    def initialize(results, area, dichotomies, max_error)
      @results = results
      @area = area
      @choices = results.keys
      @ranges = extract_ranges_from_dichotomies(dichotomies, max_error)
      range_sizes = @ranges.values.map(&:size)
      @enum = PseudoRandomMultiRangeEnumerator.new(range_sizes).each
      @no_of_simulations = 0
      @no_of_data_points = 0
      @distributions = create_new_votes_distributions # TODO: Rename to @votes
      @comparisons = {}
      @choices.each do |a|
        @choices.each do |b|
          @comparisons[a + '>' + b] = 0.to_lf
        end
      end
      @combinations_sum = 0.to_lf
      @error_estimate = 1.0
    end

    def refine
      no_of_new_simulations = 0
      new_votes = create_new_votes_distributions
      while @no_of_data_points == 0 || no_of_new_simulations == 0 ||
            no_of_new_simulations < @no_of_simulations
        no_of_new_simulations += try_next_data_point(new_votes)
      end
      unless @no_of_simulations == 0
        @error_estimate = calculate_error_estimate(new_votes)
      end
      @distributions = merge_distributions(@distributions, new_votes)
      @no_of_simulations += no_of_new_simulations
    end

    def try_next_data_point(new_votes)
      data_point = next_data_point
      if data_point[OTHER] >= 0
        simulate(new_votes, data_point)
        new_simulation = 1
      else
        new_simulation = 0
      end
      @no_of_data_points += 1
      new_simulation
    end

    def report
      choice_lengths = @choices.map(&:length)
      choice_lengths << 6
      max_choice_width = choice_lengths.max
      sorted_choices = sort_choices_by_result
      choice_lines = sorted_choices.map.with_index do |choice, i|
        next_choice = sorted_choices[i + 1]
        create_choice_report_line(choice, next_choice, max_choice_width)
      end
      'Most probable rounded fractions, fractions and 95% confidence' \
      " intervals:\n" + 'Choice'.ljust(max_choice_width) +
        "  Result    MPRF    MPF      CI(95%)      P(>↓)\n" +
        choice_lines.join("\n")
    end

    def progress_report
      space_size_ratio = space_size.to_f / @no_of_data_points
      if space_size_ratio > 10
        space_size_ratio = with_thousands_separator(space_size_ratio.round)
      else
        space_size_ratio = space_size_ratio.round(1)
      end
      "#{with_thousands_separator(@no_of_simulations)} simulations out of " \
      "#{with_thousands_separator(@no_of_data_points)} data" \
      " points, 1 / #{space_size_ratio} of search space size" \
      " (#{with_thousands_separator(space_size)})."
    end

    private

    def create_new_votes_distributions
      distributions = {}
      @choices.each do |choice|
        unless choice == OTHER
          distributions[choice] = CombinationsDistribution.new
          @ranges[choice].each do |value|
            distributions[choice][value] = 0.to_lf
          end
        end
      end
      distributions
    end

    def simulate(votes, data_point)
      combinations = 1.to_lf
      data_point.each do |choice, value|
        combinations *= BinomialsCache.binomial(value, @results[choice])
      end
      @combinations_sum += combinations
      data_point.each do |choice, value|
        votes[choice][value] += combinations unless choice == OTHER
      end
      @choices.each do |a|
        @choices.each do |b|
          if data_point[a] > data_point[b]
            @comparisons[a + '>' + b] += combinations
          end
        end
      end
    end

    def calculate_error_estimate(new_simulations)
      error_estimate = 0
      @choices.each do |choice|
        unless choice == OTHER
          mpv_new = calculate_most_probable_fraction(choice, new_simulations)
          mpv_old = calculate_most_probable_fraction(choice, @distributions)
          mpv_delta = (mpv_new - mpv_old).abs
          mprf_new = calculate_most_probable_rounded_fraction(choice, new_simulations)
          mprf_old = calculate_most_probable_rounded_fraction(choice, @distributions)
          mprf_delta = (mprf_new - mprf_old).abs
          error_estimate = [error_estimate, mpv_delta, mprf_delta].max
        end
      end
      error_estimate
    end

    def merge_distributions(distributions1, distributions2)
      merged_distributions = {}
      @choices.each do |choice|
        unless choice == OTHER
          merged_distributions[choice] = distributions1[choice] + \
                                         distributions2[choice]
        end
      end
      merged_distributions
    end

    def larger_than(a, b)
      probability = @comparisons[a + '>' + b] / @combinations_sum
      probability.mantissa * (10**probability.exponent)
    end

    def create_choice_report_line(choice, next_choice, max_choice_width)
      ci_values = @distributions[choice].confidence_interval(0.95)
      confidence_interval = ci_values.map { |x| x.to_f / @area.population_size }
      choice.ljust(max_choice_width) + '  ' + \
        six_char_percentage(result(choice)) + '  ' + \
        six_char_percentage(most_probable_rounded_fraction(choice)) + '  ' + \
        six_char_percentage(most_probable_fraction(choice)) + '  ' + \
        six_char_percentage(confidence_interval.first) + '–' + \
        six_char_percentage(confidence_interval.last) + '  ' + \
        (next_choice.nil? ? '      ' : six_char_percentage(larger_than(choice, next_choice)))
    end

    def calculate_most_probable_rounded_fraction(key, distributions)
      distributions[key].most_probable_rounded_fraction(@area.population_size)
    end

    def most_probable_rounded_fraction(key)
      if @no_of_simulations == 0
        nil
      else
        calculate_most_probable_rounded_fraction(key, @distributions)
      end
    end
  end
end
