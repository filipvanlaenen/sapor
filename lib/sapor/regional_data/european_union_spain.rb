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
  # The regional data for the European Union: Spain.
  #
  class EuropeanUnionSpain < Area
    include Singleton

    def area_code
      'EU[ES]'
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

    private

    COALITIONS = [['Candidatura d’Unitat Popular (GUE/NGL)', 'Euskal Herria Bildu (GUE/NGL)',
                   'Movimiento Sumar–Izquierda Unida (GUE/NGL)', 'Partido Animalista Contra el Maltrato Animal (GUE/NGL)',
                   'Podemos (GUE/NGL)', 'Movimiento Sumar–Podemos–Izquierda Unida (GUE/NGL)', 'Unidos Podemos (GUE/NGL)'],
                  ['Ahora Repúblicas (Greens/EFA)', 'Bloque Nacionalista Galego–Nós Candidatura Galega (Greens/EFA)',
                   'Movimiento Sumar–Catalunya en Comú–Més–Compromís–Más País–Chunta (Greens/EFA)',
                   'Coalició Compromís (Greens/EFA)', 'Esquerra Republicana de Catalunya–Catalunya Sí (Greens/EFA)',
                   'Primavera Europea (Greens/EFA)'],
                  ['Partido Socialista Obrero Español (S&D)'],
                  ['Ciudadanos–Partido de la Ciudadanía (RE)', 'Coalición Canaria–Partido Nacionalista Canario (RE)',
                   'Coalición por Europa (RE)', 'Euzko Alderdi Jeltzalea/Partido Nacionalista Vasco (RE)',
                   'Partido Regionalista de Cantabria (RE)'],
                  ['Partido Popular (EPP)'],
                  ['Vox (PfE)'],
                  ['España Vaciada (NI)', 'Junts per Catalunya (NI)', 'Se Acabó La Fiesta (NI)'],
                  ['Unión del Pueblo Navarro (*)']].freeze

    NO_OF_SEATS = 61

    # Voter turnout on 9 June 2024
    # https://en.wikipedia.org/wiki/2024_European_Parliament_election_in_Spain#Overall
    POPULATION_SIZE = 17_527_438 	

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = SingleDistrictProportional.new(no_of_seats, DhondtDenominators, 0, 0, false)
      end
      @electoral_system
    end
  end
end
