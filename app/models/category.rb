class Category < ActiveRecord::Base
  has_many  :loan_request_categories
  has_many  :loan_requests, through: :loan_request_categories

  validates :name, presence: true
  validates :description, presence: true
end
