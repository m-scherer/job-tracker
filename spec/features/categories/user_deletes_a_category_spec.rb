require 'rails_helper'

describe 'User can delete a category' do
  scenario 'user deletes a category' do
    category1 = Category.create(title: "Software")

    visit categories_path
    click_on "Software"
    click_button "Delete Category"

    expect(page).to_not have_content(category1.title)
  end
end
