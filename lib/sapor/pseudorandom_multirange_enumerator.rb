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
  # A pseudo-random multi-range enumerator. It uses prime numbers to iterate
  # in a pseudo-random way through the hyper-rectangle with dimensions
  # provided as the constructor parameter. If a suitable set of primes can't
  # be found, the constructor will raise an exception.
  #
  class PseudoRandomMultiRangeEnumerator
    def initialize(dimensions)
      @dimensions = dimensions
      @incrementers = calculate_incrementers
    end

    def each
      return enum_for { @dimensions.inject(:*) } unless block_given?
      counters = Array.new(@dimensions.size, 0)
      loop do
        yield(counters.dup)
        @incrementers.each_with_index do |incrementer, i|
          counters[i] = (counters[i] + incrementer).modulo(@dimensions[i])
        end
        break if all_zeros?(counters)
      end
    end

    private

    def calculate_incrementers
      incrementers = []
      incrementer = 0
      calculate_incrementer_indexes.each do |i|
        incrementer = next_incrementer(incrementer)
        if @dimensions[i] < incrementer
          fail(ArgumentError, 'Could not construct suitable incrementers.')
        end
        incrementers[i] = incrementer
      end
      incrementers
    end

    def calculate_incrementer_indexes
      @dimensions.each_with_index.sort.map(&:last)
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
      Prime.prime?(number)
    end

    def relative_prime?(incrementer)
      @dimensions.map { |dimension| dimension.gcd(incrementer) }.max == 1
    end

    def all_zeros?(counters)
      counters.max == 0
    end
  end
end
