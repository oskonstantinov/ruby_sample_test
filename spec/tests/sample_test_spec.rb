require 'spec_helper'
require_relative '../pageobjects/sample_page_object'

feature 'Sample feature: ', type: :feature do
  let(:sample_page_object) { SamplePageObject.new }

  after :each do
    page.driver.browser.manage.delete_all_cookies
  end

  context 'sample context' do

    scenario 'sample test by Wikipedia', js: true do

      visit 'https://en.wikipedia.org/wiki/Main_Page'
      sample_page_object.enter_search_request
      sample_page_object.click_on_search_button
      sample_page_object.scroll_to_search_result
      sample_page_object.expect_article_title
    end
  end
end
