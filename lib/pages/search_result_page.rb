require 'site_prism'
require_relative 'common_section.rb'
require 'capybara'

module Page

  class Result < SitePrism::Section
    attr_accessor :title, :link, :detail
    element :title, 'h3'
    element :link, 'div.r a'
    element :detail, 'span.st'
  end

  class Pagination < SitePrism::Section
    attr_accessor :next
    element :next, :xpath, "//span[text()='Next']"
  end

  class NoResult < SitePrism::Section
    attr_accessor :title
    element :title, "p[role*='heading']"
  end

  class SearchResult < SitePrism::Page
    attr_accessor :header, :results, :pagination, :no_result
    set_url_matcher /\/search\?.*/

    section :header, Header, 'div#gb'
    sections :results, Result, 'div.g'
    section :pagination, Pagination, 'table#nav'
    section :no_result, NoResult, 'div.mnr-c'
  end

end