class CartController < ApplicationController
  helper_method :cart

  def index
    if cart.loans.empty?
      redirect_to root_path, notice: "Your cart is empty."
    end
  end

  def create
    if params["loan_requests"] != nil
      params["loan_requests"].each { |lr_id| cart.add_loan(lr_id) }
      if current_user
        redirect_to cart_index_path
      else
        redirect_to cart_index_path, notice: "Cart created. Please log in."
      end
    else
      redirect_to :back, notice: "Please add some loans."
    end
  end

  def update
    @checkout_loans = []
    @checkout_amounts = []
    cart.add_amounts_to_loans(params["amounts"])
    cart.loans.each do |lr_id, funding|
      assign_funding(lr_id, funding)
      Loan.create!(user_id: current_user.id, loan_request_id: lr_id, amount: funding)
    end
    LoanMailer.lent_money(current_user, @checkout_loans, @checkout_amounts).deliver
    @checkout_loans.each_with_index do |loan, index|
      LoanMailer.received_money(current_user, loan, @checkout_amounts[index]).deliver
    end
    session['cart'] = nil
    flash[:notice] = 'Thanks for your order.'
    redirect_to loans_path
  end

  private

  def assign_funding(lr_id, funding)
    loan_request = LoanRequest.find_by(id: lr_id)
    loan_request.increment!(:amount_funded, funding.to_i)
    loan_request.funded! if loan_request.is_funded?
    @checkout_amounts << funding
    @checkout_loans << loan_request
  end

  def cart
    @cart ||= Cart.new(session)
  end

end
