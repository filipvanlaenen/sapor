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

describe Sapor::EuropeanUnionCyprus, '#area_code' do
  it 'returns EU[CY] as the area code' do
    expect(Sapor::EuropeanUnionCyprus.instance.area_code).to eq('EU[CY]')
  end
end

describe Sapor::EuropeanUnionCyprus, '#no_of_seats' do
  it 'returns 6 as the number of seats' do
    expect(Sapor::EuropeanUnionCyprus.instance.no_of_seats).to eq(6)
  end
end

describe Sapor::EuropeanUnionCyprus, '#population_size' do
  it 'returns a population size of 258,914' do
    expect(Sapor::EuropeanUnionCyprus.instance.population_size).to \
      eq(258_914)
  end
end

describe Sapor::EuropeanUnionCyprus, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Δημοκρατικός Συναγερμός (EPP)' => 97_732,
                'Ανορθωτικό Κόμμα Εργαζόμενου Λαού (GUE/NGL)' => 69_852,
                'Δημοκρατικό Κόμμα (S&D)' => 28_044,
                'Κίνημα Σοσιαλδημοκρατών–Κίνημα Οικολόγων Περιβαλλοντιστών' \
                  ' (S&D)' => 19_894,
                'Συμμαχία Πολιτών (ALDE)' => 17_549,
                'Μήνυμα Ελπίδας (*)' => 9_907,
                'Εθνικό Λαϊκό Μέτωπο (*)' => 6_957,
                'Κόμμα για τα ζώα Κύπρου (*)' => 2_288,
                'Δικοινοτική Ριζοσπαστική Αριστερή Συνεργασία (*)' => 2_220 }
    seats = Sapor::EuropeanUnionCyprus.instance.seats(results)
    expect(seats['Δημοκρατικός Συναγερμός (EPP)']).to eq(2)
    expect(seats['Ανορθωτικό Κόμμα Εργαζόμενου Λαού (GUE/NGL)']).to eq(2)
    expect(seats['Δημοκρατικό Κόμμα (S&D)']).to eq(1)
    expect(seats['Κίνημα Σοσιαλδημοκρατών–Κίνημα Οικολόγων Περιβαλλοντιστών' \
                   ' (S&D)']).to eq(1)
    expect(seats['Συμμαχία Πολιτών (ALDE)']).to eq(0)
    expect(seats['Μήνυμα Ελπίδας (*)']).to eq(0)
    expect(seats['Εθνικό Λαϊκό Μέτωπο (*)']).to eq(0)
    expect(seats['Κόμμα για τα ζώα Κύπρου (*)']).to eq(0)
    expect(seats['Δικοινοτική Ριζοσπαστική Αριστερή Συνεργασία (*)']).to eq(0)
  end
end
