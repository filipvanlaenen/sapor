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

def tetrachotomy(max_error = 0.01)
  dichotomies = Sapor::Dichotomies.new({ 'Red' => 1, 'Green' => 2, 'Blue' => 3,
                                         'Yellow' => 6 }, 1000)
  dichotomies.refine
  dichotomies.refine
  dichotomies.refine
  Sapor::Polychotomy.new(%w(Red Green Blue Yellow), dichotomies, max_error)
end

describe Sapor::Polychotomy, '#new' do
  it 'extracts the 99.99% confidence intervals as ranges for max 1% error' do
    expect(tetrachotomy.range('Red').size).to eq(17)
    expect(tetrachotomy.range('Green').size).to eq(20)
    expect(tetrachotomy.range('Blue').size).to eq(21)
    expect(tetrachotomy.range('Yellow').size).to eq(23)
  end

  it 'extracts the 99.9999% confidence intervals as ranges for max 0.1%' \
     ' error' do
    expect(tetrachotomy(0.001).range('Red').size).to eq(21)
    expect(tetrachotomy(0.001).range('Green').size).to eq(22)
    expect(tetrachotomy(0.001).range('Blue').size).to eq(24)
    expect(tetrachotomy(0.001).range('Yellow').size).to eq(25)
  end

  it 'sets the incrementer for every choice' do
    expect(tetrachotomy.incrementer('Red')).to eq(1)
    expect(tetrachotomy.incrementer('Green')).to eq(11)
    expect(tetrachotomy.incrementer('Blue')).to eq(13)
    expect(tetrachotomy.incrementer('Yellow')).to eq(19)
  end

  # TODO: A test case where one or more ranges have to be extended
end

describe Sapor::Polychotomy, '#no_of_simulations' do
  it 'is 0 by default (no refinement)' do
    polychotomy = tetrachotomy
    expect(polychotomy.no_of_simulations).to eq(0)
  end

  it 'is 1 after 1 refinement' do
    polychotomy = tetrachotomy
    polychotomy.refine
    expect(polychotomy.no_of_simulations).to eq(1)
  end

  it 'is 2 after 2 refinements' do
    polychotomy = tetrachotomy
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.no_of_simulations).to eq(2)
  end

  it 'is 4 after 3 refinements' do
    polychotomy = tetrachotomy
    polychotomy.refine
    polychotomy.refine
    polychotomy.refine
    expect(polychotomy.no_of_simulations).to eq(4)
  end

  # TODO: A test case that runs all simulations
end

describe Sapor::Polychotomy, '#no_of_data_points' do
  it 'is 0 by default (no refinement)' do
    polychotomy = tetrachotomy
    expect(polychotomy.no_of_data_points).to eq(0)
  end

  it 'is 1 after 1 refinement' do
    polychotomy = tetrachotomy
    polychotomy.refine
    # TODO: Find out what it really is, larger than no_of_simulations
    expect(polychotomy.no_of_data_points).to eq(1)
  end

  it 'is 2 after 2 refinements' do
    polychotomy = tetrachotomy
    polychotomy.refine
    polychotomy.refine
    # TODO: Find out what it really is, larger than no_of_simulations
    expect(polychotomy.no_of_data_points).to eq(2)
  end

  it 'is 4 after 3 refinements' do
    polychotomy = tetrachotomy
    polychotomy.refine
    polychotomy.refine
    polychotomy.refine
    # TODO: Find out what it really is, larger than no_of_simulations
    expect(polychotomy.no_of_data_points).to eq(4)
  end

  # TODO: A test case that runs all the simulations
end

describe Sapor::Polychotomy, '#error_estimate' do
  it 'is 1 by default (no refinement)' do
    polychotomy = tetrachotomy
    expect(polychotomy.error_estimate).to eq(1.0)
  end

  it 'is 1 after the first refinement' do
    polychotomy = tetrachotomy
    polychotomy.refine
    expect(polychotomy.error_estimate).to eq(1.0)
  end

  it 'is at least the difference between the most probable fractions (two' \
     ' refinements)' do
    polychotomy = tetrachotomy
    polychotomy.refine
    polychotomy.refine
    # TODO: Find out what it really is
    expect(polychotomy.error_estimate).to eq(1.0)
  end
end
