require 'rails_helper'

describe 'User sees all categories' do
  scenario 'user sees all categories' do
    category1 = Category.create(title: "Software")
    category2 = Category.create(title: "Healthcare")

    visit categories_path

    expect(page).to have_content(category1.title)
    expect(page).to have_content(category2.title)
  end
end
