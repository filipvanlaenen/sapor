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
  # The regional data for Catalonia.
  #
  class CataloniaWithJuntsPerCatalunya < Area
    include Singleton
    def area_code
      'ES-CT∪{ERC,JuntsxCat}\\{JxSí}'
    end

    def coalitions
      [['Junts per Catalunya', 'Esquerra Republicana de Catalunya–Catalunya Sí'],
       ['Junts per Catalunya', 'Esquerra Republicana de Catalunya–Catalunya Sí', 'Candidatura d’Unitat Popular'],
       ['Junts per Catalunya', 'Esquerra Republicana de Catalunya–Catalunya Sí', 'Catalunya en Comú'],
       ['Ciutadans–Partido de la Ciudadanía',
        'Partit dels Socialistes de Catalunya (PSC-PSOE)',
        'Catalunya en Comú', 'Partit Popular'],
       ['Ciutadans–Partido de la Ciudadanía',
        'Partit dels Socialistes de Catalunya (PSC-PSOE)', 'Partit Popular']]
    end

    def no_of_seats
      SEAT_DISTRIBUTION.values.inject(:+)
    end

    def overall_election_results_of_2015
      if @overall_election_results_of_2015.nil?
        @overall_election_results_of_2015 = \
          summarize_election_results(election_results_of_2015)
      end
      @overall_election_results_of_2015
    end

    def population_size
      # Voter turnout in 2015
      # Source: "Election Results. Parliament of Catalonia Election 2015".
      #         Generalitat of Catalonia. Retrieved 21 October 2017.
      # URL: http://governacio.gencat.cat/ca/pgov_ambits_d_actuacio/pgov_eleccions/pgov_dades_electorals/resultats-2?id_eleccions=A20151&id_territori=CA09
      5_510_853
    end

    def seats(simulation)
      electoral_system.project(simulation)
    end

    def threshold
      THRESHOLD
    end

    private

    SEAT_DISTRIBUTION = { 'Barcelona' => 85, 'Girona' => 17, 'Lleida' => 15,
                          'Tarragona' => 18 }

    THRESHOLD = 0.03

    def election_results_of_2015
      if @election_results_of_2015.nil?
        @election_results_of_2015 = load_election_results( \
          'catalonia-2015-jxcat.psv')
      end
      @election_results_of_2015
    end

    def electoral_system
      if @electoral_system.nil?
        @electoral_system = MultiDistrictProportional.new( \
          overall_election_results_of_2015,
          election_results_of_2015,
          SEAT_DISTRIBUTION,
          DhondtDenominators,
          THRESHOLD)
      end
      @electoral_system
    end
  end
end
