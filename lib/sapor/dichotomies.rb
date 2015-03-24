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
    include PercentageFormatter

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

    def confidence_interval_values(choice, level)
      @dichotomy_hash[choice].confidence_interval_values(level)
    end

    def report
      choice_lengths = @dichotomy_hash.keys.map { | choice | choice.length }
      choice_lengths << 6
      max_choice_width = choice_lengths.max
      sorted_choices = sort_choices_by_label_and_mpv
      lines = sorted_choices.map do | choice |
        create_report_line(choice, @dichotomy_hash[choice], max_choice_width)
      end
      "Most probable fractions and 95% confidence intervals:\n" +
      'Choice'.ljust(max_choice_width) + "    MPF      CI(95%)\n" +
      lines.join("\n")
    end

    def progress_report
      "Number of data points: #{@dichotomy_hash.values.first.values.size}."
    end

    private

    def compare_choices_by_label_and_mpv(a, b)
      if a == OTHER
        1
      elsif b == OTHER
        -1
      else
        mpv_a = @dichotomy_hash[a].most_probable_value
        mpv_b = @dichotomy_hash[b].most_probable_value
        mpv_a == mpv_b ? a <=> b : mpv_b <=> mpv_a
      end
    end

    def sort_choices_by_label_and_mpv
      @dichotomy_hash.keys.sort do | a, b |
        compare_choices_by_label_and_mpv(a, b)
      end
    end

    def create_report_line(choice, dichotomy, max_choice_width)
      choice.ljust(max_choice_width) + '  ' + \
      as_table_percentage(dichotomy.most_probable_fraction) + '  ' + \
      as_table_percentage(dichotomy.confidence_interval.first) + '–' + \
      as_table_percentage(dichotomy.confidence_interval.last)
    end
  end
end
