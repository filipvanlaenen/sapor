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

require 'spec_helper'

describe Sapor::Catalonia, '#seats' do
  it 'calculates the number of seats for the election of 2012 correctly' do
    catalonia = Sapor::Catalonia.instance
    seats = catalonia.seats(catalonia.overall_election_results_of_2012)
    expect(seats['Convergència i Unió']).to eq(50)
    expect(seats['Esquerra Republicana de Catalunya – Catalunya Sí']).to eq(21)
    expect(seats['Partit dels Socialistes de Catalunya']).to eq(20)
    expect(seats['Partit Popular de Catalunya']).to eq(19)
    expect(seats['Iniciativa per Catalunya Verds – Esquerra Unida i ' \
                 'Alternativa']).to eq(13)
    expect(seats['Ciutadans-Partido de la Ciudadanía']).to eq(9)
    expect(seats["Candidatura d'Unitat Popular – Alternativa d'Esquerres"]).to \
      eq(3)
    expect(seats['Plataforma per Catalunya']).to eq(0)
    expect(seats['Solidaritat Catalana per la Independència']).to eq(0)
    expect(seats['Escons en Blanc']).to eq(0)
    expect(seats['Partido Animalista Contra el Maltrato Animal']).to eq(0)
    expect(seats['Pirates de Catalunya']).to eq(0)
    expect(seats['Unió, Progrés i Democràcia']).to eq(0)
    expect(seats['Farts.cat']).to eq(0)
    expect(seats['Via Democràtica']).to eq(0)
    expect(seats["Unificació Comunista d'Espanya"]).to eq(0)
    expect(seats["Partit Republicà d'Esquerra – Izquierda Republicana"]).to \
      eq(0)
    expect(seats['Socialistes i Republicans']).to eq(0)
  end
end
