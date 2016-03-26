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
  # Superclass for polychotomies.
  #
  class Polychotomy
    attr_reader :error_estimate, :no_of_data_points, :no_of_simulations

    def most_probable_fraction(key)
      if @no_of_simulations == 0
        nil
      else
        calculate_most_probable_fraction(key, @distributions)
      end
    end

    def most_probable_value(key)
      if @no_of_simulations == 0
        nil
      else
        @distributions[key].most_probable_value
      end
    end

    def range(choice)
      @ranges[choice]
    end

    def space_size
      @enum.size
    end

    private

    def calculate_most_probable_fraction(key, distributions)
      distributions[key].most_probable_value.to_f / @area.population_size
    end

    def extract_ranges_from_dichotomies(dichotomies, max_error)
      ranges = {}
      level = 1 - (max_error**2)
      @choices.each do |choice|
        unless choice == OTHER
          ranges[choice] = dichotomies.confidence_interval_values(choice,
                                                                  level).sort
        end
      end
      ranges
    end
  end
end
