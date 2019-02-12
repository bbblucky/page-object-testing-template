require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'dotenv'
require_relative '../lib/download'


Dotenv.load(File.expand_path('../../config/.env.example', __FILE__))

RSpec.configure do |config|
  config.include Capybara::DSL
end

# add download support configure to chrome and chrome headless mode
download_path = DownloadHelpers::PATH.to_s
options = Selenium::WebDriver::Chrome::Options.new
options.add_preference(:download, directory_upgrade: true, prompt_for_download: false, default_directory: download_path)
options.add_preference(:browser, set_download_behavior: { behavior: 'allow' })

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :options => options)
end

Capybara.register_driver :chrome_headless do |app|
  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-gpu')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--window-size=1920,1080')

  driver = Capybara::Selenium::Driver.new(app, :browser => :chrome, :options => options)
  bridge = driver.browser.send(:bridge)
  path = "/session/#{bridge.session_id}/chromium/send_command"
  bridge.http.call(:post, path, cmd: 'Page.setDownloadBehavior', params: { :behavior => 'allow', :downloadPath => download_path })

  driver
end

Capybara.configure do |config|
  config.run_server = false
  #:selenium for Firefox, :chrome for chrome, and :chrome_headless for chrome headless
  # config.default_driver = :chrome
  config.app_host = ENV["APP_HOST"]
end