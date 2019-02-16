require '../../spec/spec_helper'
require_relative 'core_page_object'

class SearchPageObject < CorePageObject
  include Capybara::DSL

  # CONSTANTS

  SOFTWARE_BUG_LINK = 'a[href="/wiki/Software_bug"]'

  # METHODS

  def scroll_to_search_result_and_click
    scroll_and_click(SOFTWARE_BUG_LINK)
  rescue Capybara::ElementNotFound
    raise 'Cannot find the search result called "Software bug"'
  end
end