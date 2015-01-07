class LoansController < ApplicationController
  def index
    @loans = Loan.where("user_id = ?", current_user.id).includes(:loan_request)
  end
end
