class LoanRequestsController < ApplicationController
  before_action :set_loan_request, only: [:show, :edit, :update]
  load_and_authorize_resource

  def index
    @loan_requests = LoanRequest.all
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
    checkout_loans = []
    checkout_amounts = []
    session['cart']['loans'].each do |lr_id, funding|
      loan_request = LoanRequest.find_by(id: lr_id)
      loan_request.increment!(:amount_funded, funding.to_i)
      checkout_amounts << funding
      checkout_loans << loan_request
      loan_request.funded! if loan_request.is_funded?
      Loan.create!(user_id: current_user.id, loan_request_id: lr_id, amount: funding)
    end
    LoanMailer.lent_money(current_user, checkout_loans, checkout_amounts).deliver
    binding.pry
    session['cart'] = nil
    flash[:notice] = 'Thanks for your order.'
    redirect_to loans_path
  end

  def show
    @loan_request = LoanRequest.find_by(id: params[:id])
  end

  def edit
    unless current_user.id == @loan_request.user_id
      redirect_to root_path, notice: 'You are not the owner of this loan'
    end
  end

  private

  def loan_request_params
    params.require(:loan_request).permit(:user_id, :title, :description, :blurb,
                                         :borrowing_amount, :amount_funded,
                                         :requested_by_date,
                                         :payments_begin_date,
                                         :payments_end_date, :image,
                                         category_ids: [])
  end

  def set_loan_request
    @loan_requests = LoanRequest.find_by(id: params[:id])
  end
end
