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

describe Sapor::EuropeanUnion27Spain, '#area_code' do
  it 'returns EU27[ES] as the area code' do
    expect(Sapor::EuropeanUnion27Spain.instance.area_code).to \
      eq('EU27[ES]')
  end
end

describe Sapor::EuropeanUnion27Spain, '#no_of_seats' do
  it 'returns 59 as the number of seats' do
    expect(Sapor::EuropeanUnion27Spain.instance.no_of_seats).to eq(59)
  end
end

describe Sapor::EuropeanUnion27Spain, '#population_size' do
  it 'returns a population size of 22,410,049' do
    expect(Sapor::EuropeanUnion27Spain.instance.population_size).to \
      eq(22_410_049)
  end
end

describe Sapor::EuropeanUnion27Spain, '#seats' do
  it 'calculates the number of seats using the votes of the 2014 election' do
    results = { 'Partido Popular (EPP)' => 4_098_339,
                'Partido Socialista Obrero Español (S&D)' => 3_614_232,
                'La Izquierda Plural (GUE/NGL)' => 1_575_308,
                'Podemos (GUE/NGL)' => 1_253_837,
                'Unión Progreso y Democracia (ALDE)' => 1_022_232,
                'Coalición por Europa (ALDE)' => 851_971,
                'L’Esquerra pel Dret a Decidir (Greens/EFA)' => 630_072,
                'Ciudadanos–Partido de la Ciudadanía (ALDE)' => 497_146,
                'Los Pueblos Deciden (GUE/NGL)' => 326_464,
                'Primavera Europea (Greens/EFA)' => 302_266,
                'Vox (ECR)' => 246_833,
                'Partido Animalista Contra el Maltrato Animal (—)' => 177_499,
                'Escaños en Blanco  (—)' => 115_682,
                'Movimiento de Renovación Democrática de la Ciudadanía (—)' => \
                  105_666,
                'Partido X (—)' => 100_561,
                'Partido Andalucista (Greens/EFA)' => 49_523,
                'Confederación Pirata (—)' => 38_690,
                'Foro de Ciudadanos (—)' => 32_962,
                'Agrupación de Electores de Discapacitados y Enfermedades' \
                  ' Raras (—)' => 32_833,
                'Recortes Cero (—)' => 30_827,
                'Partido Comunista de los Pueblos de España (—)' => 29_324,
                'Iniciativa Feminista (—)' => 23_140,
                'Falange Española de las JONS (—)' => 21_687,
                'Ciudadanos Libres Unidos (—)' => 18_287,
                'Impulso Social (—)' => 17_879,
                'La España en Marcha (—)' => 17_035,
                'Partido Humanista (—)' => 14_896,
                'Democracia Nacional (—)' => 13_079,
                'Proyecto Europa (—)' => 11_502,
                'Partido da Terra (—)' => 9_940,
                'Partido de la Libertad Individual (—)' => 9_670,
                'Movimiento Social Republicano (—)' => 8_909,
                'Extremadura Unida (—)' => 8_821,
                'Alternativa Republicana (—)' => 8_593,
                'Por la República, Por la Ruptura con la Unión Europea (—)' => \
                  8_309,
                'Solidaridad y Autogestión Internacionalista (—)' => 6_929,
                'Salamanca-Zamora-León (—)' => 6_759,
                'Extremeños por Europa Coalición electoral (—)' => 5_967,
                'Movimiento Corriente Roja (—)' => 4_980 }
    seats = Sapor::EuropeanUnion27Spain.instance.seats(results)
    expect(seats['Partido Popular (EPP)']).to eq(16 + 2)
    expect(seats['Partido Socialista Obrero Español (S&D)']).to eq(14 + 2)
    expect(seats['La Izquierda Plural (GUE/NGL)']).to eq(6)
    expect(seats['Podemos (GUE/NGL)']).to eq(5)
    expect(seats['Unión Progreso y Democracia (ALDE)']).to eq(4)
    expect(seats['Coalición por Europa (ALDE)']).to eq(3)
    expect(seats['L’Esquerra pel Dret a Decidir (Greens/EFA)']).to eq(2)
    expect(seats['Ciudadanos–Partido de la Ciudadanía (ALDE)']).to eq(2)
    expect(seats['Los Pueblos Deciden (GUE/NGL)']).to eq(1)
    expect(seats['Primavera Europea (Greens/EFA)']).to eq(1)
    expect(seats['Vox (ECR)']).to eq(0 + 1)
    expect(seats['Partido Animalista Contra el Maltrato Animal (—)']).to eq(0)
    expect(seats['Escaños en Blanco  (—)']).to eq(0)
    expect(seats['Movimiento de Renovación Democrática de la Ciudadanía (—)']) \
      .to eq(0)
    expect(seats['Partido X (—)']).to eq(0)
    expect(seats['Partido Andalucista (Greens/EFA)']).to eq(0)
    expect(seats['Confederación Pirata (—)']).to eq(0)
    expect(seats['Foro de Ciudadanos (—)']).to eq(0)
    expect(seats['Agrupación de Electores de Discapacitados y Enfermedades' \
                 ' Raras (—)']).to eq(0)
    expect(seats['Recortes Cero (—)']).to eq(0)
    expect(seats['Partido Comunista de los Pueblos de España (—)']).to eq(0)
    expect(seats['Iniciativa Feminista (—)']).to eq(0)
    expect(seats['Falange Española de las JONS (—)']).to eq(0)
    expect(seats['Ciudadanos Libres Unidos (—)']).to eq(0)
    expect(seats['Impulso Social (—)']).to eq(0)
    expect(seats['La España en Marcha (—)']).to eq(0)
    expect(seats['Partido Humanista (—)']).to eq(0)
    expect(seats['Democracia Nacional (—)']).to eq(0)
    expect(seats['Proyecto Europa (—)']).to eq(0)
    expect(seats['Partido da Terra (—)']).to eq(0)
    expect(seats['Partido de la Libertad Individual (—)']).to eq(0)
    expect(seats['Movimiento Social Republicano (—)']).to eq(0)
    expect(seats['Extremadura Unida (—)']).to eq(0)
    expect(seats['Alternativa Republicana (—)']).to eq(0)
    expect(seats['Por la República, Por la Ruptura con la Unión Europea (—)']) \
      .to eq(0)
    expect(seats['Solidaridad y Autogestión Internacionalista (—)']).to eq(0)
    expect(seats['Salamanca-Zamora-León (—)']).to eq(0)
    expect(seats['Extremeños por Europa Coalición electoral (—)']).to eq(0)
    expect(seats['Movimiento Corriente Roja (—)']).to eq(0)
  end
end
