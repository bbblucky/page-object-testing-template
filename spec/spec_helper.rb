require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'dotenv'


Dotenv.load(File.expand_path('../../config/.env.example', __FILE__))

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.configure do |config|
  config.run_server = false
  #:selenium for Firefox, :selenium_chrome for chrome, and :selenium_chrome_headless for chrome headless
  config.default_driver = :selenium_chrome
  config.app_host = ENV["APP_HOST"]
end