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
      reset_cached_values
    end

    def reset_cached_values
      @error_estimate = nil
      @most_probable_value = nil
    end

    def combinations_for(value)
      dual_value = @population_size - value
      dual_number = @sample_size - @number
      value.large_float_binomial_by_product_of_divisions(@number) * \
      dual_value.large_float_binomial_by_product_of_divisions(dual_number)
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
      new_low_value = ((2.to_f * low_value + high_value) / 3).round
      new_high_value = ((2.to_f * high_value + low_value) / 3).round
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
      @error_estimate = estimate_error if @error_estimate.nil?
      @error_estimate
    end

    def estimate_error
      if @combinations.size == 1
        1
      elsif @combinations.size == @population_size
        0
      else
        0.0001 # TODO
      end
    end

    def most_probable_value
      if @most_probable_value.nil?
        @most_probable_value = calculate_most_probable_value
      end
      @most_probable_value
    end

    def calculate_most_probable_value
      @values[@combinations.each_with_index.max[1]]
    end
  end
end
