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

require 'spec_helper'

describe Sapor::Catalonia, '#area_code' do
  it 'returns ES-CAT as the area code' do
    expect(Sapor::Catalonia.instance.area_code).to eq('ES-CT')
  end
end

describe Sapor::Catalonia, '#coalitions' do
  it 'returns JS and JS+CUP as the coalitions to track' do
    expect(Sapor::Catalonia.instance.coalitions).to include(['Junts pel Sí'])
    expect(Sapor::Catalonia.instance.coalitions).to \
      include(['Junts pel Sí',
               "Candidatura d'Unitat Popular – Alternativa d'Esquerres"])
  end
end

describe Sapor::Catalonia, '#no_of_seats' do
  it 'returns 135 as the number of seats' do
    expect(Sapor::Catalonia.instance.no_of_seats).to eq(135)
  end
end

describe Sapor::Catalonia, '#population_size' do
  it 'returns a population size of 3,668,310' do
    expect(Sapor::Catalonia.instance.population_size).to eq(3_668_310)
  end
end

describe Sapor::Catalonia, '#seats' do
  it 'calculates the number of seats for the election of 2012 (adapted to' \
     ' 2015) correctly' do
    catalonia = Sapor::Catalonia.instance
    results = catalonia.overall_election_results_of_2012_adapted_to_2015
    seats = catalonia.seats(results)
    expect(seats['Junts pel Sí']).to eq(64)
    expect(seats['Partit dels Socialistes de Catalunya']).to eq(20)
    expect(seats['Partit Popular de Catalunya']).to eq(19)
    expect(seats['Catalunya Sí que es Pot']).to eq(13)
    expect(seats['Ciutadans-Partido de la Ciudadanía']).to eq(9)
    expect(seats['Unió Democràtica de Catalunya']).to eq(7)
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

describe Sapor::Catalonia, '#threshold' do
  it 'returns a threshold of 3%' do
    expect(Sapor::Catalonia.instance.threshold).to eq(0.03)
  end
end
