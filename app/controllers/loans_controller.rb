class LoansController < ApplicationController

  def index
    @loans = Loan.order(id: :asc)
  end

end
