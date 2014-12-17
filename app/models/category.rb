class Category < ActiveRecord::Base
  has_many :loan_requests
  validates :name, presence: true
  validates :description, presence: true
end
