require 'rails_helper'

describe 'User edits a category' do
  scenario 'user edits a category' do
    category = Category.create(title: "Software")
    new_category = Category.new(title: "Healthcare")

    visit categories_path
    click_on "Software"
    click_link "Edit Category"
    fill_in "category[title]", with: new_category.title
    click_on "Update Category"

    expect(page).to have_content(new_category.title)
  end
end
