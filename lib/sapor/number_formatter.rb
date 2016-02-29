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
  # Module to format numbers.
  #
  module NumberFormatter
    def three_digits_percentage(number)
      if number >= 0.9995 || number < 0.000005
        sprintf('%.0f', number * 100) + '%'
      elsif number >= 0.09995
        sprintf('%.1f', number * 100) + '%'
      elsif number >= 0.009995
        sprintf('%.2f', number * 100) + '%'
      else
        sprintf('%.3f', number * 100) + '%'
      end
    end

    def six_char_percentage(number)
      sprintf('%5.1f', number * 100) + '%'
    end

    def with_thousands_separator(integer)
      integer.to_s.reverse.gsub(/...(?=.)/, '\&,').reverse
    end
  end
end
