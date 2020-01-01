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

require 'spec_helper'

describe Sapor::EuropeanUnion27France, '#area_code' do
  it 'returns EU27[FR] as the area code' do
    expect(Sapor::EuropeanUnion27France.instance.area_code).to eq('EU27[FR]')
  end
end

describe Sapor::EuropeanUnion27France, '#no_of_seats' do
  it 'returns 79 as the number of seats' do
    expect(Sapor::EuropeanUnion27France.instance.no_of_seats).to eq(79)
  end
end

describe Sapor::EuropeanUnion27France, '#population_size' do
  it 'returns a population size of 22,655,174' do
    expect(Sapor::EuropeanUnion27France.instance.population_size).to \
      eq(22_655_174)
  end
end

describe Sapor::EuropeanUnion27France, '#seats' do
  it 'calculates the number of seats using the votes of the 2014 election' do
    results = { 'Front national–Rassemblement bleu Marine  (ENF)' => 4_712_461,
                'Union pour un mouvement populaire (EPP)' => 3_943_819,
                'Parti socialiste–Parti radical de gauche (S&D)' => 2_650_357,
                'L’Alternative (ALDE)' => 1_884_565,
                'Europe Écologie Les Verts (Greens/EFA)' => 1_696_442,
                'Front de gauche–L’Union pour les Outremer (GUE/NGL)' =>
                1_252_730,
                'Debout la République (—)' => 724_441,
                'Nouvelle Donne (—)' => 549_734, 'Nous Citoyens (—)' => 266_343,
                'Lutte ouvrière (—)' => 222_491,
                'Alliance écologiste indépendante (—)' => 211_759,
                'Force vie' => 138_708, 'Europe citoyenne (—)' => 127_849,
                'Parti du vote blanc (—)' => 110_090 }
    seats = Sapor::EuropeanUnion27France.instance.seats(results)
    expect(seats['Front national–Rassemblement bleu Marine  (ENF)']).to eq(22 + 1)
    expect(seats['Union pour un mouvement populaire (EPP)']).to eq(18 + 2)
    expect(seats['Parti socialiste–Parti radical de gauche (S&D)']).to eq(12 + 1)
    expect(seats['L’Alternative (ALDE)']).to eq(9)
    expect(seats['Europe Écologie Les Verts (Greens/EFA)']).to eq(8)
    expect(seats['Front de gauche–L’Union pour les Outremer (GUE/NGL)']).to \
      eq(5 + 1)
    expect(seats['Debout la République (—)']).to eq(0)
    expect(seats['Nouvelle Donne (—)']).to eq(0)
    expect(seats['Nous Citoyens (—)']).to eq(0)
    expect(seats['Lutte ouvrière (—)']).to eq(0)
    expect(seats['Alliance écologiste indépendante (—)']).to eq(0)
    expect(seats['Force vie']).to eq(0)
    expect(seats['Europe citoyenne (—)']).to eq(0)
    expect(seats['Parti du vote blanc (—)']).to eq(0)
  end
end
