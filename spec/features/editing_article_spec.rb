require 'rails_helper'

RSpec.feature "Editing an article" do
  before do
    @article = Article.create(title: "The Title", body: "The Body")
  end

  scenario "A user updates an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: "New Title"
    fill_in "Body", with: "New Body"
    click_button "Update Article"
    #
    # expect(page).to have_content "Article has been updated"
    # expect(page.current_path).to eq articles_path(@article)
  end

  scenario "A user fails to update an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Update Article"

    expect(page).to have_content "Article has not been updated"
    expect(page.current_path).to eq article_path(@article)

  end

end
