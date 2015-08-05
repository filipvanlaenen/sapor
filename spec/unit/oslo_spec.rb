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

describe Sapor::Oslo, '#area_code' do
  it 'returns NO-0301 as the area code' do
    expect(Sapor::Oslo.instance.area_code).to eq('NO-0301')
  end
end

describe Sapor::Oslo, '#coalitions' do
  it 'returns H+KrF+V, H+Frp, Frp+H+KrF+V, Ap+Sp+SV and Ap+Sp+SV+MDG+R as the coalitions to track' do
    expect(Sapor::Oslo.instance.coalitions).to include(['Høyre',
                                                        'Kristelig Folkeparti',
                                                        'Venstre'])
    expect(Sapor::Oslo.instance.coalitions).to include(['Fremskrittspartiet',
                                                        'Høyre'])
    expect(Sapor::Oslo.instance.coalitions).to include(['Fremskrittspartiet',
                                                        'Høyre',
                                                        'Kristelig Folkeparti',
                                                        'Venstre'])
    expect(Sapor::Oslo.instance.coalitions).to include(['Arbeiderpartiet',
                                                        'Senterpartiet',
                                                        'Sosialistisk Venstreparti'])
    expect(Sapor::Oslo.instance.coalitions).to include(['Arbeiderpartiet',
                                                        'Miljøpartiet de Grønne',
                                                        'Rødt',
                                                        'Senterpartiet',
                                                        'Sosialistisk Venstreparti'])
    expect(Sapor::Oslo.instance.coalitions).to include(['Kristelig Folkeparti',
                                                        'Senterpartiet',
                                                        'Venstre'])
  end
end

describe Sapor::Oslo, '#no_of_seats' do
  it 'returns 59 as the number of seats' do
    expect(Sapor::Oslo.instance.no_of_seats).to eq(59)
  end
end

describe Sapor::Oslo, '#population_size' do
  it 'returns a population size of 511,400' do
    expect(Sapor::Oslo.instance.population_size).to eq(511_400)
  end
end

describe Sapor::Oslo, '#seats' do
  it 'calculates the number of seats for the election of 2011 correctly' do
    oslo = Sapor::Oslo.instance
    results = { 'Høyre' => 103_426, 'Arbeiderpartiet' => 95_262,
                'Venstre' =>	22_879, 'Fremskrittspartiet' => 20_672,
                'Sosialistisk Venstreparti' => 17_772, 'Rødt' => 10_236,
                'Kristelig Folkeparti' => 7_094,
                'Miljøpartiet de Grønne' => 6_706, 'Senterpartiet' =>	1_482,
                'Pensjonistpartiet' => 989, 'Kristent Samlingsparti' => 220,
                'Det Liberale Folkepartiet' => 217,
                'Norges Kommunistiske Parti' => 192, 'Demokratene' => 187,
                'Kystpartiet' => 119 }
    seats = oslo.seats(results)
    expect(seats['Høyre']).to eq(22)
    expect(seats['Arbeiderpartiet']).to eq(20)
    expect(seats['Venstre']).to eq(5)    
    expect(seats['Fremskrittspartiet']).to eq(4)    
    expect(seats['Sosialistisk Venstreparti']).to eq(4)    
    expect(seats['Rødt']).to eq(2)    
    expect(seats['Kristelig Folkeparti']).to eq(1)    
    expect(seats['Miljøpartiet de Grønne']).to eq(1)    
    expect(seats['Senterpartiet']).to eq(0)    
    expect(seats['Pensjonistpartiet']).to eq(0)    
    expect(seats['Kristent Samlingsparti']).to eq(0)    
    expect(seats['Det Liberale Folkepartiet']).to eq(0)    
    expect(seats['Norges Kommunistiske Parti']).to eq(0)    
    expect(seats['Demokratene']).to eq(0)    
    expect(seats['Kystpartiet']).to eq(0)    
  end
end