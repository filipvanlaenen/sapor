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
  # The regional data for Latvia, extended for KPV.
  #
  class LatviaKpv < Area
    include Singleton
    def area_code
      'LV∪{KPV}'
    end

    def coalitions
      [['Kustība Par!',
        'Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un Brīvībai/LNNK”',
        'Vienotība', 'Zaļo un Zemnieku savienība'],
       ['Kustība Par!',
        'Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un Brīvībai/LNNK”',
        'Zaļo un Zemnieku savienība'],
       ['Kustība Par!', 'Jaunā konservatīvā partija',
        'Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un Brīvībai/LNNK”',
        'Vienotība'],
       ['Kustība Par!', 'Jaunā konservatīvā partija',
        'Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un Brīvībai/LNNK”',
        'Vienotība', 'Zaļo un Zemnieku savienība'],
       ['Kustība Par!', 'Jaunā konservatīvā partija',
        'Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un Brīvībai/LNNK”',
        'Zaļo un Zemnieku savienība'],
       ['Kustība Par!', 'Jaunā konservatīvā partija',
        'Sociāldemokrātiskā Partija “Saskaņa”'],
       ['Kustība Par!', 'Sociāldemokrātiskā Partija “Saskaņa”'],
       ['Jaunā konservatīvā partija',
        'Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un Brīvībai/LNNK”',
        'Vienotība', 'Zaļo un Zemnieku savienība'],
       ['Jaunā konservatīvā partija',
        'Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un Brīvībai/LNNK”',
        'Zaļo un Zemnieku savienība'],
       ['Nacionālā apvienība „Visu Latvijai!”–„Tēvzemei un Brīvībai/LNNK”',
        'Vienotība', 'Zaļo un Zemnieku savienība']]
    end

    def no_of_seats
      SEAT_DISTRIBUTION.values.inject(:+)
    end

    def overall_election_results_of_2014
      if @overall_election_results_of_2014.nil?
        @overall_election_results_of_2014 = \
          summarize_election_results(election_results_of_2014)
      end
      @overall_election_results_of_2014
    end

    def population_size
      # Voter turnout on 4 October 2014
      913_491
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    SEAT_DISTRIBUTION = { 'Kurzeme' => 13, 'Latgale' => 15, 'Rīga' => 32,
                          'Vidzeme' => 26, 'Zemgale' => 14 }.freeze

    THRESHOLD = 0.05

    def election_results_of_2014
      if @election_results_of_2014.nil?
        @election_results_of_2014 = load_election_results(
          'latvia-20141004-kpv.psv'
        )
      end
      @election_results_of_2014
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2014, election_results_of_2014,
          SEAT_DISTRIBUTION, SainteLagueDenominators, 0, THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
