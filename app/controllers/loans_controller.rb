class LoansController < ApplicationController
  def index
    @loans = Loan.where("user_id = ?", current_user.id).includes(:loan_request)
  end

  def order_summary
    @order_count = session['cart']['loans'].keys.count
    binding.pry
    @loans = Loan.where("user_id = ?", current_user.id).includes(:loan_request)
    session['cart'] = nil
  end
end
