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

describe Sapor::PseudoRandomMultiRangeEnumerator, '#each' do
  it 'sets the size correctly for one dimension' do
    enum = Sapor::PseudoRandomMultiRangeEnumerator.new([5]).each
    expect(enum.size).to eq(5)
  end

  it 'sets the size correctly for two dimensions' do
    enum = Sapor::PseudoRandomMultiRangeEnumerator.new([5, 3]).each
    expect(enum.size).to eq(15)
  end

  it 'returns a simple enumeration for one dimension' do
    enum = Sapor::PseudoRandomMultiRangeEnumerator.new([5]).each
    expect(enum.to_a).to eq([[0], [1], [2], [3], [4]])
  end

  it 'returns [0] as the first element for one dimension' do
    enum = Sapor::PseudoRandomMultiRangeEnumerator.new([5]).each
    expect(enum.next).to eq([0])
  end

  it 'returns [0, 0] as the first element for two dimensions' do
    enum = Sapor::PseudoRandomMultiRangeEnumerator.new([5, 3]).each
    expect(enum.next).to eq([0, 0])
  end

  it 'returns [1] as the second element for one dimension' do
    enum = Sapor::PseudoRandomMultiRangeEnumerator.new([5]).each
    enum.next
    expect(enum.next).to eq([1])
  end

  it 'returns [1, 2] as the second element of a 3×5 hyper-rectangle' do
    enum = Sapor::PseudoRandomMultiRangeEnumerator.new([3, 5]).each
    enum.next
    expect(enum.next).to eq([1, 2])
  end

  it 'returns [2, 1] as the second element of a 5×3 hyper-rectangle' do
    enum = Sapor::PseudoRandomMultiRangeEnumerator.new([5, 3]).each
    enum.next
    expect(enum.next).to eq([2, 1])
  end

  it 'returns [1, 3] as the second element of a 2×5 hyper-rectangle' do
    enum = Sapor::PseudoRandomMultiRangeEnumerator.new([2, 5]).each
    enum.next
    expect(enum.next).to eq([1, 3])
  end

  it 'returns [1, 2, 5] as the second element of a 9×9×9 hyper-rectangle' do
    enum = Sapor::PseudoRandomMultiRangeEnumerator.new([9, 9, 9]).each
    enum.next
    expect(enum.next).to eq([1, 2, 5])
  end

  it "raises an ArgumentError when it can't construct incrementers" do
    expect { Sapor::PseudoRandomMultiRangeEnumerator.new([3, 2]) }.to \
    raise_error(ArgumentError, 'Could not construct suitable incrementers.')
  end
end
