require 'rails_helper'

describe 'User edits an exisiting job' do
  scenario 'they can edit the job fields' do
    company = Company.create(name: "SpareSpott", city: "Denver")
    category = Category.create(title: "Misc")
    job = Job.create(title: "Developer", level_of_interest: 50, description: "Write code", company: company, category: category)
    new_job = Job.new(title: "Random Guy", level_of_interest: 0, description: "Stand around", category: category)
    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: new_job.title
    fill_in "job[level_of_interest]", with: new_job.level_of_interest
    fill_in "job[description]", with: new_job.description
    select 'Misc', from: :category
    click_on "Update Job"

    expect(page).to have_content(new_job.title)
    expect(page).to have_content(new_job.level_of_interest)
    expect(page).to have_content(new_job.description)
    expect(page).to have_content(new_job.category.title)
  end

end
