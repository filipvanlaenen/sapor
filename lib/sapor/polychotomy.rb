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
  # Superclass for polychotomies.
  #
  class Polychotomy
    attr_reader :error_estimate, :no_of_data_points, :no_of_simulations

    def initialize(results, area, dichotomies, max_error)
      initialize_static_information(results, area, dichotomies, max_error)
      initialize_calculation_information
    end

    def most_probable_fraction(key)
      if @no_of_simulations == 0
        nil
      else
        calculate_most_probable_fraction(key, @votes)
      end
    end

    def most_probable_value(key)
      if @no_of_simulations == 0
        nil
      else
        @votes[key].most_probable_value
      end
    end

    def range(choice)
      @ranges[choice]
    end

    def space_size
      @enum.size
    end

    private

    def calculate_most_probable_fraction(key, votes)
      votes[key].most_probable_value.to_f / @area.population_size
    end

    def calculate_most_probable_rounded_fraction(key, votes)
      votes[key].most_probable_rounded_fraction(@area.population_size)
    end

    def create_comparisons(choices)
      comparisons = {}
      choices.each do |a|
        choices.each do |b|
          comparisons[a + '>' + b] = 0.to_lf
        end
      end
      comparisons
    end

    def create_enumerator(ranges)
      range_sizes = ranges.values.map(&:size)
      PseudoRandomMultiRangeEnumerator.new(range_sizes).each
    end

    def extract_ranges_from_dichotomies(dichotomies, max_error)
      ranges = {}
      level = 1 - (max_error**2)
      @choices.each do |choice|
        unless choice == OTHER
          ranges[choice] = dichotomies.confidence_interval_values(choice,
                                                                  level).sort
        end
      end
      ranges
    end

    def initialize_calculation_information
      @enum = create_enumerator(@ranges)
      @no_of_simulations = 0
      @no_of_data_points = 0
      @combinations_sum = 0.to_lf
      @error_estimate = 1.0
      @votes = create_new_votes_distributions
    end

    def initialize_static_information(results, area, dichotomies, max_error)
      @results = results
      @area = area
      @choices = results.keys
      @comparisons = create_comparisons(@choices)
      @ranges = extract_ranges_from_dichotomies(dichotomies, max_error)
    end

    def larger_than(a, b)
      probability = @comparisons[a + '>' + b] / @combinations_sum
      probability.mantissa * (10**probability.exponent)
    end

    def most_probable_rounded_fraction(key)
      if @no_of_simulations == 0
        nil
      else
        calculate_most_probable_rounded_fraction(key, @votes)
      end
    end

    def next_data_point
      indexes = @enum.next
      data_point = {}
      indexes.each_with_index do |ix, i|
        data_point[@ranges.keys[i]] = @ranges.values[i][ix]
      end
      data_point[OTHER] = @area.population_size - data_point.values.inject(:+)
      data_point
    end

    def result(choice)
      @results[choice].to_f / @results.values.inject(:+)
    end

    def sort_choices_by_result
      sorted_choices = @choices.reject { |choice| choice == OTHER }
      sorted_choices.sort do |a, b|
        comparison = result(b) <=> result(a)
        if comparison == 0
          a <=> b
        else
          comparison
        end
      end
    end
  end
end
