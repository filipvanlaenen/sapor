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

require 'large_binomials'

module Sapor
  #
  # Represents a dichotomy.
  #
  class Dichotomy
    attr_reader :combinations, :values

    def initialize(number, sample_size, population_size)
      @number = number
      @sample_size = sample_size
      @population_size = population_size
      @values = [@population_size / 2]
      @combinations = [combinations_for(@values.first)]
    end

    def combinations_for(value)
      dual_value = @population_size - value
      dual_number = @sample_size - @number
      if value < @number || dual_value < dual_number
        0.to_lf
      else
        value.large_float_binomial_by_product_of_divisions(@number) * \
        dual_value.large_float_binomial_by_product_of_divisions(dual_number)
      end
    end

    def insert_new_value(position, value)
      @values.insert(position, value)
      @combinations.insert(position, combinations_for(value))
    end

    def insert_value_at_top
      unless @values.last == @population_size
        new_value = ((2.to_f * @population_size + @values.last) / 3).round
        insert_new_value(@values.size, new_value)
      end
    end

    def insert_value_at_bottom
      unless @values.first == 0
        new_value = (@values.first.to_f / 3).round
        insert_new_value(0, new_value)
      end
    end

    def insert_values_at(i)
      low_value = @values[i]
      high_value = @values[i + 1]
      new_low_value = ((2 * low_value + high_value).to_f / 3).round
      new_high_value = ((2 * high_value + low_value).to_f / 3).round
      unless new_high_value == high_value
        insert_new_value(i + 1, new_high_value)
      end
      unless new_low_value == new_high_value || new_low_value == low_value
        insert_new_value(i + 1, new_low_value)
      end
    end

    def insert_values_in_between
      (0..(@values.size - 2)).to_a.reverse.each { | i | insert_values_at(i) }
    end

    def refine
      insert_values_in_between
      insert_value_at_top
      insert_value_at_bottom
    end

    def error_estimate
      estimate_error
    end

    def estimate_error
      if @values.size == @population_size + 1
        0
      else
        1.to_f / @values.size
      end
    end

    def most_probable_value
      calculate_most_probable_value
    end

    def calculate_most_probable_value
      @values[@combinations.each_with_index.max[1]]
    end

    def most_probable_fraction
      most_probable_value.to_f / @population_size
    end

    def confidence_interval(level = 0.95)
      value_confidence_interval(level).map { | x | x.to_f / @population_size }
    end

    def value_confidence_interval(level = 0.95)
      calculate_value_confidence_interval(level)
    end

    def find_confidence_interval_bottom_index(rest_combinations)
      bottom_sum = 0.to_lf
      bottom_index = -1
      while bottom_sum < rest_combinations
        bottom_index += 1
        bottom_sum = @combinations[bottom_index] + bottom_sum
      end
      bottom_index
    end

    def calculate_confidence_interval_bottom(rest_combinations)
      bottom_index = find_confidence_interval_bottom_index(rest_combinations)
      if bottom_index == 0
        0
      else
        (@values[bottom_index - 1] + @values[bottom_index] + 1) / 2
      end
    end

    def find_confidence_interval_top_index(rest_combinations)
      top_sum = 0.to_lf
      top_index = @values.size
      while top_sum < rest_combinations
        top_index -= 1
        top_sum = @combinations[top_index] + top_sum
      end
      top_index
    end

    def calculate_confidence_interval_top(rest_combinations)
      top_index = find_confidence_interval_top_index(rest_combinations)
      if top_index == @values.size - 1
        @population_size
      else
        (@values[top_index] + @values[top_index + 1]) / 2
      end
    end

    def calculate_value_confidence_interval(level)
      if @values.size == 1
        [0, @population_size]
      else
        rest = (1.to_f - level) / 2
        all_combinations = combinations.inject(:+)
        rest_combinations = all_combinations * rest
        bottom = calculate_confidence_interval_bottom(rest_combinations)
        top = calculate_confidence_interval_top(rest_combinations)
        [bottom, top]
      end
    end
  end
end
