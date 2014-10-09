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
  # Represents a set of dichotomies.
  #
  class Dichotomies
    def initialize(results, population_size)
      sample_size = results.values.inject(:+)
      @dichotomy_hash = {}
      results.each_pair do |choice, number|
        @dichotomy_hash[choice] = Dichotomy.new(number, sample_size,
                                                population_size)
      end
    end

    def refine
      @dichotomy_hash.values.each { | dichotomy | dichotomy.refine }
    end

    def error_estimate
      dichotomies = @dichotomy_hash.values
      error_estimates = dichotomies.map do | dichotomy |
        dichotomy.error_estimate
      end
      error_estimates.max
    end

    def most_probable_value(choice)
      @dichotomy_hash[choice].most_probable_value
    end

    def most_probable_fraction(choice)
      @dichotomy_hash[choice].most_probable_fraction
    end

    def confidence_interval(choice, level)
      @dichotomy_hash[choice].confidence_interval(level)
    end
  end
end
