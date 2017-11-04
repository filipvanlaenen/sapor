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

describe Sapor::Belgium, '#coalitions' do
  def belgian_coalitions
    Sapor::Belgium.instance.coalitions
  end

  it 'returns the cabinet of Charles Michel as a coalition to track' do
    expect(belgian_coalitions).to include(['CD&V', 'MR', 'N-VA', 'Open Vld'])
  end

  it 'returns the cabinet of Charles Michel extended with cdH as a coalition' \
     ' to track' do
    expect(belgian_coalitions).to include(['cdH', 'CD&V', 'MR', 'N-VA',
                                           'Open Vld'])
  end

  it 'returns a center-right coalition as a coalition to track' do
    expect(belgian_coalitions).to include(['cdH', 'CD&V', 'MR', 'Open Vld'])
  end

  it 'returns a center-left coalition as a coalition to track' do
    expect(belgian_coalitions).to include(['cdH', 'CD&V', 'PS', 'sp.a'])
  end

  it 'returns a so-called tripartite as a coalition to track' do
    expect(belgian_coalitions).to include(['cdH', 'CD&V', 'MR', 'Open Vld',
                                           'PS', 'sp.a'])
  end

  it 'returns a so-called purple coalition as a coalition to track' do
    expect(belgian_coalitions).to include(['MR', 'Open Vld', 'PS', 'sp.a'])
  end

  it 'returns a so-called purple-green coalition as a coalition to track' do
    expect(belgian_coalitions).to include(['Ecolo', 'Groen', 'MR', 'Open Vld',
                                           'PS', 'sp.a'])
  end

  it 'returns a so-called rainbow coalition as a coalition to track' do
    expect(belgian_coalitions).to include(['cdH', 'CD&V', 'Ecolo', 'Groen',
                                           'PS', 'sp.a'])
  end

  it 'returns an extended center-left coalition as a coalition to track' do
    expect(belgian_coalitions).to include(['cdH', 'CD&V', 'Ecolo', 'Groen',
                                           'PS', 'PTB-GO!', 'PVDA+', 'sp.a'])
  end

  it 'returns the entire center-left opposition to the cabinet of Charles' \
     ' Michel as a coalition to track' do
    expect(belgian_coalitions).to include(['cdH', 'Ecolo', 'Groen', 'PS',
                                           'PTB-GO!', 'PVDA+', 'sp.a'])
  end

  it 'returns a so-called color party coalition as a coalition to track' do
    expect(belgian_coalitions).to include(['cdH', 'CD&V', 'Ecolo', 'Groen',
                                           'MR', 'Open Vld', 'PS', 'sp.a'])
  end
end

describe Sapor::Belgium, '#threshold' do
  it 'returns a threshold of 5%' do
    expect(Sapor::Belgium.instance.threshold).to eq(0.05)
  end
end
