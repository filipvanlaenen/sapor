
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

describe Sapor::Spain, '#area_code' do
  it 'returns ES as the area code' do
    expect(Sapor::Spain.instance.area_code).to eq('ES')
  end
end

describe Sapor::Spain, '#no_of_seats' do
  it 'returns 135 as the number of seats' do
    expect(Sapor::Spain.instance.no_of_seats).to eq(350)
  end
end

describe Sapor::Spain, '#population_size' do
  it 'returns a population size of 24,053,755' do
    expect(Sapor::Spain.instance.population_size).to eq(24_053_755)
  end
end

describe Sapor::Spain, '#seats' do
  it 'calculates the number of seats for the election of 2016 correctly' do
    Spain = Sapor::Spain.instance
    results = Spain.overall_election_results_of_2016
    seats = Spain.seats(results)
    expect(seats['Partido Popular']).to eq(137)
    expect(seats['Partido Socialista Obrero Español']).to eq(85)
    expect(seats['Unidos Podemos']).to eq(71)
    expect(seats['Ciudadanos–Partido de la Ciudadanía']).to eq(32)
    expect(seats['Esquerra Republicana de Catalunya–Catalunya Sí']).to eq(9)
    expect(seats['Partit Demòcrata Europeu Català']).to eq(8)
    expect(seats['Euzko Alderdi Jeltzalea/Partido Nacionalista Vasco']).to eq(5)
    expect(seats['Partido Animalista Contra el Maltrato Animal']).to eq(0)
    expect(seats['Euskal Herria Bildu']).to eq(2)
    expect(seats['Coalición Canaria–Partido Nacionalista Canario']).to eq(1)
    expect(seats['Recortes Cero–Grupo Verde']).to eq(0)
    expect(seats['Unión Progreso y Democracia']).to eq(0)
    expect(seats['Vox']).to eq(0)
    expect(seats['Bloque Nacionalista Galego–Nós Candidatura Galega']).to eq(0)
    expect(seats['Partido Comunista de los Pueblos de España']).to eq(0)
    expect(seats['Geroa Bai']).to eq(0)
    expect(seats['Escaños en Blanco']).to eq(0)
    expect(seats['Falange Española de las JONS']).to eq(0)
    expect(seats['Sobirania per a les Illes']).to eq(0)
    expect(seats['Som Valencians']).to eq(0)
    expect(seats['Ciudadanos de Centro Democrático']).to eq(0)
    expect(seats['Partit Comunista del Poble de Catalunya']).to eq(0)
    expect(seats['Solidaridad y Autogestión Internacionalista']).to eq(0)
    expect(seats['Partido Humanista']).to eq(0)
    expect(seats['Los Verdes Ecopacifistas']).to eq(0)
    expect(seats['Partido Libertario']).to eq(0)
    expect(seats['Ciudadanos de Centro Democrático–Candidatura Independiente']).to eq(0)
    expect(seats['Unión del Pueblo Leonés']).to eq(0)
    expect(seats['Partido Comunista Obrero Español']).to eq(0)
    expect(seats['Partido Somos Andaluces por Andalucía y los Pueblos']).to eq(0)
    expect(seats['Juntos por Canarias']).to eq(0)
    expect(seats['Partido Familia y Vida']).to eq(0)
    expect(seats['Ciudadanos Libres Unidos']).to eq(0)
    expect(seats['Plataforma per Catalunya']).to eq(0)
    expect(seats['Movimiento Aragonés Social']).to eq(0)
    expect(seats['Izquierda Anticapitalista Revolucionaria']).to eq(0)
    expect(seats['Unidad del Pueblo']).to eq(0)
    expect(seats['Partido Regionalista del País Leonés']).to eq(0)
    expect(seats['Libertate Nafarra']).to eq(0)
    expect(seats['Renovació Política']).to eq(0)
    expect(seats['Independientes por Aragón']).to eq(0)
    expect(seats['ENTABAN']).to eq(0)
    expect(seats['Iniciativa Merindades de Castilla']).to eq(0)
    expect(seats['Partido Unionista Estado de España']).to eq(0)
    expect(seats['La Falange']).to eq(0)
    expect(seats['Alianza de Centro Democrático']).to eq(0)
    expect(seats['La Fuerza de los Mayores de España']).to eq(0)
    expect(seats['Hegoalde Rioja–Libertad Navarra']).to eq(0)
    expect(seats['Unión de Todos']).to eq(0)
  end
end

describe Sapor::Spain, '#threshold' do
  it 'returns a threshold of 3%' do
    expect(Sapor::Spain.instance.threshold).to eq(0.03)
  end
end
