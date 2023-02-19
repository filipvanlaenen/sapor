# encoding: utf-8
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
  # The regional data for Belgium.
  #
  class Belgium < Area
    include Singleton
    def coalitions
      COALITIONS
    end

    def no_of_seats
      seat_distribution.values.inject(:+)
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    THRESHOLD = 0.05
    
    LE_PARTY = 'Les Engagés'.freeze
    CDV_PARTY = 'Christen-Democratisch en Vlaams'.freeze
    ECOLO_PARTY = 'Ecolo'.freeze
    GROEN_PARTY = 'Groen'.freeze
    MR_PARTY = 'Mouvement Réformateur'.freeze
    NVA_PARTY = 'Nieuw-Vlaamse Alliantie'.freeze
    OVLD_PARTY = 'Open Vlaamse Liberalen en Democraten'.freeze
    PS_PARTY = 'Parti Socialiste'.freeze
    PTB_PARTY = 'Parti du Travail de Belgique'.freeze
    PVDA_PARTY = 'Partij van de Arbeid van België'.freeze
    SPA_PARTY = 'Vooruit'.freeze

    COALITIONS = [[LE_PARTY, CDV_PARTY, ECOLO_PARTY, GROEN_PARTY, MR_PARTY, 
                   OVLD_PARTY, PS_PARTY, SPA_PARTY],
                  [LE_PARTY, CDV_PARTY, ECOLO_PARTY, GROEN_PARTY, MR_PARTY,
                   OVLD_PARTY],
                  [LE_PARTY, CDV_PARTY, ECOLO_PARTY, GROEN_PARTY, PS_PARTY,
                   PTB_PARTY, PVDA_PARTY, SPA_PARTY],
                  [LE_PARTY, CDV_PARTY, ECOLO_PARTY, GROEN_PARTY, PS_PARTY,
                   SPA_PARTY],
                  [LE_PARTY, CDV_PARTY, MR_PARTY, NVA_PARTY, OVLD_PARTY],
                  [LE_PARTY, CDV_PARTY, MR_PARTY, OVLD_PARTY],
                  [LE_PARTY, CDV_PARTY, MR_PARTY, OVLD_PARTY, PS_PARTY,
                   SPA_PARTY],
                  [LE_PARTY, CDV_PARTY, MR_PARTY, OVLD_PARTY, PS_PARTY],
                  [LE_PARTY, CDV_PARTY, PS_PARTY, SPA_PARTY],
                  [LE_PARTY, ECOLO_PARTY, GROEN_PARTY, PS_PARTY, PTB_PARTY,
                   PVDA_PARTY, SPA_PARTY],
                  [CDV_PARTY, ECOLO_PARTY, GROEN_PARTY, MR_PARTY, OVLD_PARTY,
                   PS_PARTY, SPA_PARTY],
                  [CDV_PARTY, MR_PARTY, NVA_PARTY, OVLD_PARTY],
                  [ECOLO_PARTY, GROEN_PARTY, MR_PARTY, OVLD_PARTY, PS_PARTY,
                   SPA_PARTY],
                  [ECOLO_PARTY, GROEN_PARTY, PS_PARTY, PTB_PARTY, PVDA_PARTY,
                   SPA_PARTY],
                  [MR_PARTY, NVA_PARTY, OVLD_PARTY, PS_PARTY, SPA_PARTY],
                  [MR_PARTY, OVLD_PARTY, PS_PARTY, SPA_PARTY]].freeze

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new(
          overall_election_results_of_2019,
          election_results_of_2019,
          seat_distribution,
          DhondtDenominators,
          THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
