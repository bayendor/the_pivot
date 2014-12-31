class LoanRequestsController < ApplicationController
  before_action :set_loan_request, only: [:show, :edit, :update]

  def index
    @loan_requests = LoanRequest.order(id: :asc)
    @loan_requests = @loan_requests.status(params[:status]) if params[:status].present?
  end

  def new
    @loan_request = LoanRequest.new
  end

  def create
    @loan_request = LoanRequest.new(loan_request_params)
    @loan_request.user_id = current_user.id
    if @loan_request.save
      redirect_to tenant_path(current_user.tenant.slug), notice: 'Loan Request created.'
    else
      render :new
    end
  end

  def update
    session["cart"]["loans"].each do |key, value|
      LoanRequest.find_by(id: key).increment!(:amount_funded, value.to_i)
    end
    redirect_to root_path
  end

  def show
    @loan_request = LoanRequest.find_by(id: params[:id])
  end

  private

  def loan_request_params
    params.require(:loan_request).permit(:user_id, :title, :description, :blurb,
                                         :borrowing_amount, :amount_funded,
                                         :requested_by_date,
                                         :payments_begin_date,
                                         :payments_end_date, :image)
  end

  def set_loan_request
    @loan_requests = LoanRequest.find_by(id: params[:id])
  end

end
