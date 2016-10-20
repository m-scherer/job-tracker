require 'rails_helper'

describe 'User edits an exisiting job' do
  let(:company) { Company.create(name: "SpareSpott", city: "Denver") }
  let(:job) { Job.create(title: "Developer", level_of_interest: 50, description: "Write code", company: company) }

  scenario 'they can edit the job fields' do
    new_job = Job.new(title: "Random Guy", level_of_interest: 0, description: "Stand around")
    visit edit_company_job_path(company, job)

    fill_in "job_title", with: new_job.title
    fill_in "job_level_of_interest", with: new_job.level_of_interest
    fill_in "job_description", with: new_job.description
    click_on "Update Job"

    expect(page).to have_content(new_job.title)
    expect(page).to have_content(new_job.level_of_interest)
    expect(page).to have_content(new_job.description)
  end

end
