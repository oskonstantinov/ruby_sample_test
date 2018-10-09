require 'spec_helper'

class CorePageObject
  include Capybara::DSL
  include RSpec::Matchers

  def find_element_and_click(locator)
    find(locator).click
  end

  def find_element_with_text_and_click(locator, my_text)
    find(locator, text: my_text).click
  end

  def fill_field(locator, my_text)
    fill_in locator, with: my_text
  end

  def find_element_with_text_by_parent_xpath_and_click(parent, locator, my_text)  # for similar elements: find parent, inside parent find needed element
    within(:xpath, parent) do
      find(locator, text: my_text).click
    end
  end

  def find_element_with_text_by_parent_css_and_click(parent, locator, my_text)
    within(parent) do
      find(locator, text: my_text).click
    end
  end

  def expect_to_have_css_with_text(locator, my_text, error_message)
    expect(page).to have_css(locator, text: my_text), error_message
  end

  def scroll_to(locator) # universal scroll to element
    script = <<-JS
      arguments[0].scrollIntoView(true);
    JS

    Capybara.current_session.driver.browser.execute_script(script, locator.native)
  end

  def scroll_and_click(locator)
    scroll_to(page.find(locator, visible: false))
    find(locator).click
  end
end
