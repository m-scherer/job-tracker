require 'rails_helper'

describe 'User deletes a job' do
  let(:company) { Company.create(name: "SpareSpott", city: "Denver") }
  let!(:job) { Job.create(title: "Developer", level_of_interest: 50, description: "Write code", company: company) }

  scenario 'they can delete the job' do
    visit company_jobs_path(company)
    click_on job.title
    click_on "Delete Job"

    expect(page).to_not have_content(job.title)
  end
end
