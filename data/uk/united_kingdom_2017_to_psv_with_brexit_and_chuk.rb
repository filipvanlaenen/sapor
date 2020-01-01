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

SOURCE = 'united_kingdom_2017.txt'.freeze
TARGET = '../../lib/sapor/regional_data/united_kingdom-20170608-brexit-chuk.psv'.freeze

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
  output.puts '# Changes:'
  output.puts '# Added Change UK as a combination of Conservative Party (3/318) and Labour Party (8/262)'
  output.puts '# Added Brexit Party as a copy of UK Independence Party'
  output.puts '#'
  File.open(SOURCE).each do |line|
    elements = line.chomp.split(';')
    name = elements[0]
    next if name == 'Name'
    region = elements[2].to_i
    output.puts ''
    if region == 1
      unless elements[5].to_i == 0
        output.puts "#{name} | Ulster Unionist Party | #{elements[5]}"
      end
      unless elements[6].to_i == 0
        output.puts "#{name} | Social Democratic & Labour Party | " \
                    "#{elements[6]}"
      end
      unless elements[7].to_i == 0
        output.puts "#{name} | Democratic Unionist Party | #{elements[7]}"
      end
    else
      unless elements[5].to_i == 0
        output.puts "#{name} | Conservative Party | #{elements[5]}"
      end
      unless elements[6].to_i == 0
        output.puts "#{name} | Labour Party | #{elements[6]}"
      end
      unless elements[7].to_i == 0
        output.puts "#{name} | Liberal Democrats | #{elements[7]}"
      end
      tig = elements[5].to_i * 3 / 318 + elements[6].to_i * 8 / 262
      unless tig == 0
        output.puts "#{name} | Change UK | #{tig}"
      end      
    end
    unless elements[8].to_i == 0
      output.puts "#{name} | UK Independence Party | #{elements[8]}"
      output.puts "#{name} | Brexit Party | #{elements[8]}"
    end
    unless elements[9].to_i == 0
      output.puts "#{name} | Green Party | #{elements[9]}"
    end
    if region == 2
      unless elements[10].to_i == 0
        output.puts "#{name} | Scottish National Party | #{elements[10]}"
      end
    elsif region == 1
      unless elements[10].to_i == 0
        output.puts "#{name} | Sinn Féin | #{elements[10]}"
      end
    elsif region == 6
      unless elements[10].to_i == 0
        output.puts "#{name} | Plaid Cymru | #{elements[10]}"
      end
    elsif elements[10].to_i > 0
      puts "Check out #{name}!"
    end
    unless elements[11].to_i == 0
      output.puts "#{name} | Small or local party, or independent candidate " \
                  "| #{elements[11]}"
    end
    unless elements[12].to_i == 0
      output.puts "#{name} | All other candidates | #{elements[12]}"
    end
  end
end
