#
# Statistical Analysis of Polling Results (SAPoR)
# Copyright (C) 2020 Filip van Laenen <f.a.vanlaenen@ieee.org>
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
  # The regional data for Ireland.
  #
  class Ireland < Area
    include Singleton

    def area_code
      'IE'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      SEAT_DISTRIBUTION.values.inject(:+)
    end

    def overall_election_results_of_2016
      if @overall_election_results_of_2016.nil?
        @overall_election_results_of_2016 = \
          summarize_election_results(election_results_of_2016)
      end
      @overall_election_results_of_2016
    end

    def population_size
      POPULATION_SIZE
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    private

    COALITIONS = [].freeze

    # Voter turnout on 26 February 2016
    # https://en.wikipedia.org/wiki/2016_Irish_general_election
    POPULATION_SIZE = 2_132_895

    SEAT_DISTRIBUTION = { 'Carlow–Kilkenny' => 5, 'Cavan–Monaghan' => 4,
                          'Clare' => 4, 'Cork East' => 4,
                          'Cork North-Central' => 4, 'Cork North-West' => 3,
                          'Cork South-Central' => 4, 'Cork South-West' => 3,
                          'Donegal' => 5, 'Dublin Bay North' => 5,
                          'Dublin Bay South' => 4, 'Dublin Central' => 3,
                          'Dublin Fingal' => 5, 'Dublin Mid-West' => 4,
                          'Dublin North-West' => 3, 'Dublin Rathdown' => 3,
                          'Dublin South-Central' => 4, 'Dublin South-West' => 5,
                          'Dublin West' => 4, 'Dún Laoghaire' => 4,
                          'Galway East' => 3, 'Galway West' => 5, 'Kerry' => 5,
                          'Kildare North' => 4, 'Kildare South' => 3,
                          'Laois' => 3, 'Limerick City' => 4,
                          'Limerick County' => 3, 'Longford–Westmeath' => 4,
                          'Louth' => 5, 'Mayo' => 4, 'Meath East' => 3,
                          'Meath West' => 3, 'Offaly' => 3, 'Roscommon–Galway' => 3,
                          'Sligo–Leitrim' => 4, 'Tipperary' => 5,
                          'Waterford' => 4, 'Wexford' => 5,
                          'Wicklow' => 5 }.freeze

    SEAT_DISTRIBUTION_2020 = { 'Carlow–Kilkenny' => 5, 'Cavan–Monaghan' => 5,
                          'Clare' => 4, 'Cork East' => 4,
                          'Cork North-Central' => 4, 'Cork North-West' => 3,
                          'Cork South-Central' => 4, 'Cork South-West' => 3,
                          'Donegal' => 5, 'Dublin Bay North' => 5,
                          'Dublin Bay South' => 4, 'Dublin Central' => 4,
                          'Dublin Fingal' => 5, 'Dublin Mid-West' => 4,
                          'Dublin North-West' => 3, 'Dublin Rathdown' => 3,
                          'Dublin South-Central' => 4, 'Dublin South-West' => 5,
                          'Dublin West' => 4, 'Dún Laoghaire' => 4,
                          'Galway East' => 3, 'Galway West' => 5, 'Kerry' => 5,
                          'Kildare North' => 4, 'Kildare South' => 4,
                          'Laois–Offaly' => 5, 'Limerick City' => 4,
                          'Limerick County' => 3, 'Longford–Westmeath' => 4,
                          'Louth' => 5, 'Mayo' => 4, 'Meath East' => 3,
                          'Meath West' => 3, 'Roscommon–Galway' => 3,
                          'Sligo–Leitrim' => 4, 'Tipperary' => 5,
                          'Waterford' => 4, 'Wexford' => 5,
                          'Wicklow' => 5 }.freeze

    def election_results_of_2016
      if @election_results_of_2016.nil?
        @election_results_of_2016 = load_election_results(
          'ireland-20160226.psv'
        )
      end
      @election_results_of_2016
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2016, election_results_of_2016,
          SEAT_DISTRIBUTION, DhondtDenominators
        )
      end
      @electoral_system
    end
  end
end
