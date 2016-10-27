require 'rails_helper'

describe "User sees all companies" do
  scenario "a user sees all the companies" do
    company = Company.create(name: "ESPN", city: "LA")
    company_two = Company.create(name: "Disney", city: "LA")

    visit companies_path

    expect(page).to have_content("ESPN")
    expect(page).to have_content("LA")
  end
  scenario "a user sees all companies sorted" do
    company = Company.create(name: "ESPN", city: "NY")
    company_two = Company.create(name: "Disney", city: "Albany")

    visit "#{companies_path}?sort=location"

    within('.company_list>ul:first-child') do
      expect(page).to have_content(company_two.name)
    end
  end

end
