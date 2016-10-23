require 'rails_helper'

describe 'User sees dashboard data' do
  let!(:company1) { Company.create(name: "The place", city:"Here") }
  let!(:company2) { Company.create(name: "to be", city:"Here") }
  let!(:company3) { Company.create(name: "is here", city:"Here") }
  let!(:company4) { Company.create(name: "not here", city:"Here") }
  let!(:category) { Category.create(title: "Misc") }
  let!(:job1) { Job.create(title: "Software", level_of_interest: 100, description: "Wahooo", category: category, company: company1) }
  let!(:job2) { Job.create(title: "Engineering", level_of_interest: 90, description: "Wahooo", category: category, company: company2) }
  let!(:job3) { Job.create(title: "Childcare", level_of_interest: 80, description: "Wahooo", category: category, company: company3) }
  let!(:job4) { Job.create(title: "Healthcare", level_of_interest: 1, description: "Wahooo", category: category, company: company4) }

  scenario 'user sees level of interest count' do
    visit dashboard_index_path
    within('#level_of_interest') do
      expect(page).to have_content("#{job1.level_of_interest} (1)")
      expect(page).to have_content("#{job2.level_of_interest} (1)")
      expect(page).to have_content("#{job3.level_of_interest} (1)")
      expect(page).to have_content("#{job4.level_of_interest} (1)")
    end
  end

  scenario 'user sees top 3 interesting companies' do
    visit dashboard_index_path
    within('#interest_companies') do
      expect(page).to have_content("#{company1.name} (100.0)")
      expect(page).to have_content("#{company2.name} (90.0)")
      expect(page).to have_content("#{company3.name} (80.0)")
    end
  end

  scenario 'user sees jobs in each city' do
    visit dashboard_index_path
    within('#city_jobs') do
      expect(page).to have_content("Here (4)")
    end
  end

end
