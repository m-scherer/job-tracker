class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :category, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.count_level_of_interest
    Job.group(:level_of_interest).count
  end

  def self.get_average_interest
    Job.joins(:company).group(:name).average(:level_of_interest)
  end

  def self.sorted_average_interest
    get_average_interest.sort_by { |k,v| v }.reverse
  end

end
