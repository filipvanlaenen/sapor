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

require 'spec_helper'

describe Sapor::CataloniaWithJuntsPdecatAndVox, '#area_code' do
  it 'returns ES-CT∪{Junts,PDeCAT,Vox}\{JxCat} as the area code' do
    expect(Sapor::CataloniaWithJuntsPdecatAndVox.instance.area_code).to eq('ES-CT∪{Junts,PDeCAT,Vox}\{JxCat}')
  end
end

describe Sapor::CataloniaWithJuntsPdecatAndVox, '#no_of_seats' do
  it 'returns 135 as the number of seats' do
    expect(Sapor::CataloniaWithJuntsPdecatAndVox.instance.no_of_seats).to eq(135)
  end
end

describe Sapor::CataloniaWithJuntsPdecatAndVox, '#population_size' do
  it 'returns a population size of 4,357,368' do
    expect(Sapor::CataloniaWithJuntsPdecatAndVox.instance.population_size).to eq(4_357_368)
  end
end

describe Sapor::CataloniaWithJuntsPdecatAndVox, '#seats' do
  it 'calculates the number of seats for the election of 2015 correctly' do
    CataloniaWithJuntsPdecatAndVox = Sapor::CataloniaWithJuntsPdecatAndVox.instance
    results = CataloniaWithJuntsPdecatAndVox.overall_election_results_of_2017
    seats = CataloniaWithJuntsPdecatAndVox.seats(results)
    expect(seats['Ciutadans–Partido de la Ciudadanía']).to eq(36 - 7)
    expect(seats['Junts per Catalunya']).to eq(34 - 8)
    expect(seats['Partit Demòcrata Europeu Català']).to eq(34 - 9)
    expect(seats['Esquerra Republicana–Catalunya Sí']).to eq(32 - 7)
    expect(seats['Partit dels Socialistes de Catalunya (PSC-PSOE)']).to eq(17 - 2)
    expect(seats['Catalunya en Comú–Podem']).to eq(8 - 2)
    expect(seats['Candidatura d’Unitat Popular']).to eq(4 - 1)
    expect(seats['Partit Popular']).to eq(4 - 1)
    expect(seats['Vox']).to eq(0 + 3)
    expect(seats['Partit Animalista contra el Maltractament Animal']).to eq(0)
    expect(seats['Recortes Cero–Grupo Verde']).to eq(0)
    expect(seats['Per un Món Més Just']).to eq(0)
  end
end

describe Sapor::CataloniaWithJuntsPdecatAndVox, '#threshold' do
  it 'returns a threshold of 3%' do
    expect(Sapor::CataloniaWithJuntsPdecatAndVox.instance.threshold).to eq(0.03)
  end
end
