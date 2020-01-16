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

SOURCE = '2016-04-28_general-election-2016-candidate-details-csv_en.csv'.freeze
TARGET = '../../lib/sapor/regional_data/ireland-20160226.psv'.freeze

votes_map = {}
candidates_map = {}
parties = []
total_votes = 0

File.open(SOURCE).each do |line|
  next if line.start_with?('Constituency')
  elements = line.force_encoding('ISO-8859-1').chomp.split(',')
  constituency = elements[0]
  unless votes_map.include?(constituency)
    votes_map[constituency] = {}
    candidates_map[constituency] = {}
  end
  party = elements[4]
  parties << party unless parties.include?(party)
  votes = elements[9].to_i
  if votes_map[constituency].include?(party)
    votes_map[constituency][party] += votes
    candidates_map[constituency][party] += 1
  else
    votes_map[constituency][party] = votes
    candidates_map[constituency][party] = 1
  end
  total_votes += votes
end


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
  votes_map.keys.sort.each do | constituency |
    votes_map[constituency].keys.sort.each do | party |
      output.puts "#{constituency} | #{party} | #{votes_map[constituency][party]} | #{candidates_map[constituency][party]}"
    end
  end
end
puts 'Parties: ' + parties.sort.join(', ')
puts "Total votes: #{total_votes}"
