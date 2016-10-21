require 'rails_helper'

describe 'User sees a category' do
  let!(:category) { Category.create(title: "Software") }
  let!(:company) { Company.create(name: "SpareSpott", city: "Denver") }
  let!(:job) { Job.create(title: "Developer", level_of_interest: 50, description: "Write code", company: company, category: category) }

  scenario 'user sees a single category' do
    visit categories_path
    click_on category.title

    expect(page).to have_content(category.title)
    expect(page).to have_content(job.title)
  end
end
