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
    attr_reader :error_estimate, :no_of_data_points, :no_of_simulations

    def initialize(choices, dichotomies, max_error)
      @choices = choices
      @ranges = extract_ranges_from_dichotomies(dichotomies, max_error)
      @choices.sort! do | a, b |
        @ranges[a].size <=> @ranges[b].size
      end
      @incrementers = create_incrementers
      @counters = initialize_counters
      @no_of_simulations = 0
      @no_of_data_points = 0
      @error_estimate = 1.0
    end

    def extract_ranges_from_dichotomies(dichotomies, max_error)
      ranges = {}
      level = 1 - (max_error**2)
      @choices.each do | choice |
        ranges[choice] = dichotomies.confidence_interval_values(choice, level)
      end
      ranges
    end

    def initialize_counters
      counters = {}
      @choices.each do | choice |
        counters[choice] = 0
      end
      counters
    end

    def create_incrementers
      incrementers = {}
      incrementer = 0
      @choices.each do | choice |
        incrementer = next_incrementer(incrementer)
        incrementers[choice] = incrementer
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

    def incrementer(choice)
      @incrementers[choice]
    end

    def increment_counters
      @choices.each do | choice |
        @counters[choice] += @incrementers[choice]
        @counters[choice] = @counters[choice].modulo(@ranges[choice].size)
      end
    end

    def all_counters_back_at_zero?
      @counters.max == 0
    end

    def refine
      no_of_new_simulations = 0
      increment_counters
      while no_of_new_simulations < 1 ||
            (no_of_new_simulations < @no_of_simulations &&
             !all_counters_back_at_zero?)
        no_of_new_simulations += 1
        @no_of_data_points += 1
      end
      @no_of_simulations += no_of_new_simulations
    end

    def report
    end
  end
end
