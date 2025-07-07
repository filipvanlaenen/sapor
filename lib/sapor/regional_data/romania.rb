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
  # The regional data for Romania.
  #
  class Romania < Area
    include Singleton

    def area_code
      'RO'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      NO_OF_SEATS
    end

    def population_size
      POPULATION_SIZE
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    AUR_PARTY = 'Alianța pentru Unirea Românilor'.freeze
    DREPT_PARTY = 'Dreptate și Respect în Europa Pentru Toți'.freeze
    FD_PARTY = 'Forța Dreptei'.freeze
    PMP_PARTY = 'Partidul Mișcarea Populară'.freeze
    PNL_PARTY = 'Partidul Național Liberal'.freeze
    POT_PARTY = 'Partidul Oamenilor Tineri'.freeze
    PSD_PARTY = 'Partidul Social Democrat'.freeze
    REPER_PARTY = 'Reînnoim Proiectul European al României'.freeze
    RMDSZ_PARTY = 'Romániai Magyar Demokrata Szövetség'.freeze
    SENS_PARTY = 'Sănătate, Educație, Natură, Sustenabilitate'.freeze
    SOS_PARTY = 'Partidul S.O.S. România'.freeze
    USR_PARTY = 'Uniunea Salvați România'.freeze
    
    MINOR_PARTY = 'Parties of ethnic minorities'.freeze

    COALITIONS = [[AUR_PARTY],
                  [MINOR_PARTY, PNL_PARTY, PSD_PARTY, RMDSZ_PARTY],
                  [MINOR_PARTY, PNL_PARTY, PSD_PARTY, RMDSZ_PARTY, USR_PARTY],
                  [MINOR_PARTY, PNL_PARTY, RMDSZ_PARTY],
                  [MINOR_PARTY, PNL_PARTY, RMDSZ_PARTY, USR_PARTY],
                  [PNL_PARTY],
                  [PNL_PARTY, PSD_PARTY],
                  [PNL_PARTY, PSD_PARTY, RMDSZ_PARTY],
                  [PNL_PARTY, PSD_PARTY, RMDSZ_PARTY, USR_PARTY],
                  [PNL_PARTY, PSD_PARTY, USR_PARTY],
                  [PNL_PARTY, RMDSZ_PARTY],
                  [PNL_PARTY, USR_PARTY],
                  [PNL_PARTY, RMDSZ_PARTY, USR_PARTY],
                  [PSD_PARTY],
                  [PSD_PARTY, USR_PARTY]].freeze

    NO_OF_SEATS = 312

    # Voter turnout on 1 December 2024
    # https://en.wikipedia.org/wiki/2024_Romanian_parliamentary_election
    POPULATION_SIZE = 9_243_641

    THRESHOLD = 0.05
    COALITION_LIST_THRESHOLD = 0.08
    COALITION_LISTS = [].freeze
    MINORITY_LISTS = [RMDSZ_PARTY].freeze

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(
          NO_OF_SEATS, DhondtDenominators, THRESHOLD, 0, false,
          COALITION_LIST_THRESHOLD, COALITION_LISTS, MINORITY_LISTS
        )
      end
      @electoral_system
    end
  end
end
