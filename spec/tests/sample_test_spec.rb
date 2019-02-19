require '../../spec/spec_helper'
require_relative '../pageobjects/main_page_object'
require_relative '../pageobjects/search_page_object'
require_relative '../pageobjects/article_page_object'

feature 'Sample feature: ', type: :feature do
  let(:main_page_object) { MainPageObject.new }
  let(:search_page_object) { SearchPageObject.new }
  let(:article_page_object) { ArticlePageObject.new }

  after :each do
    page.driver.browser.manage.delete_all_cookies
    page.driver.quit
  end

  context 'sample context' do

    scenario 'change language to deutsch', js: true do
      visit '/MainPage'
      main_page_object.scroll_to_deutsch_link_and_click
      main_page_object.expect_deutsch_welcome_text
    end

    scenario 'search the article', js: true do
      visit '/MainPage'
      main_page_object.enter_search_request
      main_page_object.click_on_search_button
      search_page_object.scroll_to_search_result_and_click
      article_page_object.expect_article_title
    end

    scenario 'check the image', js: true do
      visit '/Software_bug'
      article_page_object.scroll_to_img_and_click
      article_page_object.expect_x_button
    end
  end
end