class LoanRequestsController < ApplicationController

  def index
    @loan_requests = LoanRequest.all
  end

  def new
    @loan_request = LoanRequest.new
  end

  def create
    @loan_request = LoanRequest.new(loan_request_params)
    if @loan_request.save
      redirect_to tenant_path
    else
      render :new
    end
  end

  def show
    @loan_requests = LoanRequest.find_by(id: params[:id])
  end

private

  def loan_request_params
    params.require(loan_request).permit(:user_id, :title, :description, :borrowing_amount, :amount_funded, :requested_by_date, :payments_begin_date, :payments_end_date)
  end

end
