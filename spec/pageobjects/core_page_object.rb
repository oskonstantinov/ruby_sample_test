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

  # for similar elements: find parent, inside parent find needed element
  def find_element_with_text_by_parent_xpath_and_click(parent, locator, my_text)
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

  # universal scroll to element
  def scroll_to(locator)
    script = 'arguments[0].scrollIntoView(true);'

    Capybara.current_session.driver.browser.execute_script(script, locator.native)
  end

  def scroll_and_click(locator)
    scroll_to(page.find(locator, visible: false))
    find(locator).click
  end

  # based on js helper and jquery
  def drag_and_drop_js(source, target)
    jquery = Rails.root.join('spec/js_helpers/jquery-3.3.1.min.js').read
    dnd = Rails.root.join('spec/js_helpers/drag_and_drop_helper.js').read

    Capybara.current_session.driver.browser.execute_script(jquery)
    Capybara.current_session.driver.browser.execute_script(dnd)
    Capybara.current_session.driver.browser.execute_script("$('#{source}').simulateDragDrop({ dropTarget: '#{target}'});")
  end
end
