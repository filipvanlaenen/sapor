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
  # Represents a polychotomy for the election of representatives.
  #
  class RepresentativesPolychotomy < Polychotomy
    include NumberFormatter

    def initialize(results, area, dichotomies, max_error)
      @coalitions = area.coalitions
      super(results, area, dichotomies, max_error)
      @seats = create_new_seats_distributions
    end

    def refine
      no_of_new_simulations = 0
      new_votes = create_new_votes_distributions
      new_seats = create_new_seats_distributions
      while @no_of_data_points == 0 || no_of_new_simulations == 0 ||
            no_of_new_simulations < @no_of_simulations
        no_of_new_simulations += try_next_data_point(new_votes, new_seats)
      end
      unless @no_of_simulations == 0
        @error_estimate = calculate_error_estimate(new_votes)
      end
      @votes = merge_distributions(@votes, new_votes)
      @seats = merge_distributions(@seats, new_seats)
      @no_of_simulations += no_of_new_simulations
    end

    def try_next_data_point(new_votes, new_seats)
      data_point = next_data_point
      if data_point[OTHER] >= 0
        simulate(new_votes, new_seats, data_point)
        new_simulation = 1
      else
        new_simulation = 0
      end
      @no_of_data_points += 1
      new_simulation
    end

    def report
      choice_lengths = @choices.map(&:length)
      choice_lengths << 6
      max_choice_width = choice_lengths.max
      max_seats_width = @area.no_of_seats.to_s.size
      sorted_choices = sort_choices_by_result
      choice_lines = sorted_choices.map.with_index do |choice, i|
        next_choice = sorted_choices[i + 1]
        create_choice_report_line(choice, next_choice, max_choice_width, max_seats_width)
      end
      coalition_lengths = @coalitions.map { |coalition| coalition_label(coalition).length }
      coalition_lengths << 6
      max_coalition_width = coalition_lengths.max
      sorted_coalitions = sort_coalitions_by_result
      coalition_lines = sorted_coalitions.map do |coalition|
        create_coalition_report_line(coalition, max_coalition_width, max_seats_width)
      end
      'Most probable rounded fractions, fractions and 95% confidence' \
      " intervals:\n" + 'Choice'.ljust(max_choice_width) +
        "  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats\n" +
        choice_lines.join("\n") + "\n" +
        'Coalition'.ljust(max_coalition_width) + '  Result    MPRF    MPF' \
        "      CI(95%)     P(>50%)  Seats  P(>50%)\n" +
        coalition_lines.join("\n")
    end

    def progress_report
      space_size_ratio = space_size.to_f / @no_of_data_points
      if space_size_ratio > 10
        space_size_ratio = with_thousands_separator(space_size_ratio.round)
      else
        space_size_ratio = space_size_ratio.round(1)
      end
      "#{with_thousands_separator(@no_of_simulations)} simulations out of " \
      "#{with_thousands_separator(@no_of_data_points)} data" \
      " points, 1 / #{space_size_ratio} of search space size" \
      " (#{with_thousands_separator(space_size)})."
    end

    private

    def create_new_seats_distributions
      seats = {}
      @choices.each do |choice|
        seats[choice] = CombinationsDistribution.new
        Range.new(0, @area.no_of_seats).each do |value|
          seats[choice][value] = 0.to_lf
        end
      end
      @coalitions.each do |coalition|
        seats[coalition] = CombinationsDistribution.new
        Range.new(0, @area.no_of_seats).each do |value|
          seats[coalition][value] = 0.to_lf
        end
      end
      seats
    end

    def create_new_votes_distributions
      votes = {}
      @choices.each do |choice|
        unless choice == OTHER
          votes[choice] = CombinationsDistribution.new
          @ranges[choice].each do |value|
            votes[choice][value] = 0.to_lf
          end
        end
      end
      @coalitions.each do |coalition|
        votes[coalition] = CombinationsDistribution.new
      end
      votes
    end

    def simulate(votes, seats, data_point)
      combinations = 1.to_lf
      data_point.each do |choice, value|
        combinations *= BinomialsCache.binomial(value, @results[choice])
      end
      @combinations_sum += combinations
      data_point.each do |choice, value|
        votes[choice][value] += combinations unless choice == OTHER
      end
      @choices.each do |a|
        @choices.each do |b|
          if data_point[a] > data_point[b]
            @comparisons[a + '>' + b] += combinations
          end
        end
      end
      @coalitions.each do |coalition|
        coalition_value = coalition.map { |choice| data_point.key?(choice) ? data_point[choice] : 0 }.inject(:+)
        if votes[coalition][coalition_value].nil?
          votes[coalition][coalition_value] = combinations
        else
          votes[coalition][coalition_value] += combinations
        end
      end
      projection = @area.seats(data_point)
      @choices.each do |choice|
        if projection.key?(choice)
          seats[choice][projection[choice]] += combinations
        else
          seats[choice][0] += combinations
        end
      end
      @coalitions.each do |coalition|
        coalition_value = coalition.map { |choice| projection.key?(choice) ? projection[choice] : 0 }.inject(:+)
        if seats[coalition][coalition_value].nil?
          seats[coalition][coalition_value] = combinations
        else
          seats[coalition][coalition_value] += combinations
        end
      end
    end

    def calculate_error_estimate(new_simulations)
      error_estimate = 0
      @choices.each do |choice|
        unless choice == OTHER
          mpv_new = calculate_most_probable_fraction(choice, new_simulations)
          mpv_old = calculate_most_probable_fraction(choice, @votes)
          delta = (mpv_new - mpv_old).abs
          error_estimate = [error_estimate, delta].max
        end
      end
      error_estimate
    end

    def merge_distributions(distributions1, distributions2)
      merged_distributions = {}
      @choices.each do |choice|
        unless choice == OTHER
          merged_distributions[choice] = distributions1[choice] + \
                                         distributions2[choice]
        end
      end
      @coalitions.each do |coalition|
        merged_distributions[coalition] = distributions1[coalition] + \
                                          distributions2[coalition]
      end
      merged_distributions
    end

    def coalition_label(coalition)
      coalition.sort.join(' + ')
    end

    def sort_coalitions_by_result
      @coalitions.sort do |a, b|
        comparison = result(b) <=> result(a)
        if comparison == 0
          coalition_label(a) <=> coalition_label(b)
        else
          comparison
        end
      end
    end

    def coalition_result(coalition)
      coalition.map { |choice| @results[choice].to_f }.inject(:+) / @results.values.inject(:+)
    end

    def create_choice_report_line(choice, next_choice, max_choice_width, max_seats_width)
      ci_values = @votes[choice].confidence_interval(0.95)
      confidence_interval = ci_values.map { |x| x.to_f / @area.population_size }
      ci_seats = @seats[choice].confidence_interval(0.95)
      choice.ljust(max_choice_width) + '  ' + \
        six_char_percentage(result(choice)) + '  ' + \
        six_char_percentage(most_probable_rounded_fraction(choice)) + '  ' + \
        six_char_percentage(most_probable_fraction(choice)) + '  ' + \
        six_char_percentage(confidence_interval.first) + '–' + \
        six_char_percentage(confidence_interval.last) + '  ' + \
        (next_choice.nil? ? '      ' : six_char_percentage(larger_than(choice, next_choice))) + '  ' + \
        (max_seats_width == 1 ? ' ' : '') + \
        ci_seats.first.to_s.rjust(max_seats_width) + '–' + \
        ci_seats.last.to_s.rjust(max_seats_width)
    end

    def create_coalition_report_line(coalition, max_coalition_width, max_seats_width)
      ci_values = @votes[coalition].confidence_interval(0.95)
      majority_votes_probability = @votes[coalition].threshold_probability(0.5, @area.population_size)
      confidence_interval = ci_values.map { |x| x.to_f / @area.population_size }
      ci_seats = @seats[coalition].confidence_interval(0.95)
      seats_majority = 1 + @area.no_of_seats / 2
      majority_seats_probability = @seats[coalition].value_threshold_probability(seats_majority)
      coalition_label(coalition).ljust(max_coalition_width) + '  ' + \
        six_char_percentage(coalition_result(coalition)) + '  ' + \
        six_char_percentage(most_probable_rounded_fraction(coalition)) + '  ' + \
        six_char_percentage(most_probable_fraction(coalition)) + '  ' + \
        six_char_percentage(confidence_interval.first) + '–' + \
        six_char_percentage(confidence_interval.last) + '   ' + \
        six_char_percentage(majority_votes_probability) + '  ' + \
        (max_seats_width == 1 ? ' ' : '') + \
        ci_seats.first.to_s.rjust(max_seats_width) + '–' + \
        ci_seats.last.to_s.rjust(max_seats_width) + '    ' + \
        six_char_percentage(majority_seats_probability)
    end
  end
end