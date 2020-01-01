# encoding: utf-8
#
# Statistical Analysis of Polling Results (SAPoR)
# Copyright (C) 2020 Filip van Laenen <f.a.vanlaenen@ieee.org>
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
  # Caches binomials.
  #
  class BinomialsCache
    include Singleton

    def initialize
      @cache = {}
    end

    def self.binomial(k, n)
      instance.get_binomial(k, n)
    end

    def get_binomial(k, n)
      @cache[n] = {} unless @cache.key?(n)
      unless @cache[n].key?(k)
        @cache[n][k] = k.large_float_binomial_by_product_of_divisions(n)
      end
      @cache[n][k]
    end
  end
end
