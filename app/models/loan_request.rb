class LoanRequest < ActiveRecord::Base
  belongs_to :user

  has_many :loan_request_categories
  has_many :categories, through: :loan_request_categories
  has_many :loans

  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :borrowing_amount, presence: true
  validates :amount_funded, presence: true
  validates :requested_by_date, presence: true
  validates :payments_begin_date, presence: true
  validates :payments_end_date, presence: true
  validates :status, presence: true

  scope :status, -> (status) { where status: status }  

  def loan_term
    ((payments_end_date - payments_begin_date) / 2_592_000).round
  end

  def repayment_rate
    borrowing_amount / loan_term
  end
end
