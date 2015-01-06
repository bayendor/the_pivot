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
    cart.add_amounts_to_loans(params["amounts"])
  end

  private

  def cart
    @cart ||= Cart.new(session)
  end

end
