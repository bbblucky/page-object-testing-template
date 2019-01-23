require 'site_prism'
require_relative 'common_section.rb'
require 'capybara'

module Page

  class Home < SitePrism::Page
    attr_accessor :header, :logo, :search_box, :search_button, :feel_lucky
    set_url Capybara.app_host

    section :header, Header, 'div#gb'
    element :search_box, "input[name*='q']"
    element :search_button, "input[value*='Google Search']"
    element :feel_lucky, "input[value*='I'm Feeling Lucky']"


    def search(terms)
      self.search_box.set terms
      self.search_button.click
    end
  end

end