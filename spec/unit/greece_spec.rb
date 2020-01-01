
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

describe Sapor::Greece, '#area_code' do
  it 'returns GR as the area code' do
    expect(Sapor::Greece.instance.area_code).to eq('GR')
  end
end

describe Sapor::Greece, '#no_of_seats' do
  it 'returns 300 as the number of seats' do
    expect(Sapor::Greece.instance.no_of_seats).to eq(300)
  end
end

describe Sapor::Greece, '#population_size' do
  it 'returns a population size of 5,769,542' do
    expect(Sapor::Greece.instance.population_size).to eq(5_769_542)
  end
end

describe Sapor::Greece, '#seats' do
  it 'calculates the number of seats for the election of 20 September 2015' \
     ' correctly' do
    greece = Sapor::Greece.instance
    results = { 'Συνασπισμός Ριζοσπαστικής Αριστεράς' => 1_925_904,
                'Νέα Δημοκρατία' => 1_526_205,
                'Χρυσή Αυγή' => 379_581,
                'Δημοκρατική Συμπαράταξη' => 341_390,
                'Κομμουνιστικό Κόμμα Ελλάδας' => 301_632,
                'Το Ποτάμι' => 222_166,
                'Ανεξάρτητοι Έλληνες' => 200_423,
                'Ένωση Κεντρώων' => 186_457,
                'Λαϊκή Ενότητα' => 155_242,
                'Αντικαπιταλιστική Αριστερή Συνεργασία για την Ανατροπή Εργατικό Επαναστατικό Κόμμα' => 46_096,
                'Ενιαίο Παλλαϊκό Μέτωπο' => 41_631,
                'Κοινωνία' => 35_534,
                'δημιουργία, ξανά!' => 28_936,
                'Δημοκρατικοί–Κοινωνία Αξιών–Κόμμα Πειρατών' => 15_257,
                'Κομμουνιστικό Κόμμα Ελλάδας (μ-λ)–Μ-Λ Κομμουνιστικό Κόμμα Ελλάδας' => 8_944,
                'Πατριωτική Ένωση–Ελληνική Λαϊκή Συσπείρωση' => 6_253,
                'Ελληνική Λαϊκή Δημοκρατική Απελευθέρωση' => 4_425,
                'Οργάνωση Κομμουνιστών Διεθνιστών Ελλάδας' => 2_372,
                'Οργάνωση για την Ανασυγκρότηση του Κ.Κ.Ε.' => 2_263,
                'Independent candidates' => 1_139 }
    seats = greece.seats(results)
    expect(seats['Συνασπισμός Ριζοσπαστικής Αριστεράς']).to eq(145)
    expect(seats['Νέα Δημοκρατία']).to eq(75)
    expect(seats['Χρυσή Αυγή']).to eq(18)
    expect(seats['Δημοκρατική Συμπαράταξη']).to eq(17)
    expect(seats['Κομμουνιστικό Κόμμα Ελλάδας']).to eq(15)
    expect(seats['Το Ποτάμι']).to eq(11)
    expect(seats['Ανεξάρτητοι Έλληνες']).to eq(10)
    expect(seats['Ένωση Κεντρώων']).to eq(9)
    expect(seats['Λαϊκή Ενότητα']).to eq(0)
    expect(seats['Αντικαπιταλιστική Αριστερή Συνεργασία για την Ανατροπή Εργατικό Επαναστατικό Κόμμα']).to eq(0)
    expect(seats['Ενιαίο Παλλαϊκό Μέτωπο']).to eq(0)
    expect(seats['Κοινωνία']).to eq(0)
    expect(seats['δημιουργία, ξανά!']).to eq(0)
    expect(seats['Δημοκρατικοί–Κοινωνία Αξιών–Κόμμα Πειρατών']).to eq(0)
    expect(seats['Κομμουνιστικό Κόμμα Ελλάδας (μ-λ)–Μ-Λ Κομμουνιστικό Κόμμα Ελλάδας']).to eq(0)
    expect(seats['Πατριωτική Ένωση–Ελληνική Λαϊκή Συσπείρωση']).to eq(0)
    expect(seats['Ελληνική Λαϊκή Δημοκρατική Απελευθέρωση']).to eq(0)
    expect(seats['Οργάνωση Κομμουνιστών Διεθνιστών Ελλάδας']).to eq(0)
    expect(seats['Οργάνωση για την Ανασυγκρότηση του Κ.Κ.Ε.']).to eq(0)
    expect(seats['Independent candidates']).to eq(0)
  end

  it 'calculates the number of seats for the election of 20 September 2015' \
     ' correctly with small parties aggregated as OTHER' do
    greece = Sapor::Greece.instance
    results = { 'Συνασπισμός Ριζοσπαστικής Αριστεράς' => 1_925_904,
                'Νέα Δημοκρατία' => 1_526_205,
                'Χρυσή Αυγή' => 379_581,
                'Δημοκρατική Συμπαράταξη' => 341_390,
                'Κομμουνιστικό Κόμμα Ελλάδας' => 301_632,
                'Το Ποτάμι' => 222_166,
                'Ανεξάρτητοι Έλληνες' => 200_423,
                'Ένωση Κεντρώων' => 186_457,
                Sapor::OTHER => 155_242 + 46_096 + 41_631 + 35_534 + 28_936 \
                                + 15_257 + 8_944 + 6_253 + 4_425 + 2_372 \
                                + 2_263 + 1_139 }
    seats = greece.seats(results)
    expect(seats['Συνασπισμός Ριζοσπαστικής Αριστεράς']).to eq(145)
    expect(seats['Νέα Δημοκρατία']).to eq(75)
    expect(seats['Χρυσή Αυγή']).to eq(18)
    expect(seats['Δημοκρατική Συμπαράταξη']).to eq(17)
    expect(seats['Κομμουνιστικό Κόμμα Ελλάδας']).to eq(15)
    expect(seats['Το Ποτάμι']).to eq(11)
    expect(seats['Ανεξάρτητοι Έλληνες']).to eq(10)
    expect(seats['Ένωση Κεντρώων']).to eq(9)
    expect(seats[Sapor::OTHER]).to eq(0)
  end
end

describe Sapor::Greece, '#threshold' do
  it 'returns a threshold of 3%' do
    expect(Sapor::Greece.instance.threshold).to eq(0.03)
  end
end
