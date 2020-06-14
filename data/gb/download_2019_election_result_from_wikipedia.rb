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

require 'net/http'
require 'uri'

#
# Enumerable class representing a set of constituencies.
#
class Constituencies
  include Enumerable

  NATION_NAMES = ['England', 'Northern Ireland', 'Scotland', 'Wales'].freeze

  def initialize
    @items = []
  end

  def self.extract_from_wikipedia(parties_dictionary, page)
    instance = Constituencies.new
    NATION_NAMES.each do |nation_name|
      html_table = page.get_table_after_title(nation_name,
                                              HtmlDocument::HEADING3)
      instance.extract_and_add_from_html_table(parties_dictionary, html_table)
    end
    instance
  end

  def each(&block)
    @items.each(&block)
  end

  def extract_and_add_from_html_table(parties_dictionary, table)
    table.column(0).cells.each do |cell|
      name = cell.extract_text.strip
      break if name =~ /^\d/m

      print "(#{name}) "
      $stdout.flush
      wikipedia_page_title = cell.extract_href.gsub(%r{.*/}, '')
      constituency = Constituency.new(name, wikipedia_page_title)
      constituency.extract_local_result(parties_dictionary)
      @items << constituency
    end
  end
end

#
# Class representing a constituency
#
class Constituency
  def initialize(name, wikipedia_page_title)
    @name = name
    @wikipedia_page = WikipediaPage.new(wikipedia_page_title,
                                        WikipediaPage::ENGLISH)
    @election_results = {}
  end

  def local_result_as_psv
    lines = @election_results.map do |k, v|
      [@name, k.party_name, v].join(' | ')
    end
    lines.join("\n")
  end

  def extract_local_result(parties_dictionary)
    table = @wikipedia_page.get_table_with_caption_including(
      'General election 2019'
    )
    if table.nil?
      table = @wikipedia_page.get_table_after_title('Elections in the 2010s',
                                                    HtmlDocument::HEADING3)
    end
    if table.nil?
      table = @wikipedia_page.get_table_after_title('Elections',
                                                    HtmlDocument::HEADING2)
    end
    table.rows.each do |row|
      first_text = row[0].extract_text.strip
      next if first_text == 'Party'
      break if ['Majority', 'Rejected ballots'].include?(first_text)

      extract_result_from_row(parties_dictionary, row)
    end
  end

  private

  def extract_result_from_row(parties_dictionary, row)
    party_name = row[1].extract_text.strip
    votes = row[3].extract_text.strip
    if ['Independent', 'No description', '&#91;23&#93;'].include?(party_name)
      candidate_name = row[2].extract_text.strip
      independent_candidate = IndependentCandidate.new(candidate_name)
      @election_results[independent_candidate] = votes
    elsif !parties_dictionary.key?(party_name)
      raise "Party name '#{party_name}' found in constituency #{@name}" \
            ' missing in parties dictionary!'
    else
      party = parties_dictionary[party_name]
      no_of_votes = votes.gsub(/,/, '').to_i
      @election_results[party] = no_of_votes
      party.add_votes(no_of_votes)
    end
  end
end

#
# Class representing the 2019 election result for the United Kingdom
#
class ElectionResult
  OVERVIEW_PAGE_TITLE = 'Results_of_the_2019_United_Kingdom_general_election'

  def download(parties_dictionary)
    overview = WikipediaPage.new(OVERVIEW_PAGE_TITLE, WikipediaPage::ENGLISH)
    @constituencies = Constituencies.extract_from_wikipedia(parties_dictionary,
                                                            overview)
  end

  def save(file_name)
    File.open(file_name, 'w') do |file|
      @constituencies.each do |constituency|
        file.puts(constituency.local_result_as_psv)
      end
    end
  end
end

#
# Class representing an HTML document
#
class HtmlDocument
  HEADING2 = :h2
  HEADING3 = :h3

  def initialize(content)
    @content = content
  end

  def delete_span_class!(span_class)
    delete_span_class_possibly_with_content!(span_class, false)
  end

  def delete_span_class_with_content!(span_class)
    delete_span_class_possibly_with_content!(span_class, true)
  end

  def get_table_after_title(title, level)
    remaining_content = @content
    while remaining_content =~ /<#{level}[^>]*>/m
      remaining_content = remaining_content.match(/<#{level}[^>]*>(.*)/m)[1]
      title_content = remaining_content.match(%r{(.+?)</#{level}>}m)[1].strip
      remaining_content = remaining_content.match(%r{</#{level}>(.*)}m)[1]
      next unless title_content == title

      table = remaining_content.match(%r{(<table[^>]*>.*?</table>)}m)[1]
      return HtmlTable.new(table)
    end
    nil
  end

  def get_table_with_caption_including(text)
    remaining_content = @content
    while remaining_content =~ /<table[^>]*>/m
      table = remaining_content.match(%r{(<table[^>]*>.*?</table>)}m)[1]
      remaining_content = remaining_content.match(%r{</table>(.*)}m)[1]
      next unless table =~ /<caption[^>]*>/m

      caption = table.match(%r{(<caption[^>]*>.*?</caption>)}m)[1]
      next unless caption.include?(text)

      return HtmlTable.new(table)
    end
    nil
  end

  private

  def delete_span_class_possibly_with_content!(span_class, delete_content)
    new_content = ''
    remaining_content = @content
    while remaining_content =~ /<span[^>]*>/m
      additional_new_content, remaining_content = \
        process_next_span_for_deletion(remaining_content, span_class,
                                       delete_content)
      new_content += additional_new_content
    end
    new_content += remaining_content
    @content = new_content
  end

  def process_next_span_for_deletion(content, span_class, delete_content)
    match = content.match(/(.*?)(<span[^>]*>)(.*)/m)
    new_content = match[1]
    span = match[2]
    return new_content + span, match[3] unless span =~ /class="#{span_class}"/m

    match = match[3].match(%r{(.*?)</span>(.*)}m)
    new_content += match[1] unless delete_content
    [new_content, match[2]]
  end
end

#
# Class representing an HTML table.
#
class HtmlTable
  attr_reader :rows

  def initialize(content)
    @content = content
    @rows = extract_rows
  end

  def column(index)
    cells = []
    @rows.each do |row|
      cells << row[index]
    end
    HtmlTableColumn.new(cells)
  end

  private

  def extract_rows
    rows = []
    remaining_content = @content.match(%r{<table[^>]*>(.*)</table>}m)[1]
    while remaining_content =~ /<tr[^>]*>/m
      match = remaining_content.match(%r{(<tr[^>]*>.*?</tr>)(.*)}m)
      rows << HtmlTableRow.new(match[1])
      remaining_content = match[2]
    end
    rows
  end
end

#
# Class representing a cell in an HTML table.
#
class HtmlTableCell
  def initialize(content)
    @content = content
    @inner_content = extract_inner_content
  end

  def cell?
    @content.start_with?('<td')
  end

  def extract_href
    return nil unless @inner_content =~ /<a[^>]*>/m

    link_tag = @inner_content.match(/<a([^>]*)>/m)[1]
    return nil unless link_tag =~ /href=\"[^\"]*\"/m

    link_tag.match(/href=\"([^\"]*)\"/m)[1]
  end

  def extract_text
    @inner_content.gsub(/<[^>]*>/m, '').strip
  end

  private

  def extract_inner_content
    @content.match(%r{<t[dh][^>]*>(.*)</t[dh]>}m)[1]
  end
end

#
# Class representing a column in an HTML table.
#
class HtmlTableColumn
  def initialize(cells)
    @cells = cells
  end

  def cells
    @cells.select(&:cell?)
  end
end

#
# Class representing a row in an HTML table.
#
class HtmlTableRow
  def initialize(content)
    @content = content
    @cells = extract_cells
  end

  def [](index)
    @cells[index]
  end

  private

  def extract_cells
    cells = []
    remaining_content = @content.match(%r{<tr[^>]*>(.*)</tr>}m)[1]
    while remaining_content =~ /<t[dh][^>]*>/m
      match = remaining_content.match(%r{(<t[dh][^>]*>.*?</t[dh]>)(.*)}m)
      cells << HtmlTableCell.new(match[1])
      remaining_content = match[2]
    end
    cells
  end
end

#
# Class representing an independent candidate
#
class IndependentCandidate
  def initialize(candidate_name)
    @candidate_name = candidate_name
  end

  def party_name
    "Independent: #{@candidate_name}"
  end
end

#
# Class representing a dictionary mapping keys to the parties
#
class PartiesDictionary
  def initialize
    @map = {}
  end

  def [](key)
    @map[key]
  end

  def key?(key)
    @map.key?(key)
  end

  def register(name, key = nil, second_key = nil)
    party = Party.new(name)
    if key.nil?
      @map[name] = party
    else
      @map[key] = party
    end
    @map[second_key] = party unless second_key.nil?
  end
end

#
# Class representing a party
#
class Party
  attr_reader :no_of_votes, :party_name

  def initialize(party_name)
    @party_name = party_name
    @no_of_votes = 0
  end

  def add_votes(no_of_votes)
    @no_of_votes += no_of_votes
  end
end

#
# Class representing a web page
#
class WebPage
  def initialize(uri)
    @uri = uri
    @html_document = retrieve_content
  end

  private

  def retrieve_content
    uri = URI.parse(@uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    unless response.code.to_i == 200
      raise "Something unexpected happened, response code was #{response.code}!"
    end

    HtmlDocument.new(response.body.force_encoding('utf-8'))
  end
end

#
# Class representing a Wikipedia page
#
class WikipediaPage < WebPage
  ENGLISH = :en

  DECORATIONS_WITH_CONTENT = %w[mw-editsection-bracket mw-editsection].freeze
  DECORATIONS_WITHOUT_CONTENT = ['mw-headline'].freeze

  def initialize(title, language)
    super(calculate_uri(title, language))
    @undecorated_html_document = undecorate(@html_document)
    @title = title
    @language = language
  end

  def get_table_after_title(title, level)
    @undecorated_html_document.get_table_after_title(title, level)
  end

  def get_table_with_caption_including(text)
    @undecorated_html_document.get_table_with_caption_including(text)
  end

  private

  def calculate_uri(title, language)
    "https://#{language}.wikipedia.org/wiki/#{title}"
  end

  def undecorate(html_document)
    undecorated_html_document = html_document.clone
    DECORATIONS_WITH_CONTENT.each do |decoration|
      undecorated_html_document.delete_span_class_with_content!(decoration)
    end
    DECORATIONS_WITHOUT_CONTENT.each do |decoration|
      undecorated_html_document.delete_span_class!(decoration)
    end
    undecorated_html_document
  end
end

parties_dictionary = PartiesDictionary.new
parties_dictionary.register('Advance Together', 'Advance')
parties_dictionary.register('Alliance for Green Socialism')
parties_dictionary.register('Alliance Party of Northern Ireland', 'Alliance')
parties_dictionary.register('Animal Welfare Party', 'Animal Welfare')
parties_dictionary.register('Aontú')
parties_dictionary.register('Ashfield Independents')
parties_dictionary.register('Best4Luton')
parties_dictionary.register('Birkenhead Social Justice Party',
                            'Birkenhead Social Justice')
parties_dictionary.register('Brexit Party')
parties_dictionary.register('British National Party', 'BNP')
parties_dictionary.register('Burnley and Padiham Independent Party', 'BAPIP')
parties_dictionary.register('Christian Party', 'Christian',
                            'Scottish Christian')
parties_dictionary.register('Christian Peoples Alliance')
parties_dictionary.register('Church of the Militant Elvis Party',
                            'Militant Elvis Anti-HS2')
parties_dictionary.register('Citizens Movement Party UK')
parties_dictionary.register('Common People')
parties_dictionary.register('Communist League')
parties_dictionary.register('Communities United Party', 'Communities United')
parties_dictionary.register('Conservative Party', 'Conservative')
parties_dictionary.register('Constitution and Reform')
parties_dictionary.register('Democratic Unionist Party', 'DUP')
parties_dictionary.register('English Democrats', 'English Democrat')
parties_dictionary.register('Green Party in Northern Ireland', 'Green (NI)')
parties_dictionary.register('Green Party of England and Wales', 'Green')
parties_dictionary.register('Gwlad Gwlad')
parties_dictionary.register('Heavy Woollen District Independents')
parties_dictionary.register('Independent Network')
parties_dictionary.register('Labour and Co-operative Party', 'Labour Co-op')
parties_dictionary.register('Labour Party', 'Labour')
parties_dictionary.register('Liberal Democrats')
parties_dictionary.register('Liberal Party', 'Liberal')
parties_dictionary.register('Libertarian Party', 'Libertarian')
parties_dictionary.register('Lincolnshire Independents',
                            'Lincolnshire Independent')
parties_dictionary.register('Mebyon Kernow')
parties_dictionary.register('Motherworld Party')
parties_dictionary.register('North East Party')
parties_dictionary.register('Northern Ireland Conservatives',
                            'NI Conservatives')
parties_dictionary.register('Official Monster Raving Loony Party',
                            'Monster Raving Loony')
parties_dictionary.register('Patria')
parties_dictionary.register('Peace Party', 'Peace')
parties_dictionary.register('Plaid Cymru')
parties_dictionary.register('Proud of Oldham & Saddleworth',
                            'Proud of Oldham &amp; Saddleworth')
parties_dictionary.register('Rebooting Democracy')
parties_dictionary.register('Renew Party', 'Renew')
parties_dictionary.register('People Before Profit')
parties_dictionary.register('Psychedelic Future')
parties_dictionary.register('Putting Cumbria First')
parties_dictionary.register('Scottish Family')
parties_dictionary.register('Scottish Green Party', 'Scottish Green')
parties_dictionary.register('Scottish National Party', 'SNP')
parties_dictionary.register('Shropshire Party')
parties_dictionary.register('Sinn Féin')
parties_dictionary.register('Social Democratic and Labour Party', 'SDLP')
parties_dictionary.register('Social Democratic Party', 'SDP')
parties_dictionary.register('Socialist Equality Party', 'Socialist Equality')
parties_dictionary.register('Socialist Labour Party', 'Socialist Labour')
parties_dictionary.register('Socialist Party of Great Britain',
                            'Socialist (GB)')
parties_dictionary.register('Space Navies Party')
parties_dictionary.register('Speaker')
parties_dictionary.register('The Cynon Valley Party', 'Cynon&#160;Valley')
parties_dictionary.register('The Independent Group for Change')
parties_dictionary.register('The Justice & Anti-Corruption Party',
                            'Justice &amp; Anti-Corruption')
parties_dictionary.register('The Universal Good Party')
parties_dictionary.register('Touch Love Worldwide')
parties_dictionary.register('UK Independence Party', 'UKIP')
parties_dictionary.register('Ulster Unionist Party', 'UUP')
parties_dictionary.register('Veterans and People’s Party',
                            "Veterans and People's")
parties_dictionary.register('Women’s Equality Party', "Women's Equality")
parties_dictionary.register('Workers Revolutionary Party',
                            'Workers Revolutionary')
parties_dictionary.register('Wycombe Independents')
parties_dictionary.register('Yeshua')
parties_dictionary.register('Yorkshire Party')
parties_dictionary.register('Young People’s Party UK', "Young People's")

puts 'Starting to download the 2019 election result from Wikipedia...'

election_result = ElectionResult.new
election_result.download(parties_dictionary)
election_result.save('united-kingdom-20191212.psv')

conservative_votes = parties_dictionary['Conservative'].no_of_votes
puts "Conservative Party: #{conservative_votes}."

puts 'Done.'
