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
  # Class representing a proportional electoral system with a second round of
  # leveling seats.
  #
  class LeveledProportional
    def initialize(last_election_result, last_detailed_election_result,
                   seat_distribution, leveling_seats, leveling_threshold)
      @proportional = Proportional.new(last_election_result,
                                       last_detailed_election_result,
                                       seat_distribution)
      @leveling_seats = leveling_seats
      @leveling_threshold = leveling_threshold
    end

    def project(simulation)
      result = @proportional.project(simulation)
      threshold = @leveling_threshold * simulation.values.inject(:+)
      quotients = []
      simulation.each_pair do |choice, votes|
        next if votes >= threshold
        denominators(result[choice]).each do |d|
          quotients << [choice, votes.to_f / d]
        end
      end
      seats = quotients.sort { |a, b| b.last <=> a.last }.map(&:first).slice(0, @leveling_seats)
      seats.each do |seat|
        if result.key?(seat)
          result[seat] += 1
        else
          result[seat] = 1
        end
      end
      result
    end

    private

    def denominators(seats)
      DhondtDenominators.get(seats + @leveling_seats).reverse_each.take(@leveling_seats)
    end
  end
end
