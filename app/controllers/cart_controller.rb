class CartController < ApplicationController
  helper_method :cart

  def index
    if cart.loans.empty?
      redirect_to root_path, notice: 'Your cart is empty.'
    end
  end

  def create
    if params['loan_request']
      cart.add_loan(params['loan_request'])
      redirect_to :back
    else
      redirect_to :back, notice: 'Please add some loans.'
    end
  end

  def update
    cart.add_amounts_to_loans(params['amounts'])
    cart.loans.each do |lr_id, funding|
      assign_funding(lr_id, funding)
      Loan.create!(user_id: current_user.id, loan_request_id: lr_id, amount: funding)
    end
    send_emails_to_lenders_and_borrowers
    session['cart'] = nil
    redirect_to loans_path, notice: 'Thanks for your order.'
  end

  private

  def assign_funding(lr_id, funding)
    loan_request = LoanRequest.find_by(id: lr_id)
    loan_request.increment!(:amount_funded, funding.to_i)
    loan_request.funded! if loan_request.is_funded?
  end

  def cart
    @cart ||= Cart.new(session)
  end

  def send_emails_to_lenders_and_borrowers
    LoanMailer.lent_money(current_user, cart.loans.keys, cart.loans.values).deliver
    cart.loans.keys.each_with_index do |loan_request_id, index|
      LoanMailer.received_money(current_user, loan_request_id, cart.loans.values[index]).deliver
    end
  end

end
