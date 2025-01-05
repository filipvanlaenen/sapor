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
    
    CDV_PARTY = 'Christen-Democratisch en Vlaams'.freeze
    ECOLO_PARTY = 'Ecolo'.freeze
    GROEN_PARTY = 'Groen'.freeze
    LE_PARTY = 'Les Engagés'.freeze
    MR_PARTY = 'Mouvement Réformateur'.freeze
    NVA_PARTY = 'Nieuw-Vlaamse Alliantie'.freeze
    OVLD_PARTY = 'Open Vlaamse Liberalen en Democraten'.freeze
    PS_PARTY = 'Parti Socialiste'.freeze
    PTB_PARTY = 'Parti du Travail de Belgique'.freeze
    PVDA_PARTY = 'Partij van de Arbeid van België'.freeze
    VOORUIT_PARTY = 'Vooruit'.freeze

    COALITIONS = [[CDV_PARTY, ECOLO_PARTY, GROEN_PARTY, LE_PARTY, MR_PARTY, OVLD_PARTY, PS_PARTY, VOORUIT_PARTY],  # Vivaldi + LE
                  [CDV_PARTY, ECOLO_PARTY, GROEN_PARTY, LE_PARTY, MR_PARTY, OVLD_PARTY],                           # Jamaica
                  [CDV_PARTY, ECOLO_PARTY, GROEN_PARTY, LE_PARTY, PS_PARTY, PTB_PARTY, PVDA_PARTY, VOORUIT_PARTY], # Grote regenboog/olijfboom
                  [CDV_PARTY, ECOLO_PARTY, GROEN_PARTY, LE_PARTY, PS_PARTY, VOORUIT_PARTY],                        # Regenboog/olijfboom
                  [CDV_PARTY, LE_PARTY, MR_PARTY, NVA_PARTY, OVLD_PARTY],                                          # Zweeds + LE
                  [CDV_PARTY, LE_PARTY, MR_PARTY, NVA_PARTY, VOORUIT_PARTY],                                       # Arizona
                  [CDV_PARTY, LE_PARTY, MR_PARTY, OVLD_PARTY],                                                     # Rooms-blauw
                  [CDV_PARTY, LE_PARTY, MR_PARTY, OVLD_PARTY, PS_PARTY, VOORUIT_PARTY],                            # Tripartite
                  [CDV_PARTY, LE_PARTY, MR_PARTY, OVLD_PARTY, PS_PARTY],                                           # Vlinder
                  [CDV_PARTY, LE_PARTY, NVA_PARTY, PS_PARTY, VOORUIT_PARTY],                                       # Rooms-rood-geel/raket
                  [CDV_PARTY, LE_PARTY, PS_PARTY, VOORUIT_PARTY],                                                  # Rooms-rood
                  [CDV_PARTY, ECOLO_PARTY, GROEN_PARTY, MR_PARTY, OVLD_PARTY, PS_PARTY, VOORUIT_PARTY],            # Vivaldi
                  [CDV_PARTY, MR_PARTY, NVA_PARTY, OVLD_PARTY],                                                    # Zweeds
                  [ECOLO_PARTY, GROEN_PARTY, MR_PARTY, OVLD_PARTY, PS_PARTY, VOORUIT_PARTY],                       # Paars-groen
                  [ECOLO_PARTY, GROEN_PARTY, PS_PARTY, PTB_PARTY, PVDA_PARTY, VOORUIT_PARTY],                      # Volksfront
                  [MR_PARTY, NVA_PARTY, OVLD_PARTY, PS_PARTY, VOORUIT_PARTY],                                      # Bourgondisch/paars-geel
                  [MR_PARTY, OVLD_PARTY, PS_PARTY, VOORUIT_PARTY]].freeze                                          # Paars

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new(
          overall_election_results_of_2024,
          election_results_of_2024,
          seat_distribution,
          DhondtDenominators,
          THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
