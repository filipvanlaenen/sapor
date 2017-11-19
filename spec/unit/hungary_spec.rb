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

describe Sapor::Hungary, '#area_code' do
  it 'returns HU as the area code' do
    expect(Sapor::Hungary.instance.area_code).to eq('HU')
  end
end

describe Sapor::Hungary, '#coalitions' do
  def hungarian_coalitions
    Sapor::Hungary.instance.coalitions
  end

  it 'returns Fidesz–KDNP as a coalition to track' do
    expect(hungarian_coalitions).to include(['Fidesz–KDNP'])
  end

  it 'returns DK + Együtt + MLP + MSZP + PM as a coalition to track' do
    expect(hungarian_coalitions).to include(%w(DK Együtt MLP MSZP Párbeszéd))
  end
end

describe Sapor::Hungary, '#individual_constituencies_seats' do
  it 'calculates the number of seats in the individual constituencies for ' \
     'the election of 2014 correctly' do
    hungary = Sapor::Hungary.instance
    results = hungary \
              .overall_individual_constituencies_election_results_of_2014.dup
    results['MSZP'] = results['MSZP'] * 5
    results['DK'] = 1
    results['Együtt'] = 1
    results['MLP'] = 1
    results['Párbeszéd'] = 1
    seats = hungary.individual_constituencies_seats(results)
    expect(seats['Fidesz–KDNP']).to eq(87 + 9)
    expect(seats['MSZP']).to eq(8 + 1 + 1 + 0 + 0)
    expect(seats['Jobbik']).to eq(0)
    expect(seats['LMP']).to eq(0)
    expect(seats['Munkáspárt']).to eq(0)
    expect(seats['ZÖP']).to eq(0)
    expect(seats['Szociáldemokraták']).to eq(0)
    expect(seats['ÖP']).to eq(0)
    expect(seats['ÚDP']).to eq(0)
    expect(seats['ÚMP']).to eq(0)
  end
end

describe Sapor::Hungary, '#no_of_seats' do
  it 'returns 199 as the number of seats' do
    expect(Sapor::Hungary.instance.no_of_seats).to eq(199)
  end
end

describe Sapor::Hungary, '#party_list_seats' do
  it 'calculates the number of seats for the party lists for the election of ' \
     '2014 correctly' do
    hungary = Sapor::Hungary.instance
    results = { 'Fidesz–KDNP' => 2_264_780, 'MSZP' => 1_290_806, 'DK' => 0,
                'Együtt' => 0, 'MLP' => 0, 'Párbeszéd' => 0,
                'Jobbik' => 1_020_476, 'LMP' => 269_414, 'Munkáspárt' => 28_323,
                'ZÖP' => 18_557, 'Szociáldemokraták' => 15_073, 'ÖP' => 6_552,
                'ÚDP' => 2_100, 'ÚMP' => 1_578,
                'Other' => 23_507 + 22_219 + 14_085 + 12_563 + 10_969 + \
                           9_925 + 8_810 + 8_083 + 19_543 }
    seats = hungary.party_list_seats(results)
    expect(seats['Fidesz–KDNP']).to eq(44) # Was: 30 + 7
    expect(seats['MSZP']).to eq(25) # Was: 21 + 2 + 3 + 1 + 1
    expect(seats['Jobbik']).to eq(19) # Was: 23
    expect(seats['LMP']).to eq(5)
    expect(seats['Munkáspárt']).to eq(0)
    expect(seats['ZÖP']).to eq(0)
    expect(seats['Szociáldemokraták']).to eq(0)
    expect(seats['ÖP']).to eq(0)
    expect(seats['ÚDP']).to eq(0)
    expect(seats['ÚMP']).to eq(0)
  end
end

describe Sapor::Hungary, '#population_size' do
  it 'returns a population size of 5,047,363' do
    expect(Sapor::Hungary.instance.population_size).to eq(5_047_363)
  end
end

describe Sapor::Hungary, '#seats' do
  it 'calculates the number of seats for the election of 2014 correctly' do
    hungary = Sapor::Hungary.instance
    results = hungary \
              .overall_individual_constituencies_election_results_of_2014.dup
    results['MSZP'] = results['MSZP'] * 5
    results['DK'] = 1
    results['Együtt'] = 1
    results['MLP'] = 1
    results['PM'] = 1
    seats = hungary.seats(results)
    expect(seats['Fidesz–KDNP']).to eq(141)
    expect(seats['MSZP']).to eq(37)
    expect(seats['Jobbik']).to eq(21)
    expect(seats['LMP']).to eq(0)
    expect(seats['Munkáspárt']).to eq(0)
    expect(seats['ZÖP']).to eq(0)
    expect(seats['Szociáldemokraták']).to eq(0)
    expect(seats['ÖP']).to eq(0)
    expect(seats['ÚDP']).to eq(0)
    expect(seats['ÚMP']).to eq(0)
  end
end

describe Sapor::Hungary, '#threshold' do
  it 'returns a threshold of 5%' do
    expect(Sapor::Hungary.instance.threshold).to eq(0.05)
  end
end
