require 'rails_helper'

describe 'User sees only companies in a city' do
  scenario 'user sees companies in a city' do
    company = Company.create(name: "The place", city:"Here")
    job1 = Job.create(title: "Software", level_of_interest: 100, description: "Wahooo", company: company)

    visit dashboard_index_path
    click_on "Here"

    expect(page).to have_content(company.name)
  end
end
