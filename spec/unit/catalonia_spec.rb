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
  it 'returns ES-CT as the area code' do
    expect(Sapor::Catalonia.instance.area_code).to eq('ES-CT')
  end
end

describe Sapor::Catalonia, '#coalitions' do
  it 'returns JS and JS+CUP as the coalitions to track' do
    expect(Sapor::Catalonia.instance.coalitions).to include(['Junts pel Sí'])
    expect(Sapor::Catalonia.instance.coalitions).to \
      include(['Junts pel Sí', 'Candidatura d’Unitat Popular'])
    expect(Sapor::Catalonia.instance.coalitions).to \
      include(['Ciutadans–Partido de la Ciudadanía',
               'Partit dels Socialistes de Catalunya (PSC-PSOE)',
               'Catalunya en Comú', 'Partit Popular'])
  end
end

describe Sapor::Catalonia, '#no_of_seats' do
  it 'returns 135 as the number of seats' do
    expect(Sapor::Catalonia.instance.no_of_seats).to eq(135)
  end
end

describe Sapor::Catalonia, '#population_size' do
  it 'returns a population size of 5,510,853' do
    expect(Sapor::Catalonia.instance.population_size).to eq(5_510_853)
  end
end

describe Sapor::Catalonia, '#seats' do
  it 'calculates the number of seats for the election of 2015 correctly' do
    catalonia = Sapor::Catalonia.instance
    results = catalonia.overall_election_results_of_2015
    seats = catalonia.seats(results)
    expect(seats['Junts pel Sí']).to eq(62)
    expect(seats['Ciutadans–Partido de la Ciudadanía']).to eq(25)
    expect(seats['Partit dels Socialistes de Catalunya (PSC-PSOE)']).to eq(16)
    expect(seats['Catalunya en Comú']).to eq(11)
    expect(seats['Partit Popular']).to eq(11)
    expect(seats['Candidatura d’Unitat Popular']).to eq(10)
    expect(seats['Unió Democràtica de Catalunya']).to eq(0)
    expect(seats['Partit Animalista contra el Maltractament Animal']).to eq(0)
    expect(seats['Pirates de Catalunya–Per decidir-ho tot']).to eq(0)
    expect(seats['Guanyem Catalunya']).to eq(0)
  end
end

describe Sapor::Catalonia, '#threshold' do
  it 'returns a threshold of 3%' do
    expect(Sapor::Catalonia.instance.threshold).to eq(0.03)
  end
end
