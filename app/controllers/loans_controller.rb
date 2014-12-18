class LoansController < ApplicationController

  def index
    @loans = Loan.find_by(user_id: current_user.id)
  end

end
