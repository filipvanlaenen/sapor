# frozen_string_literal: true

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

describe Sapor::Cyprus, '#area_code' do
  it 'returns CY as the area code' do
    expect(Sapor::Cyprus.instance.area_code).to eq('CY')
  end
end

describe Sapor::Cyprus, '#no_of_seats' do
  it 'returns 56 as the number of seats' do
    expect(Sapor::Cyprus.instance.no_of_seats).to eq(56)
  end
end

describe Sapor::Cyprus, '#population_size' do
  it 'returns a population size of 351,389' do
    expect(Sapor::Cyprus.instance.population_size).to \
      eq(351_389)
  end
end

describe Sapor::Cyprus, '#seats' do
  it 'calculates the number of seats for the election of 2016' do
    results = { 'Δημοκρατικός Συναγερμός' => 107_825,
                'Ανορθωτικό Κόμμα Εργαζόμενου Λαού' => 90_204,
                'Δημοκρατικό Κόμμα' => 50_923,
                'Κίνημα Σοσιαλδημοκρατών' => 21_732,
                'Συμμαχία Πολιτών' => 21_114,
                'Κίνημα Αλληλεγγύη' => 18_424,
                'Κίνημα Οικολόγων–Συνεργασία Πολιτών' => 16_909,
                'Εθνικό Λαϊκό Μέτωπο' => 13_041,
                'Animal Party Cyprus' => 4_088,
                'People‘s Breath' => 3_072,
                'Flag Social Movement' => 2_033,
                'Union of Fighters for Justice' => 983,
                'Independents' => 1_041 }
    seats = Sapor::Cyprus.instance.seats(results)
    expect(seats['Δημοκρατικός Συναγερμός']).to eq(18)
    expect(seats['Ανορθωτικό Κόμμα Εργαζόμενου Λαού']).to eq(16 - 1)
    expect(seats['Δημοκρατικό Κόμμα']).to eq(9 - 1)
    expect(seats['Κίνημα Σοσιαλδημοκρατών']).to eq(3 + 1)
    expect(seats['Συμμαχία Πολιτών']).to eq(3)
    expect(seats['Κίνημα Αλληλεγγύη']).to eq(3)
    expect(seats['Κίνημα Οικολόγων–Συνεργασία Πολιτών']).to eq(2 + 1)
    expect(seats['Εθνικό Λαϊκό Μέτωπο']).to eq(2)
    expect(seats['Animal Party Cyprus']).to eq(0)
    expect(seats['People‘s Breath']).to eq(0)
    expect(seats['Flag Social Movement']).to eq(0)
    expect(seats['Union of Fighters for Justice']).to eq(0)
    expect(seats['Independents']).to eq(0)
  end

  it 'does no allocate seats to Other' do
    results = { 'Δημοκρατικός Συναγερμός' => 107_825,
                'Ανορθωτικό Κόμμα Εργαζόμενου Λαού' => 90_204,
                'Δημοκρατικό Κόμμα' => 50_923,
                'Κίνημα Σοσιαλδημοκρατών' => 21_732,
                'Συμμαχία Πολιτών' => 21_114,
                'Κίνημα Αλληλεγγύη' => 18_424,
                'Κίνημα Οικολόγων–Συνεργασία Πολιτών' => 16_909,
                'Εθνικό Λαϊκό Μέτωπο' => 13_041,
                'Other' => 4_088 + 3_072 + 2_033 + 983 + 1_041 }
    seats = Sapor::Cyprus.instance.seats(results)
    expect(seats['Δημοκρατικός Συναγερμός']).to eq(18)
    expect(seats['Ανορθωτικό Κόμμα Εργαζόμενου Λαού']).to eq(16 - 1)
    expect(seats['Δημοκρατικό Κόμμα']).to eq(9 - 1)
    expect(seats['Κίνημα Σοσιαλδημοκρατών']).to eq(3 + 1)
    expect(seats['Συμμαχία Πολιτών']).to eq(3)
    expect(seats['Κίνημα Αλληλεγγύη']).to eq(3)
    expect(seats['Κίνημα Οικολόγων–Συνεργασία Πολιτών']).to eq(2 + 1)
    expect(seats['Εθνικό Λαϊκό Μέτωπο']).to eq(2)
    expect(seats['Other']).to eq(0)
  end
end
