ukip = {}

File.open('united_kingdom-2015.psv').each do |line|
  next if line.start_with?('#')
  elements = line.chomp.split('|')
  next if elements.size == 0
  if elements[1].strip == 'UK Independence Party'
    ukip[elements[0].strip] = elements[2].strip
  end
end

lines = []
File.open('united_kingdom-20170608-brexit.psv').each do |line|
  lines << line
end

File.open('united_kingdom-20170608-brexit.psv', 'w') do |output|
  lines.each do | line |
    if line.start_with?('#')
      output.puts line
    else
      elements = line.chomp.split('|')
      if elements.size == 0
        output.puts line
      elsif elements[1].strip == 'Brexit Party' && ukip.has_key?(elements[0].strip)
        output.puts elements[0].strip + ' | Brexit Party | ' + ukip[elements[0].strip]
      else
        output.puts line
      end
    end
  end
end

lines = []
File.open('united_kingdom-20170608-brexit-chuk.psv').each do |line|
  lines << line
end

File.open('united_kingdom-20170608-brexit-chuk.psv', 'w') do |output|
  lines.each do | line |
    if line.start_with?('#')
      output.puts line
    else
      elements = line.chomp.split('|')
      if elements.size == 0
        output.puts line
      elsif elements[1].strip == 'Brexit Party' && ukip.has_key?(elements[0].strip)
        output.puts elements[0].strip + ' | Brexit Party | ' + ukip[elements[0].strip]
      else
        output.puts line
      end
    end
  end
end
