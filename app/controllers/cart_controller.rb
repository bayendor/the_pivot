class CartController < ApplicationController
  helper_method :cart

  def index
    if cart.loans.empty?
      redirect_to root_path, notice: "Your cart is empty."
    end
  end

  def create
    if params[:loan_requests] != nil
      params[:loan_requests].each do |lr_id|
        cart.add_loan(lr_id, params["amount_option_#{lr_id}"])
      end
      redirect_to cart_index_path, notice: "Cart created. Please log in."
    else
      redirect_to :back, notice: "Please add some loans."
    end
  end

  private

  def cart
    @cart ||= Cart.new(session)
  end

end
