require '../../spec/spec_helper'
require_relative 'core_page_object'

class ArticlePageObject < CorePageObject
  include Capybara::DSL

  # CONSTANTS

  ARTICLE_TITLE = '#firstHeading'
  IMG_BUG_HISTORY = 'img[src="//upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Classpath_bugs.png/350px-Classpath_bugs.png"]'
  EXIT_FROM_IMAGE_VIEW_BUTTON = 'button[class="mw-mmv-close"]'

  # METHODS

  def expect_article_title
    expect_to_have_css_with_text(ARTICLE_TITLE, 'Software bug', 'Cannot find the title "Software bug"')
  end

  def scroll_to_img_and_click
    scroll_and_click(IMG_BUG_HISTORY)
  rescue Capybara::ElementNotFound
    raise 'Cannot find the image "The typical bug history"'
  end

  def expect_x_button
    expect_to_have_css(EXIT_FROM_IMAGE_VIEW_BUTTON, 'Cannot find the X button on image view')
  end
end