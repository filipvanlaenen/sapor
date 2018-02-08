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

describe Sapor::EuropeanUnionFrance, '#area_code' do
  it 'returns EU[FR] as the area code' do
    expect(Sapor::EuropeanUnionFrance.instance.area_code).to eq('EU[FR]')
  end
end

describe Sapor::EuropeanUnionFrance, '#no_of_seats' do
  it 'returns 74 as the number of seats' do
    expect(Sapor::EuropeanUnionFrance.instance.no_of_seats).to eq(74)
  end
end

describe Sapor::EuropeanUnionFrance, '#population_size' do
  it 'returns a population size of 18,955,636' do
    expect(Sapor::EuropeanUnionFrance.instance.population_size).to \
      eq(18_955_636)
  end
end

describe Sapor::EuropeanUnionFrance, '#seats' do
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
    seats = Sapor::EuropeanUnionFrance.instance.seats(results)
    expect(seats['Front national–Rassemblement bleu Marine  (ENF)']).to eq(20)
    expect(seats['Union pour un mouvement populaire (EPP)']).to eq(17)
    expect(seats['Parti socialiste–Parti radical de gauche (S&D)']).to eq(11)
    expect(seats['L’Alternative (ALDE)']).to eq(8)
    expect(seats['Europe Écologie Les Verts (Greens/EFA)']).to eq(7)
    expect(seats['Front de gauche–L’Union pour les Outremer (GUE/NGL)']).to \
      eq(5)
    expect(seats['Debout la République (—)']).to eq(3)
    expect(seats['Nouvelle Donne (—)']).to eq(2)
    expect(seats['Nous Citoyens (—)']).to eq(1)
    expect(seats['Lutte ouvrière (—)']).to eq(0)
    expect(seats['Alliance écologiste indépendante (—)']).to eq(0)
    expect(seats['Force vie']).to eq(0)
    expect(seats['Europe citoyenne (—)']).to eq(0)
    expect(seats['Parti du vote blanc (—)']).to eq(0)
  end
end
