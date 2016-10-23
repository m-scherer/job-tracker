class Contact < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :name, :email, uniqueness: true
  belongs_to :company
end
