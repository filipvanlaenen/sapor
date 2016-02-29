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

module Sapor
  #
  # Represents the distribution of combinations over a set of values. This is
  # basically a simple hash with some helper methods for the Sapor domain.
  #
  class CombinationsDistribution
    def initialize
      @distribution = {}
    end

    def []=(value, combinations)
      @distribution[value] = combinations
    end

    def [](value)
      @distribution[value]
    end

    def +(other)
      sum = CombinationsDistribution.new
      @distribution.keys.each { |key| sum[key] = self[key] }
      other.values.each do |key|
        if self[key].nil?
          sum[key] = other[key]
        else
          sum[key] += other[key]
        end
      end
      sum
    end

    def empty?
      @distribution.empty?
    end

    def value_threshold_probability(threshold_value)
      total = @distribution.values.inject(:+)
      distribution_over_threshold = @distribution.select do |k, _|
        k >= threshold_value
      end
      if distribution_over_threshold.empty?
        0
      else
        over_threshold = distribution_over_threshold.values.inject(:+)
        probability = over_threshold / total
        probability.mantissa * (10**probability.exponent)
      end
    end

    def threshold_probability(threshold, population_size)
      value_threshold_probability(population_size * threshold)
    end

    def size
      @distribution.size
    end

    def values
      @distribution.keys
    end

    def most_probable_value
      @distribution.max { |a, b| a.last <=> b.last }[0]
    end

    # Given all fractions rounded to one decimal, returns the one that has the
    # highest probability.
    def most_probable_rounded_fraction(population_size)
      rf_combinations = \
      calculate_rounded_fractions_combinations(population_size)
      max_probability = rf_combinations.values.max
      opt_rfs = rf_combinations.reject { |_, v| v < max_probability }.keys
      opt_rfs.sort[opt_rfs.size / 2]
    end

    def confidence_interval(level, population_size = nil)
      combinations_sum = @distribution.values.inject(:+)
      one_side_level = (1 - level) / 2
      one_side_threshold = combinations_sum * one_side_level
      bottom = find_confidence_interval_bottom(one_side_threshold,
                                               population_size)
      top = find_confidence_interval_top(one_side_threshold, population_size)
      [bottom, top]
    end

    def confidence_interval_values(level)
      interval = confidence_interval(level)
      @distribution.keys.reject do |value|
        value < interval.first || value > interval.last
      end
    end

    private

    def confidence_interval_index(sorted_combinations, one_side_threshold)
      i = 0
      sum_to_i = sorted_combinations[i][1]
      while sum_to_i < one_side_threshold
        i += 1
        sum_to_i += sorted_combinations[i][1]
      end
      i
    end

    def find_confidence_interval_bottom(one_side_threshold, population_size)
      sorted_combinations = @distribution.sort
      i = confidence_interval_index(sorted_combinations, one_side_threshold)
      if i == 0
        population_size.nil? ? sorted_combinations[0][0] : 0
      else
        (sorted_combinations[i - 1][0] + sorted_combinations[i][0] + 1) / 2
      end
    end

    def find_confidence_interval_top(one_side_threshold, population_size)
      sorted_combinations = @distribution.sort.reverse
      i = confidence_interval_index(sorted_combinations, one_side_threshold)
      if i == 0
        population_size.nil? ? sorted_combinations[0][0] : population_size
      else
        (sorted_combinations[i - 1][0] + sorted_combinations[i][0]) / 2
      end
    end

    def calculate_rounded_fractions_combinations(population_size)
      sorted_combinations = @distribution.sort
      combinations_by_interval = []
      sorted_combinations.each_with_index do |c, ix|
        if ix == 0
          bottom = 0
        else
          bottom = combinations_by_interval[ix - 1].first.last + 1
        end
        if ix == sorted_combinations.size - 1
          top = population_size
        else
          top = (sorted_combinations[ix].first + sorted_combinations[ix + 1].first) / 2
        end
        combinations_by_interval << [[bottom, top], c.last]
      end
      result = Hash.new(0.to_lf)
      combinations_by_interval.each do |i_c|
        bottom = (i_c.first.first.to_f / population_size).round(3)
        top = (i_c.first.last.to_f / population_size).round(3)
        ix = bottom
        loop do
          interval_bottom = ((ix - 0.0005) * population_size).ceil
          interval_top = ((ix + 0.0005) * population_size).ceil - 1
          if (((interval_bottom + interval_top) / 2).to_f / population_size).round(3) == ix
            low = [i_c.first.first, interval_bottom].max
            high = [i_c.first.last, interval_top].min
            result[ix] += i_c.last * (high + 1 - low)
          end
          break if ix == top
          ix = (ix + 0.001).round(3)
        end
      end
      result
    end
  end
end
