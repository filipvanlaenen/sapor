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
  # Superclass for any area (country, region, city, etc...) for which
  # polls can be registered.
  #
  class Area
    include Singleton

    def lines_to_election_results(lines)
      results = {}
      lines.each_line { |line| add_line_to_election_results(results, line) }
      results
    end

    def load_election_results(filename)
      dirname = File.dirname(File.expand_path(__FILE__))
      full_filename = File.expand_path(filename, dirname)
      lines = File.read(full_filename)
      lines_to_election_results(lines)
    end

    def summarize_election_results(election_results)
      summary = {}
      election_results.each_value do |local_results|
        add_local_results_to_summary(summary, local_results)
      end
      summary
    end

    private

    def add_line_to_election_results(results, line)
      return if line.strip.empty? || line.strip.start_with?('#')
      values = line.split('|')
      fail(ArgumentError, "Broken line: #{line}.") unless values.size.equal?(3)
      add_line_values_to_election_results(results, values)
    end

    def add_line_values_to_election_results(results, values)
      constituency = values[0].strip
      results[constituency] = {} unless results.key?(constituency)
      choice = values[1].strip
      votes = values[2].gsub(',', '').to_i
      if results[constituency].key?(choice)
        fail(ArgumentError, "Choice #{choice} appeared twice in " \
                            "constituency #{constituency}.")
      end
      results[constituency][choice] = votes
    end

    def add_local_results_to_summary(summary, local_results)
      local_results.each_pair do |choice, votes|
        if summary.key?(choice)
          summary[choice] += votes
        else
          summary[choice] = votes
        end
      end
    end
  end
end
