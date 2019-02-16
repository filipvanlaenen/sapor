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
  # The regional data for Spain.
  #
  class Spain < Area
    include Singleton

    def area_code
      'ES'
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

    def threshold
      THRESHOLD
    end

    private

    CC_PARTY = 'Coalición Canaria–Partido Nacionalista Canario'.freeze
    CS_PARTY = 'Ciudadanos–Partido de la Ciudadanía'.freeze
    EAJPNV_PARTY = 'Euzko Alderdi Jeltzalea/Partido Nacionalista Vasco'.freeze
    EHB_PARTY = 'Euskal Herria Bildu'.freeze
    ERC_PARTY = 'Esquerra Republicana de Catalunya–Catalunya Sí'.freeze
    PDECAT_PARTY = 'Partit Demòcrata Europeu Català'.freeze
    PODEMOS_PARTY = 'Unidos Podemos'.freeze
    PP_PARTY = 'Partido Popular'.freeze
    PSOE_PARTY = 'Partido Socialista Obrero Español'.freeze
    VOX_PARTY = 'Vox'.freeze

    COALITIONS = [[CC_PARTY, CS_PARTY, PP_PARTY],
                  [EAJPNV_PARTY, EHB_PARTY, ERC_PARTY, PDECAT_PARTY,
                   PODEMOS_PARTY, PSOE_PARTY],
                  [EAJPNV_PARTY, EHB_PARTY, PODEMOS_PARTY, PSOE_PARTY],
                  [EHB_PARTY, ERC_PARTY, PODEMOS_PARTY, PSOE_PARTY],
                  [ERC_PARTY, PDECAT_PARTY, PODEMOS_PARTY, PSOE_PARTY],
                  [CS_PARTY, PP_PARTY],
                  [CS_PARTY, PP_PARTY, VOX_PARTY],
                  [CS_PARTY, PSOE_PARTY],
                  [PODEMOS_PARTY, PSOE_PARTY],
                  [PP_PARTY],
                  [PP_PARTY, VOX_PARTY],
                  [PSOE_PARTY]].freeze

    # Voter turnout on 26 June 2016
    # https://en.wikipedia.org/wiki/2016_Spanish_general_election
    POPULATION_SIZE = 24_053_755

    SEAT_DISTRIBUTION = { 'A Coruña' => 8, 'Albacete' => 4,
                          'Alicante/Alacant' => 12, 'Almería' => 6,
                          'Araba' => 4, 'Asturias' => 8, 'Ávila' => 3,
                          'Badajoz' => 6, 'Barcelona' => 31, 'Bizkaia' => 8,
                          'Burgos' => 4, 'Cáceres' => 4, 'Cádiz' => 9,
                          'Cantabria' => 5, 'Castellón/Castelló' => 5,
                          'Ceuta' => 1, 'Ciudad Real' => 5, 'Córdoba' => 6,
                          'Cuenca' => 3, 'Gipuzkoa' => 6, 'Girona' => 6,
                          'Granada' => 7, 'Guadalajara' => 3, 'Huelva' => 5,
                          'Huesca' => 3, 'Illes Balears' => 8, 'Jaén' => 5,
                          'La Rioja' => 4, 'Las Palmas' => 8, 'Léon' => 4,
                          'Lleida' => 4, 'Lugo' => 4, 'Madrid' => 36,
                          'Málaga' => 11, 'Melilla' => 1, 'Murcia' => 10,
                          'Navarra' => 5, 'Ourense' => 4, 'Palencia' => 3,
                          'Pontevedra' => 7, 'Salamanca' => 4,
                          'Santa Cruz de Tenerife' => 7, 'Segovia' => 3,
                          'Sevilla' => 12, 'Soria' => 2, 'Tarragona' => 6,
                          'Teruel' => 3, 'Toledo' => 6,
                          'Valencia/València' => 16, 'Valladolid' => 5,
                          'Zamora' => 3, 'Zaragoza' => 7 }.freeze

    THRESHOLD = 0.03

    def election_results_of_2016
      if @election_results_of_2016.nil?
        @election_results_of_2016 = load_election_results(
          'spain-20160626.psv'
        )
      end
      @election_results_of_2016
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2016, election_results_of_2016,
          SEAT_DISTRIBUTION, DhondtDenominators, THRESHOLD
        )
      end
      @electoral_system
    end
  end
end
