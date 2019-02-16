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
    capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(
        firefoxOptions: { args: ['--window-size=1920,1080'] } # ,'--headless'
    )
    Capybara::Selenium::Driver.new app,
                                   browser: :firefox,
                                   desired_capabilities: capabilities
  end

  config.default_max_wait_time = 3
  config.javascript_driver = :firefox
  config.app_host = 'https://en.wikipedia.org/wiki'
end