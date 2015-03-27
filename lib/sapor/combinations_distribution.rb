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
      @distribution.keys.each { | key | sum[key] = self[key] }
      other.values.each do | key |
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

    def size
      @distribution.size
    end

    def values
      @distribution.keys
    end

    def most_probable_value
      @distribution.max { | a, b | a.last <=> b.last }[0]
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
      @distribution.keys.reject do | value |
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
  end
end
