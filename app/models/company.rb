class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts

  def self.location_job_count
      Company.joins(:jobs).group(:city).count
  end

end
