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

SOURCE = '2020-01-01_partifordeling_1_st_2017.csv'.freeze
TARGET = '../../lib/sapor/regional_data/norway-20170911.psv'.freeze

parties = []
total_votes = 0
File.open(TARGET, 'w') do |output|
  output.puts '# Statistical Analysis of Polling Results (SAPoR)'
  output.puts '# Copyright (C) 2020 Filip van Laenen <f.a.vanlaenen@ieee.org>'
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
  File.open(SOURCE).each do |line|
    next if line.start_with?('Fylkenummer')
    elements = line.chomp.split(';')
    constituency = elements[1]
    party = elements[7]
    next if party == 'Blanke'
    parties << party unless parties.include?(party)
    votes = elements[12].to_i
    total_votes += votes
    output.puts "#{constituency} | #{party} | #{votes}"
  end
end
puts 'Parties: ' + parties.sort.join(', ')
puts "Total votes: #{total_votes}"
