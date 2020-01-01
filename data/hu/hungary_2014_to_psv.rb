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

SOURCE = 'hungary-2014.txt'.freeze
TARGET = '../../lib/sapor/regional_data/hungary-2014.psv'.freeze

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
    next if line.chomp.start_with?('#')
    if line.chomp.empty?
      output.puts
    else
      elements = line.chomp.split('|').map(&:strip)
      party = elements[1]
      if party == 'FIDESZ-KDNP'
        elements[1] = 'Fidesz–KDNP'
        output.puts(elements.join(' | '))
      elsif party == 'JOBBIK'
        elements[1] = 'Jobbik'
        output.puts(elements.join(' | '))
      elsif party == 'MSZP-EGYÜTT-DK-PM-MLP'
        elements[2] = (elements[2].to_i / 5).to_s
        elements[1] = 'DK'
        output.puts(elements.join(' | '))
        elements[1] = 'Együtt'
        output.puts(elements.join(' | '))
        elements[1] = 'MLP'
        output.puts(elements.join(' | '))
        elements[1] = 'MSZP'
        output.puts(elements.join(' | '))
        elements[1] = 'PM'
        output.puts(elements.join(' | '))
      elsif party == 'SZOCIÁLDEMOKRATÁK'
        elements[1] = 'Szociáldemokraták'
        output.puts(elements.join(' | '))
      else
        output.puts line
      end
    end
  end
end
