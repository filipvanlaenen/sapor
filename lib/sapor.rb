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

# Library namespace
module Sapor
  def self.analyze(filename)
    Poll.from_file(filename).analyze
  end
end

require 'sapor/number_formatter'
require 'sapor/dichotomies'
require 'sapor/combinations_distribution'
require 'sapor/dichotomy'
require 'sapor/log4r_logger'
require 'sapor/log_facade'
require 'sapor/pseudorandom_multirange_enumerator'
require 'sapor/binomials_cache'
require 'sapor/polychotomy'
require 'sapor/referendum_polychotomy'
require 'sapor/representatives_polychotomy'
require 'sapor/first_past_the_post'
require 'sapor/denominators'
require 'sapor/single_district_proportional'
require 'sapor/multi_district_proportional'
require 'sapor/multi_district_leveled_proportional'
require 'sapor/regional_data/area'
require 'sapor/regional_data/belgium'
require 'sapor/regional_data/catalonia'
require 'sapor/regional_data/flanders'
require 'sapor/regional_data/france'
require 'sapor/regional_data/greece'
require 'sapor/regional_data/norway'
require 'sapor/regional_data/norwegian_municipality'
require 'sapor/regional_data/united_kingdom'
require 'sapor/regional_data/utopia'
require 'sapor/poll'
