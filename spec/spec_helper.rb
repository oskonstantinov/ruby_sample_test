require 'capybara/rspec'
require 'capybara'
require 'rspec'
require 'selenium/webdriver'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers
  config.color = true
  config.formatter = :documentation
end

Capybara.configure do |config|
  config.register_driver :firefox do |app|
    options = ::Selenium::WebDriver::Firefox::Options.new
    options.args << '--window-size=1920,1080'
    options.args << '--headless'
    Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
  end

  config.default_max_wait_time = 3
  config.javascript_driver = :firefox
  config.app_host = 'https://en.wikipedia.org/wiki'
end