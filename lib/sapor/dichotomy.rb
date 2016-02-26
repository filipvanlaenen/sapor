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
  # Represents a dichotomy.
  #
  class Dichotomy
    STANDARD_CONFIDENCE_LEVELS = [0.8, 0.9, 0.95, 0.99]
    DEFAULT_CONFIDENCE_LEVEL = 0.95

    def initialize(number, sample_size, population_size)
      @number = number
      @sample_size = sample_size
      @population_size = population_size
      @distribution = CombinationsDistribution.new
      middle = @population_size / 2
      @distribution[middle] = combinations_for(middle)
      @previous_distribution = @distribution.dup
    end

    def combinations(value)
      @distribution[value]
    end

    def confidence_interval(level = DEFAULT_CONFIDENCE_LEVEL)
      value_confidence_interval(level).map { |x| x.to_f / @population_size }
    end

    def confidence_interval_values(level = DEFAULT_CONFIDENCE_LEVEL)
      @distribution.confidence_interval_values(level)
    end

    def error_estimate
      estimate_error
    end

    def most_probable_fraction
      most_probable_value.to_f / @population_size
    end

    def most_probable_value
      @distribution.most_probable_value
    end

    def refine
      @previous_distribution = @distribution.dup
      new_values = find_refinement_values
      new_values.each do |value|
        @distribution[value] = combinations_for(value)
      end
    end

    def threshold_probability(threshold)
      @distribution.threshold_probability(threshold, @population_size)
    end

    def value_confidence_interval(level = DEFAULT_CONFIDENCE_LEVEL)
      @distribution.confidence_interval(level, @population_size)
    end

    def values
      @distribution.values
    end

    private

    def combinations_for(value)
      dual_value = @population_size - value
      dual_number = @sample_size - @number
      if value < @number || dual_value < dual_number
        0.to_lf
      else
        BinomialsCache.binomial(value, @number) * \
          BinomialsCache.binomial(dual_value, dual_number)
      end
    end

    def find_refinement_value_at_bottom
      bottom = values.min
      if bottom == 0
        []
      else
        [(bottom.to_f / 3).round]
      end
    end

    def find_refinement_values_between(low, high)
      new_low = ((2 * low + high).to_f / 3).round
      new_high = ((2 * high + low).to_f / 3).round
      refinement_values = []
      refinement_values << new_high unless new_high == high
      refinement_values << new_low unless new_low == new_high || new_low == low
      refinement_values
    end

    def find_refinement_values_in_between
      sorted_values = values.sort
      refinement_values = (0..(@distribution.size - 2)).to_a.map do |i|
        find_refinement_values_between(sorted_values[i], sorted_values[i + 1])
      end
      refinement_values.flatten
    end

    def find_refinement_value_at_top
      top = values.max
      if top == @population_size
        []
      else
        [((2.to_f * @population_size + top) / 3).round]
      end
    end

    def find_refinement_values
      find_refinement_value_at_bottom + find_refinement_values_in_between +
        find_refinement_value_at_top
    end

    def previous_confidence_interval(level)
      @previous_distribution.confidence_interval(level, @population_size).map do |x|
        x.to_f / @population_size
      end
    end

    def previous_most_probable_fraction
      @previous_distribution.most_probable_value.to_f / @population_size
    end

    def estimate_error
      if @distribution.size == @population_size + 1
        0
      else
        ci_error_estimates = STANDARD_CONFIDENCE_LEVELS.map do |l|
          ci = confidence_interval(l)
          pci = previous_confidence_interval(l)
          [(ci.first - pci.first).abs, (ci.last - pci.last).abs].max
        end
        [1.to_f / @distribution.size,
         (most_probable_fraction - previous_most_probable_fraction).abs,
         ci_error_estimates.max].max
      end
    end
  end
end
