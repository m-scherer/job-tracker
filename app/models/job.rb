class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.count_level_of_interest
    Job.group(:level_of_interest).count
  end

  def self.get_average_interest
    Job.group(:company_id).average(:level_of_interest)
  end

  def self.sort_average_interest
    get_average_interest.sort_by { |k,v| v }.reverse
  end

  def self.top_3_interest_by_company
    sort_average_interest.map do |k,v|
      "#{find_company_name(k)}: #{v.to_f}"
    end[0..2]
  end

  def self.find_company_name(k)
    Company.find(k).name
  end

  def self.location_job_count
      Company.joins(:jobs).group(:city).count
  end


end
