require 'rails_helper'

describe 'User can enter a new comment' do
  scenario 'user can save a new comment' do
    company = Company.create(name: "ESPN", city: "NYC")
    category = Category.create(title:"Software")
    job = Job.create(title: "Developer", level_of_interest: 999, description: "write code", company: company, category: category)
    comment = Comment.new(body: "This is an awesome job")

    visit company_job_path(company, job)
    fill_in "comment[body]", with: comment.body
    click_button "Create Comment"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content(comment.body)
  end
end
