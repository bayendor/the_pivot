class Loan < ActiveRecord::Base
  belongs_to :loan_request
  belongs_to :user

  validates :user_id, presence: true
  validates :loan_request_id, presence: true
  validates :amount, presence: true
  validates :status, presence: true
end
