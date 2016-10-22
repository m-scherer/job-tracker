class DashboardController < ApplicationController

  def index
    @companies_location = Company.location_job_count
    @top_three_companies_interest = Job.top_3_interest_by_company
    @level_of_interest =  Job.count_level_of_interest
  end

end
