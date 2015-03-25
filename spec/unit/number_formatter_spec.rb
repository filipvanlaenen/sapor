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

#
# Test class that mixes in the PercentageFormatter.
#
class Formatter
  include Sapor::NumberFormatter
end

describe Sapor::NumberFormatter, '#three_digits_percentage' do
  it 'formats 10 as 1000%' do
    output = Formatter.new.three_digits_percentage(10)
    expect(output).to eq('1000%')
  end

  it 'formats 1 as 100%' do
    output = Formatter.new.three_digits_percentage(1)
    expect(output).to eq('100%')
  end

  it 'formats 0.9995 as 100%' do
    output = Formatter.new.three_digits_percentage(0.9995)
    expect(output).to eq('100%')
  end

  it 'formats 0.99949 as 99.9%' do
    output = Formatter.new.three_digits_percentage(0.99949)
    expect(output).to eq('99.9%')
  end

  it 'formats 0.09995 as 10.0%' do
    output = Formatter.new.three_digits_percentage(0.09995)
    expect(output).to eq('10.0%')
  end

  it 'formats 0.099949 as 9.99%' do
    output = Formatter.new.three_digits_percentage(0.099949)
    expect(output).to eq('9.99%')
  end

  it 'formats 0.009995 as 1.00%' do
    output = Formatter.new.three_digits_percentage(0.009995)
    expect(output).to eq('1.00%')
  end

  it 'formats 0.0099949 as 0.999%' do
    output = Formatter.new.three_digits_percentage(0.0099949)
    expect(output).to eq('0.999%')
  end

  it 'formats 0.000005 as 0.001%' do
    output = Formatter.new.three_digits_percentage(0.000005)
    expect(output).to eq('0.001%')
  end

  it 'formats 0.0000049 as 0%' do
    output = Formatter.new.three_digits_percentage(0.0000049)
    expect(output).to eq('0%')
  end

  it 'formats 0 as 0%' do
    output = Formatter.new.three_digits_percentage(0)
    expect(output).to eq('0%')
  end
end

describe Sapor::NumberFormatter, '#six_char_percentage' do
  it 'formats 1 as 100.0%' do
    output = Formatter.new.six_char_percentage(1)
    expect(output).to eq('100.0%')
  end

  it 'formats 0.9995 as 100.0%' do
    output = Formatter.new.six_char_percentage(0.9995)
    expect(output).to eq('100.0%')
  end

  it 'formats 0.99949 as 99.9%' do
    output = Formatter.new.six_char_percentage(0.99949)
    expect(output).to eq(' 99.9%')
  end

  it 'formats 0.0995 as 10.0%' do
    output = Formatter.new.six_char_percentage(0.0995)
    expect(output).to eq(' 10.0%')
  end

  it 'formats 0.09949 as 9.9%' do
    output = Formatter.new.six_char_percentage(0.09949)
    expect(output).to eq('  9.9%')
  end

  it 'formats 0.00951 as 1.0%' do
    output = Formatter.new.six_char_percentage(0.00951)
    expect(output).to eq('  1.0%')
  end

  it 'formats 0.00949 as 0.9%' do
    output = Formatter.new.six_char_percentage(0.00949)
    expect(output).to eq('  0.9%')
  end

  it 'formats 0.0005 as 0.1%' do
    output = Formatter.new.six_char_percentage(0.0005)
    expect(output).to eq('  0.1%')
  end

  it 'formats 0.00049 as 0.0%' do
    output = Formatter.new.six_char_percentage(0.00049)
    expect(output).to eq('  0.0%')
  end

  it 'formats 0 as 0.0%' do
    output = Formatter.new.six_char_percentage(0)
    expect(output).to eq('  0.0%')
  end
end

describe Sapor::NumberFormatter, '#with_thousands_separator' do
  it 'formats 0 as 0' do
    output = Formatter.new.with_thousands_separator(0)
    expect(output).to eq('0')
  end

  it 'formats 1 as 1' do
    output = Formatter.new.with_thousands_separator(1)
    expect(output).to eq('1')
  end

  it 'formats 999 as 999' do
    output = Formatter.new.with_thousands_separator(999)
    expect(output).to eq('999')
  end

  it 'formats 1_000 as 1,000' do
    output = Formatter.new.with_thousands_separator(1_000)
    expect(output).to eq('1,000')
  end

  it 'formats 999_999 as 999,999' do
    output = Formatter.new.with_thousands_separator(999_999)
    expect(output).to eq('999,999')
  end

  it 'formats 1_000_000 as 1,000,000' do
    output = Formatter.new.with_thousands_separator(1_000_000)
    expect(output).to eq('1,000,000')
  end

  it 'formats 999_999_999 as 999,999,999' do
    output = Formatter.new.with_thousands_separator(999_999_999)
    expect(output).to eq('999,999,999')
  end
end
