require 'rails_helper'

describe 'User creates a new category' do
  scenario 'user can create a new category' do
    category = Category.new(title: "Software")
    visit categories_path

    click_on "New Category"
    fill_in "category[title]", with: category.title
    click_on "Create Category"

    expect(page).to have_content(category.title)
  end

  scenario 'user cannot create duplicate categories' do
    category1 = Category.create(title: "Software")
    category2 = Category.new(title: "Software")

    visit new_category_path

    fill_in "category[title]", with: category2.title
    click_on "Create Category"

    expect(current_path).to eq(new_category_path)
  end

end
