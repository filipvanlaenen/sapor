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
  # The regional data for the United Kingdom.
  #
  class UnitedKingdom
    include Singleton

    def area_code
      'UK'
    end

    def population_size
      # Source: BBC News Election 2010 Results, retrieved on 3 April 2015.
      # URL: http://news.bbc.co.uk/2/shared/election2010/results/
      29_691_380
    end
  end
end
