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
  # Represents a set of options.
  #
  class Options
    DEFAULT_MAX_ERROR = 0.001
    DEFAULT_MAX_POLYCHOTOMY_ITERATIONS = 2 ** 25
    DEFAULT_MIN_DICHOTOMIES_ITERATIONS = 0
    DEFAULT_MIN_POLYCHOTOMY_ITERATIONS = 2 ** 20

    MAX_ERROR_KEY = 'emx'
    MAX_POLYCHOTOMY_ITERATIONS_KEY = 'pmx'
    MIN_DICHOTOMIES_ITERATIONS_KEY = 'dmn'
    MIN_POLYCHOTOMY_ITERATIONS_KEY = 'pmn'
    
    FLOAT_OPTIONS = [MAX_ERROR_KEY]
    INTEGER_OPTIONS = [MAX_POLYCHOTOMY_ITERATIONS_KEY, MIN_DICHOTOMIES_ITERATIONS_KEY, MIN_POLYCHOTOMY_ITERATIONS_KEY]

    def initialize(arguments)
      @hash = { MAX_ERROR_KEY => DEFAULT_MAX_ERROR,
        MAX_POLYCHOTOMY_ITERATIONS_KEY => DEFAULT_MAX_POLYCHOTOMY_ITERATIONS,
        MIN_DICHOTOMIES_ITERATIONS_KEY => DEFAULT_MIN_DICHOTOMIES_ITERATIONS,
        MIN_POLYCHOTOMY_ITERATIONS_KEY => DEFAULT_MIN_POLYCHOTOMY_ITERATIONS }
      arguments.each do | argument |
        key_value = argument[1..-1].split('=')
        key = key_value.first
        value = key_value.last
        if INTEGER_OPTIONS.include?(key)
          value = value.to_i
        elsif FLOAT_OPTIONS.include?(key)
          value = value.to_f
        end
        @hash[key] = value
      end
    end
    
    def max_error
      @hash[MAX_ERROR_KEY]
    end
    
    def max_polychotomy_iterations
      @hash[MAX_POLYCHOTOMY_ITERATIONS_KEY]
    end

    def min_dichotomies_iterations
      @hash[MIN_DICHOTOMIES_ITERATIONS_KEY]
    end

    def min_polychotomy_iterations
      @hash[MIN_POLYCHOTOMY_ITERATIONS_KEY]
    end
  end
end
