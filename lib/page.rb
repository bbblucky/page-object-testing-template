require_relative 'pages/home_page'
require_relative 'pages/search_result_page'

module Page
  class Main
    def home
      Home.new
    end

    def search_result
      SearchResult.new
    end

    def login(user = ENV["TEST_USER"])
      user = eval(user)
      self.home.load
      self.home.header.sign_in.click
      # Login through the google login process
      # I don't add those since this is test template
      # login(user[:username], user[:password])
    end

  end
end