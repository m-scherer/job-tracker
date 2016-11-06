class DashboardController < ApplicationController

  def index
    @companies_location = Company.location_job_count
    @level_of_interest =  Job.count_level_of_interest
    @top_three_companies_interest = Job.sorted_average_interest[0..2]
  end

end
