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
  # Builder to create Log4rLoggers.
  #
  class Log4rLoggerBuilder
    def create_logger
      Log4rLogger.new
    end
  end

  require 'rubygems'
  require 'log4r'
  #
  # Logger using Log4r.
  #
  class Log4rLogger
    def initialize
      @logger = Log4r::Logger.new 'stdout'
      stdout_outputter = Log4r::Outputter.stdout
      @logger.outputters = stdout_outputter
      stdout_format = Log4r::PatternFormatter.new(pattern: '%d %l: %m')
      stdout_outputter.formatter = stdout_format
      @logger.level = Log4r::INFO
    end

    def info(message)
      @logger.info(message)
    end
  end
end
