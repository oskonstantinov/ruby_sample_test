require '../../spec/spec_helper'
require_relative 'core_page_object'

class MainPageObject < CorePageObject
  include Capybara::DSL

  # CONSTANTS

  SEARCH_FIELD = 'search'
  SEARCH_BUTTON = '#searchButton'
  DEUTSCH_LINK = 'a[class="external text"][href="https://de.wikipedia.org/wiki/"]'
  DEUTSCH_WELCOME = '#Willkommen_bei_Wikipedia'

  # METHODS

  def scroll_to_deutsch_link_and_click
    scroll_and_click(DEUTSCH_LINK)
  rescue Capybara::ElementNotFound
    raise 'Cannot find the link "Deutsch" in footer'
  end

  def expect_deutsch_welcome_text
    expect_to_have_css_with_text(DEUTSCH_WELCOME, 'Willkommen bei Wikipedia', 'Cannot find block with text "Willkommen bei Wikipedia"')
  end

  def enter_search_request
    fill_field(SEARCH_FIELD, 'bug')
  rescue Capybara::ElementNotFound
    raise 'Cannot find the search field on main page'
  end

  def click_on_search_button
    find_element_and_click(SEARCH_BUTTON)
  rescue Capybara::ElementNotFound
    raise 'Cannot find the search button on main page'
  end
end