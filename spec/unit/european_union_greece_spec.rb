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

describe Sapor::EuropeanUnionGreece, '#area_code' do
  it 'returns EU[GR] as the area code' do
    expect(Sapor::EuropeanUnionGreece.instance.area_code).to eq('EU[GR]')
  end
end

describe Sapor::EuropeanUnionGreece, '#no_of_seats' do
  it 'returns 21 as the number of seats' do
    expect(Sapor::EuropeanUnionGreece.instance.no_of_seats).to eq(21)
  end
end

describe Sapor::EuropeanUnionGreece, '#population_size' do
  it 'returns a population size of 5,716,472' do
    expect(Sapor::EuropeanUnionGreece.instance.population_size).to \
      eq(5_716_472)
  end
end

describe Sapor::EuropeanUnionGreece, '#seats' do
  it 'calculates the number of seats for the election of 2014' do
    results = { 'Συνασπισμός Ριζοσπαστικής Αριστεράς (GUE/NGL)' => 1_518_608,
                'Νέα Δημοκρατία (EPP)' => 1_295_967,
                'Χρυσή Αυγή (—)' => 536_409,
                'Ελιά–Δημοκρατική Παράταξη (S&D)' => 457_573,
                'Το Ποτάμι (S&D)' => 376_629,
                'Κομμουνιστικό Κόμμα Ελλάδας (—)' => 347_467,
                'Ανεξάρτητοι Έλληνες (ECR)' => 197_536,
                'Λαϊκός Ορθόδοξος Συναγερμός (EFDD)' => 153_920,
                'Έλληνες Ευρωπαίοι Πολίτες (—)' => 82_220,
                'Δημοκρατική Αριστερά–Προοδευτική Συνεργασία (S&D)' => 68_695,
                'Ένωση για την Πατρίδα και τον Λαό (—)' => 59_291,
                'Κόμμα Ελλήνων Κυνηγών (—)' => 57_000,
                'Γέφυρες (ALDE)' => 51_542,
                'Οικολόγοι Πράσινοι–Κόμμα Πειρατών Ελλάδας (Greens/EFA)' =>
                  51_573,
                'Ενιαίο Παλλαϊκό Μέτωπο (—)' => 49_293,
                'Παναθηναϊκό Κίνημα (—)' => 42_203,
                'Αντικαπιταλιστική Αριστερή Συνεργασία για την Ανατροπή (—)' =>
                  41_131,
                'Κόμμα Ισότητας, Ειρήνης και Φιλίας (—)' => 42_620,
                'Ένωση Κεντρώων (ALDE)' => 36_837,
                'Κοινωνία–Πολιτική παράταξη συνεχιστών του Καποδίστρια (—)' =>
                  34_475,
                'Αγροτικό Κτηνοτροφικό Κόμμα Ελλάδας (—)' => 32_366,
                'ΠΡΑΣΙΝΟΙ - Αλληλεγγύη, Δημιουργία, Οικολογία (Greens/EFA)' =>
                  28_390,
                'Κοινωνία Αξιών (—)' => 20_882,
                'Σύνδεσμος Εθνικής Ενότητας (—)' => 17_110,
                'Σχέδιο Β (—)' => 11_331,
                'Σοσιαλιστικό Κόμμα (—)' => 11_062,
                'Μαρξιστικό-Λενινιστικό Κομμουνιστικό Κόμμα Ελλάδας (—)' =>
                  10_784,
                'Κολλάτος–Ανεξάρτητο Πολιτικό Κίνημα–Οικολογικό Ελληνικό (—)' =>
                  8_989,
                'Λαϊκές Ενώσεις Υπερκομματικών Κοινωνικών Ομάδων (—)' => 8_891,
                'ΔΡΑΧΜΗ (—)' => 8_791,
                'Εθνικό Μέτωπο (—)' => 8_789,
                'Ελπίδα Πολιτείας (—)' => 6_787,
                'Ευρωπαϊκή Ελεύθερη Συμμαχία–Ουράνιο Τόξο (Greens/EFA)' =>
                  5_754,
                'Έλληνες Οικολόγοι (—)' => 5_578,
                'Πατριωτική ΄Ενωση–Ελληνική Λαϊκή Συσπείρωση (—)' => 4_738,
                'Εργατικό Επαναστατικό Κόμμα (—)' => 4_511,
                'Αγωνιστικό Σοσιαλιστικό Κόμμα Ελλάδας (—)' => 3_637,
                'Οργάνωση Κομμουνιστών Διεθνιστών Ελλάδας (—)' => 3_052,
                'Οργάνωση για την Ανασυγκρότηση του Κομμουνιστικού Κόμματος' \
                  ' Ελλάδας (—)' => 2_860,
                'Κίνημα Εθνικής Αντίστασης (—)' => 2_525,
                'Εθνική Αυγή (—)' => 303,
                'Πανεργατικό Εργατικό Κίνημα Ελλάδος (—)' => 198,
                'ΕΛΕΥΘΕΡΙΑ' => 12 }
    seats = Sapor::EuropeanUnionGreece.instance.seats(results)
    expect(seats['Συνασπισμός Ριζοσπαστικής Αριστεράς (GUE/NGL)']).to eq(6)
    expect(seats['Νέα Δημοκρατία (EPP)']).to eq(5)
    expect(seats['Χρυσή Αυγή (—)']).to eq(3)
    expect(seats['Ελιά–Δημοκρατική Παράταξη (S&D)']).to eq(2)
    expect(seats['Το Ποτάμι (S&D)']).to eq(2)
    expect(seats['Κομμουνιστικό Κόμμα Ελλάδας (—)']).to eq(2)
    expect(seats['Ανεξάρτητοι Έλληνες (ECR)']).to eq(1)
    expect(seats['Λαϊκός Ορθόδοξος Συναγερμός (EFDD)']).to eq(0)
    expect(seats['Έλληνες Ευρωπαίοι Πολίτες (—)']).to eq(0)
    expect(seats['Δημοκρατική Αριστερά–Προοδευτική Συνεργασία (S&D)']).to eq(0)
    expect(seats['Ένωση για την Πατρίδα και τον Λαό (—)']).to eq(0)
    expect(seats['Κόμμα Ελλήνων Κυνηγών (—)']).to eq(0)
    expect(seats['Γέφυρες (ALDE)']).to eq(0)
    expect(seats['Οικολόγοι Πράσινοι–Κόμμα Πειρατών Ελλάδας (Greens/EFA)']).to \
      eq(0)
    expect(seats['Ενιαίο Παλλαϊκό Μέτωπο (—)']).to eq(0)
    expect(seats['Παναθηναϊκό Κίνημα (—)']).to eq(0)
    expect(seats['Αντικαπιταλιστική Αριστερή Συνεργασία για την Ανατροπή' \
      ' (—)']).to eq(0)
    expect(seats['Κόμμα Ισότητας, Ειρήνης και Φιλίας (—)']).to eq(0)
    expect(seats['Ένωση Κεντρώων (ALDE)']).to eq(0)
    expect(seats['Κοινωνία–Πολιτική παράταξη συνεχιστών του Καποδίστρια' \
      ' (—)']).to eq(0)
    expect(seats['Αγροτικό Κτηνοτροφικό Κόμμα Ελλάδας (—)']).to eq(0)
    expect(seats['ΠΡΑΣΙΝΟΙ - Αλληλεγγύη, Δημιουργία, Οικολογία' \
      ' (Greens/EFA)']).to eq(0)
    expect(seats['Κοινωνία Αξιών (—)']).to eq(0)
    expect(seats['Σύνδεσμος Εθνικής Ενότητας (—)']).to eq(0)
    expect(seats['Σχέδιο Β (—)']).to eq(0)
    expect(seats['Σοσιαλιστικό Κόμμα (—)']).to eq(0)
    expect(seats['Μαρξιστικό-Λενινιστικό Κομμουνιστικό Κόμμα Ελλάδας (—)']).to \
      eq(0)
    expect(seats['Κολλάτος–Ανεξάρτητο Πολιτικό Κίνημα–Οικολογικό Ελληνικό' \
      ' (—)']).to eq(0)
    expect(seats['Λαϊκές Ενώσεις Υπερκομματικών Κοινωνικών Ομάδων (—)']).to \
      eq(0)
    expect(seats['ΔΡΑΧΜΗ (—)']).to eq(0)
    expect(seats['Εθνικό Μέτωπο (—)']).to eq(0)
    expect(seats['Ελπίδα Πολιτείας (—)']).to eq(0)
    expect(seats['Ευρωπαϊκή Ελεύθερη Συμμαχία–Ουράνιο Τόξο (Greens/EFA)']).to \
      eq(0)
    expect(seats['Έλληνες Οικολόγοι (—)']).to eq(0)
    expect(seats['Πατριωτική ΄Ενωση–Ελληνική Λαϊκή Συσπείρωση (—)']).to eq(0)
    expect(seats['Εργατικό Επαναστατικό Κόμμα (—)']).to eq(0)
    expect(seats['Αγωνιστικό Σοσιαλιστικό Κόμμα Ελλάδας (—)']).to eq(0)
    expect(seats['Οργάνωση Κομμουνιστών Διεθνιστών Ελλάδας (—)']).to eq(0)
    expect(seats['Οργάνωση για την Ανασυγκρότηση του Κομμουνιστικού Κόμματος' \
      ' Ελλάδας (—)']).to eq(0)
    expect(seats['Κίνημα Εθνικής Αντίστασης (—)']).to eq(0)
    expect(seats['Εθνική Αυγή (—)']).to eq(0)
    expect(seats['Πανεργατικό Εργατικό Κίνημα Ελλάδος (—)']).to eq(0)
    expect(seats['ΕΛΕΥΘΕΡΙΑ']).to eq(0)
  end
end
