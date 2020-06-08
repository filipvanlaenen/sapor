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

TEST_RUN = true

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
      wikipedia_page_title = cell.extract_href.gsub(%r{.*/}, '')
      constituency = Constituency.new(name, wikipedia_page_title)
      constituency.extract_local_result(parties_dictionary)
      @items << constituency
      break if TEST_RUN
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
    @election_results.map { |k, v| [@name, k.party_name, v].join(' | ') }.join("\n")
  end

  def extract_local_result(parties_dictionary)
    table = @wikipedia_page.get_table_after_title('Elections in the 2010s',
                                                  HtmlDocument::HEADING3)
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
    if party_name == 'Independent'
      candidate_name = row[2].extract_text.strip
      independent_candidate = IndependentCandidate.new(candidate_name)
      @election_results[independent_candidate] = votes
    elsif !parties_dictionary.key?(party_name)
      raise "Party name '#{party_name}' found in constituency #{@name}" \
            ' missing in parties dictionary!'
    else
      @election_results[parties_dictionary[party_name]] = votes
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
    raise "Couldn't find the title '#{title}' with level #{level} in #{@uri}!"
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

  def register(name, key)
    @map[key] = Party.new(name)
  end
end

#
# Class representing a party
#
class Party
  attr_reader :party_name

  def initialize(party_name)
    @party_name = party_name
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
parties_dictionary.register('Alliance Party of Northern Ireland', 'Alliance')
parties_dictionary.register('Brexit Party', 'Brexit Party')
parties_dictionary.register('Conservative Party', 'Conservative')
parties_dictionary.register('Democratic Unionist Party', 'DUP')
parties_dictionary.register('Green Party of England and Wales', 'Green')
parties_dictionary.register('Labour Party', 'Labour')
parties_dictionary.register('Liberal Democrats', 'Liberal Democrats')
parties_dictionary.register('Plaid Cymru', 'Plaid Cymru')
parties_dictionary.register('Scottish Green Party', 'Scottish Green')
parties_dictionary.register('Scottish National Party', 'SNP')
parties_dictionary.register('Ulster Unionist Party', 'UUP')

puts 'Starting to download the 2019 election result from Wikipedia...'

election_result = ElectionResult.new
election_result.download(parties_dictionary)
election_result.save('great-britain-20191212.psv')

puts 'Done.'
