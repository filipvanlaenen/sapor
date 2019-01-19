
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

SOURCE = 'greece-2015.csv'.freeze
TARGET = '../../lib/sapor/regional_data/greece-20150920.psv'.freeze
PARTIES = { 'Coalition of the Radical Left (SYRIZA)' => 'Συνασπισμός Ριζοσπαστικής Αριστεράς',
            'New Democracy (ND)' => 'Νέα Δημοκρατία',
            'Golden Dawn (XA)' => 'Χρυσή Αυγή',
            'Democratic Coalition (PASOK-DIMAR)' => 'Δημοκρατική Συμπαράταξη',
            'Independent Greeks (ANEL)' => 'Ανεξάρτητοι Έλληνες',
            'Union of Centrists (EK)' => 'Ένωση Κεντρώων',
            'The River (To Potami)' => 'Το Ποτάμι',
            'Communist Party of Greece (KKE)' => 'Κομμουνιστικό Κόμμα Ελλάδας',
            'Popular Unity (LAE)' => 'Λαϊκή Ενότητα',
            'Others' => 'Others' }.freeze
DISTRICTS = { '01' => 'Έβρου',
              '02' => 'Ροδόπης',
              '03' => 'Ξάνθης',
              '04' => 'Δράμας',
              '05' => 'Καβάλας',
              '06' => 'Α\' Θεσσαλονίκης',
              '07' => 'Β\' Θεσσαλονίκης',
              '08' => 'Σερρών',
              '09' => 'Χαλκιδικής',
              '10' => 'Κιλκίς',
              '11' => 'Πέλλας',
              '12' => 'Ημαθίας',
              '13' => 'Πιερίας',
              '14' => 'Φλώρινας',
              '15' => 'Κοζάνης',
              '16' => 'Καστοριάς',
              '17' => 'Γρεβενών',
              '18' => 'Ιωαννίνων',
              '19' => 'Άρτας',
              '20' => 'Θεσπρωτίας',
              '21' => 'Πρέβεζας',
              '22' => 'Λάρισας',
              '23' => 'Μαγνησίας',
              '24' => 'Τρικάλων',
              '25' => 'Καρδίτσας',
              '26' => 'Κέρκυρας',
              '27' => 'Λευκάδας',
              '28' => 'Κεφαλληνίας',
              '29' => 'Ζακύνθου',
              '30' => 'Αιτωλοακαρνανίας',
              '31' => 'Αχαίας',
              '32' => 'Ηλείας',
              '33' => 'Φθιώτιδας',
              '34' => 'Ευρυτανίας',
              '35' => 'Φωκίδας',
              '36' => 'Βοιωτίας',
              '37' => 'Έυβοιας',
              '38' => 'Α\' Αθηνών',
              '39' => 'Β\' Αθηνών',
              '40' => 'Α\' Πειραιώς',
              '41' => 'Β\' Πειραιώς',
              '42' => 'Λοιπής Αττικής',
              '43' => 'Κορινθίας',
              '44' => 'Αργολίδος',
              '45' => 'Αρκαδίας',
              '46' => 'Μεσσηνίας',
              '47' => 'Λακωνίας',
              '48' => 'Λέσβου',
              '49' => 'Χίου',
              '50' => 'Σάμου',
              '51' => 'Κυκλάδων',
              '52' => 'Δωδεκανήσου',
              '53' => 'Χανίων',
              '54' => 'Ρεθύμνης',
              '55' => 'Ηρακλείου',
              '56' => 'Λασιθίου' }.freeze

File.open(TARGET, 'w') do |output|
  output.puts '# Statistical Analysis of Polling Results (SAPoR)'
  output.puts '# Copyright (C) 2019 Filip van Laenen <f.a.vanlaenen@ieee.org>'
  output.puts '#'
  output.puts '# This file is part of SAPoR.'
  output.puts '#'
  output.puts '# SAPoR is free software: you can redistribute it and/or' \
              ' modify it under the'
  output.puts '# terms of the GNU General Public License as published by the' \
              ' Free Software'
  output.puts '# Foundation, either version 3 of the License, or (at your' \
              ' option) any later'
  output.puts '# version.'
  output.puts '#'
  output.puts '# SAPoR is distributed in the hope that it will be useful, but' \
              ' WITHOUT ANY'
  output.puts '# WARRANTY; without even the implied warranty of' \
              ' MERCHANTABILITY or FITNESS FOR'
  output.puts '# A PARTICULAR PURPOSE.  See the GNU General Public License' \
              ' for more details.'
  output.puts '#'
  output.puts '# You can find a copy of the GNU General Public License in' \
              ' /doc/gpl.txt'
  output.puts '#'
  output.puts '# Source: http://electionresources.org/gr/data/'
  output.puts '#'
  last_district = ''
  first_pass = false
  File.open(SOURCE).each do |line|
    next if line.chomp.start_with?('#')
    next if line.chomp.empty?
    elements = line.chomp.split(',').map(&:strip)
    district = elements[0]
    next if district.empty?
    unless district.eql?(last_district)
      output.puts
      first_pass = true
      last_district = district
    end
    party = elements[2]
    if first_pass
      first_pass = false if party.eql?('Others')
      next
    end
    next if ['Registered Electors', 'Voters', 'Blank and Invalid Votes',
             'Valid Votes'].include?(party)
    votes = elements[3]
    output.puts "#{DISTRICTS[district]} | #{PARTIES[party].ljust(35)} | " \
                "#{votes.rjust(6)}"
  end
end
