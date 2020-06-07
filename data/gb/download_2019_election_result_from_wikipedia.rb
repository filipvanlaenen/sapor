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

  def self.extract_from_wikipedia(page)
    instance = Constituencies.new
    NATION_NAMES.each do |nation_name|
      html_table = page.get_table_after_title(nation_name,
                                              HtmlDocument::HEADING3)
      instance.extract_and_add_from_html_table(html_table)
    end
    instance
  end

  def each(&block)
    @items.each(&block)
  end

  def extract_and_add_from_html_table(table)
    table.column(0).cells.each do |cell|
      name = cell.extract_text
      wikipedia_page_title = cell.extract_href
      @items << Constituency.new(name, wikipedia_page_title)
    end
  end
end

#
# Class representing the 2019 election result for the United Kingdom
#
class ElectionResult
  OVERVIEW_PAGE_TITLE = 'Results_of_the_2019_United_Kingdom_general_election'

  def download
    overview = WikipediaPage.new(OVERVIEW_PAGE_TITLE, WikipediaPage::ENGLISH)
    @constituencies = Constituencies.extract_from_wikipedia(overview)
    @constituencies.each do |constituency|
      downloaded_local_result = constituency.download
      add_downloaded_local_result(downloaded_local_result)
    end
  end

  def save(file_name)
    File.open(file_name, 'w') do |file|
      @constituencies.each do |constituency|
        file.puts(constituency.election_result_as_psv)
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

      remaining_content = remaining_content.match(/(<table[^>]*>.*)/m)[1]
      return HtmlTable.new(remaining_content.match(%r{(.+?</table>)}m)[1])
    end
    raise "Couldn't find the title '#{title}' with level #{level} in #{@uri}!"
  end

  private

  def delete_span_class_possibly_with_content!(span_class, delete_content)
    new_content = ''
    remaining_content = @content
    while remaining_content =~ /<span[^>]*>/m
      match = remaining_content.match(/(.*?)(<span[^>]*>)(.*)/m)
      new_content += match[1]
      span = match[2]
      unless span =~ /class="#{span_class}"/m
        new_content += span
        remaining_content = match[3]
        next
      end
      remaining_content = match[3]
      match = remaining_content.match(%r{(.*?)</span>(.*)}m)
      new_content += match[1] unless delete_content
      remaining_content = match[2]
    end
    new_content += remaining_content
    @content = new_content
  end
  
  def process_next_span_for_deletion(remaining_content, span_class, delete_content)
  end
end

#
# Class representing an HTML table.
#
class HtmlTable
  def initialize(body); end
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

puts 'Starting to download the 2019 election result from Wikipedia...'

election_result = ElectionResult.new
election_result.download
election_result.save('great-britain-20191212.psv')

puts 'Done.'
