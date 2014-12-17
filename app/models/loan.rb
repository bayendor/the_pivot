class Loan < ActiveRecord::Base
  belongs_to :loan_request
  belongs_to :user

  validates user_id, presence: true, uniqueness: true
  validates loan_request_id, presence: true, uniqueness: true
  validates amount, presence: true
  validates status, presence: true
end
