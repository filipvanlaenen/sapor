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

# Library namespace
module Sapor
  def self.analyze(filename)
    Poll.from_file(filename).analyze
  end
end

require 'sapor/percentage_formatter'
require 'sapor/dichotomies'
require 'sapor/dichotomy'
require 'sapor/log4r_logger'
require 'sapor/log_facade'
require 'sapor/poll'
