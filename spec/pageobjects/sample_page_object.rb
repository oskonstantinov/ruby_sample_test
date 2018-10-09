require 'spec_helper'
require_relative 'core_page_object'

class SamplePageObject < CorePageObject
  include Capybara::DSL

  # CONSTANTS

  SEARCH_FIELD = 'search'
  SEARCH_BUTTON = '#searchButton'
  SOFTWARE_BUG_LINK = 'a[href="/wiki/Software_bug"]'
  ARTICLE_TITLE = '#firstHeading'

  # METHODS

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

  def scroll_to_search_result
    scroll_and_click(SOFTWARE_BUG_LINK)
  rescue Capybara::ElementNotFound
    raise 'Cannot find the search result "Software bug"'
  end

  def expect_article_title
    expect_to_have_css_with_text(ARTICLE_TITLE, 'Software bug', 'Cannot find the title "Software bug"')
  end
end
