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
  # The regional data for Catalonia.
  #
  class Catalonia < Area
    include Singleton
    def area_code
      'ES-CT'
    end

    def coalitions
      COALITIONS
    end

    def no_of_seats
      SEAT_DISTRIBUTION.values.inject(:+)
    end

    def overall_election_results_of_2017
      if @overall_election_results_of_2017.nil?
        @overall_election_results_of_2017 = \
          summarize_election_results(election_results_of_2017)
      end
      @overall_election_results_of_2017
    end

    def population_size
      # Voter turnout in 2017
      # Source: "Disposición 426 del BOE núm. 11 de 2018" Retrieved on 3 January
      # 2020.
      # URL: http://www.juntaelectoralcentral.es/cs/jec/documentos/CATALU%C3%91A_2017_Resultados.pdf
      4_357_368
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    CEC_PARTY = 'Catalunya en Comú–Podem'.freeze
    CS_PARTY = 'Ciutadans–Partido de la Ciudadanía'.freeze
    CUP_PARTY = 'Candidatura d’Unitat Popular'.freeze
    ERC_PARTY = 'Esquerra Republicana–Catalunya Sí'.freeze
    JXCAT_PARTY = 'Junts per Catalunya'.freeze
    PDCAT_PARTY = 'Partit Demòcrata Europeu Català'.freeze
    PP_PARTY = 'Partit Popular'.freeze
    PSC_PARTY = 'Partit dels Socialistes de Catalunya (PSC-PSOE)'.freeze
    VOX_PARTY = 'Vox'.freeze

    COALITIONS = [[CEC_PARTY, CS_PARTY, PSC_PARTY, PP_PARTY],
                  [CEC_PARTY, ERC_PARTY],
                  [CEC_PARTY, ERC_PARTY, JXCAT_PARTY],
                  [CEC_PARTY, ERC_PARTY, PSC_PARTY],
                  [CS_PARTY, PSC_PARTY, PP_PARTY],
                  [CS_PARTY, PSC_PARTY, PP_PARTY, VOX_PARTY],
                  [CUP_PARTY, ERC_PARTY, JXCAT_PARTY],
                  [CUP_PARTY, ERC_PARTY, JXCAT_PARTY, PDCAT_PARTY],
                  [ERC_PARTY, JXCAT_PARTY],
                  [ERC_PARTY, JXCAT_PARTY, PDCAT_PARTY]].freeze

    SEAT_DISTRIBUTION = { 'Barcelona' => 85, 'Girona' => 17, 'Lleida' => 15,
                          'Tarragona' => 18 }.freeze

    THRESHOLD = 0.03

    def election_results_of_2017
      if @election_results_of_2017.nil?
        @election_results_of_2017 = load_election_results( \
          'catalonia-20171221.psv'
        )
      end
      @election_results_of_2017
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2017,
          election_results_of_2017,
          SEAT_DISTRIBUTION,
          DhondtDenominators,
          THRESHOLD
        )
      end
      @electoral_system
    end
  end

  # Extension of Catalonia with Vox
  class CataloniaWithVox < Catalonia
    def area_code
      'ES-CT∪{Vox}'
    end

    def election_results_of_2017
      if @election_results_of_2017.nil?
        @election_results_of_2017 = load_election_results(
          'catalonia-20171221-with-vox.psv'
        )
      end
      @election_results_of_2017
    end
  end

  # Extension of Catalonia with Vox, Junts and PDeCAT
  class CataloniaWithJuntsPdecatAndVox < Catalonia
    def area_code
      'ES-CT∪{Junts,PDeCAT,Vox}\{JxCat}'
    end

    def election_results_of_2017
      if @election_results_of_2017.nil?
        @election_results_of_2017 = load_election_results(
          'catalonia-20171221-with-junts-pdecat-and-vox-without-jxcat.psv'
        )
      end
      @election_results_of_2017
    end
  end
end
