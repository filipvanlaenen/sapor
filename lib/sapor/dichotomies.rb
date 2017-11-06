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
  # Represents a set of dichotomies.
  #
  class Dichotomies
    include NumberFormatter

    def initialize(results, population_size, threshold = nil)
      sample_size = results.values.inject(:+)
      @dichotomy_hash = {}
      results.each_pair do |choice, number|
        @dichotomy_hash[choice] = Dichotomy.new(number, sample_size,
                                                population_size)
      end
      @threshold = threshold
    end

    def refine
      @dichotomy_hash.values.each(&:refine)
    end

    def error_estimate
      @dichotomy_hash.values.map(&:error_estimate).max
    end

    def confidence_interval_values(choice, level)
      @dichotomy_hash[choice].confidence_interval_values(level)
    end

    def report
      choice_lengths = @dichotomy_hash.keys.map(&:length)
      choice_lengths << 6
      max_choice_width = choice_lengths.max
      sorted_choices = sort_choices_by_label_and_mpv
      lines = sorted_choices.map do |choice|
        create_report_line(choice, @dichotomy_hash[choice], max_choice_width)
      end
      "Most probable fractions and 95% confidence intervals:\n" +
        'Choice'.ljust(max_choice_width) + '    MPF      CI(95%)' +
        (@threshold.nil? ? '' : '     P(≥' + (100 * @threshold).to_i.to_s +
         '%)') +
        "\n" + lines.join("\n")
    end

    def progress_report
      size = @dichotomy_hash.values.first.values.size
      "Number of data points: #{with_thousands_separator(size)}."
    end
    
    def size
      @dichotomy_hash.values.first.values.size
    end
    
    def write_outputs(filename)
      write_confidence_intervals(filename)
      write_probabilities(filename)
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
      @dichotomy_hash.keys.sort do |a, b|
        compare_choices_by_label_and_mpv(a, b)
      end
    end

    def create_report_line(choice, dichotomy, max_choice_width)
      choice.ljust(max_choice_width) + '  ' + \
        six_char_percentage(dichotomy.most_probable_fraction) + '  ' + \
        six_char_percentage(dichotomy.confidence_interval.first) + '–' + \
        six_char_percentage(dichotomy.confidence_interval.last) +
        (@threshold.nil? ? '' : '  ' +
         six_char_percentage(dichotomy.threshold_probability(@threshold)))
    end
    
    def write_confidence_intervals(filename)
      ci_filename = filename.gsub('.poll', '-dichotomies-confidence-intervals.psv')
      File.open(ci_filename, 'w') do |file| 
        file.puts('Choice | CI(80%) Bottom | CI(80%) Top | CI(90%) Bottom | CI(90%) Top | CI(95%) Bottom | CI(95%) Top | CI(99%) Bottom | CI(99%) Top') 
        @dichotomy_hash.each_pair do | choice, dichotomy |
          ci80 = dichotomy.confidence_interval(0.8)
          ci90 = dichotomy.confidence_interval(0.9)
          ci95 = dichotomy.confidence_interval(0.95)
          ci99 = dichotomy.confidence_interval(0.99)
          file.puts(choice + ' | ' + ci80.first.to_s + ' | ' + \
                    ci80.last.to_s + ' | ' + ci90.first.to_s + ' | ' + \
                    ci90.last.to_s + ' | ' + ci95.first.to_s + ' | ' + \
                    ci95.last.to_s + ' | ' + ci99.first.to_s + ' | ' + \
                    ci99.last.to_s)
        end
      end
    end
    
    def write_probabilities(filename)
      ci_filename = filename.gsub('.poll', '-dichotomies-probabilities.psv')
      File.open(ci_filename, 'w') do |file|
        intervals = Range.new(0, 1999).map{ | i | [i.to_f / 2000, (i + 1).to_f / 2000]}
        file.puts('Choice | ' + intervals.map{|a| "#{sprintf('%.4f', a.first)}–#{sprintf('%.4f', a.last)}"}.join(' | '))
        @dichotomy_hash.each_pair do | choice, dichotomy |
          unless choice == OTHER
            file.puts(choice + ' | ' + dichotomy.interval_probabilities(intervals).join(' | '))
          end
        end
      end
    end    
  end
end
