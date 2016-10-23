require 'rails_helper'

describe 'User deletes a job' do
  scenario 'they can delete the job' do
    company = Company.create(name: "SpareSpott", city: "Denver")
    category = Category.create(title: "Misc")
    job = Job.create(title: "Developer", level_of_interest: 50, description: "Write code", category: category, company: company)
    visit company_jobs_path(company)
    click_on job.title
    click_on "Delete Job"

    expect(page).to_not have_content(job.title)
  end
end
