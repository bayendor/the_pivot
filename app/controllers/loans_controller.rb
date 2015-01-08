class LoansController < ApplicationController
  def index
    @loans = Loan.where("user_id = ?", current_user.id).includes(:loan_request)
  end

  def order_summary
    @order_count = session['cart']['loans'].keys.count
    @loans = Loan.where("user_id = ?", current_user.id).includes(:loan_request)
    get_total
    session['cart'] = nil
  end

  def get_total
    @loans.reverse.take(@order_count).map do |loan|
      loan.amount
    end.inject(:+)
  end

end
