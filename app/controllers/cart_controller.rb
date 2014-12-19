class CartController < ApplicationController

  def index
    if cart_has_items
      @cart ||= []
      session[:cart].flatten.uniq.each do |lr_id|
        @cart << LoanRequest.where(id: lr_id)
      end
    else
      redirect_to root_path, notice: "Your cart is empty."
    end
  end

  def create
    session[:cart] ||= []
    if params[:loan_requests] != nil
      session[:cart] << params[:loan_requests]
      redirect_to cart_index_path, notice: "Cart created. Please log in."
    else
      redirect_to :back, notice: "Please add some loans."
    end
  end

  # TODO: reimplement removing items
  # def remove_item
  #
  # end

  # TODO: reimplement update quantity
  # def update_quantity
  #
  # end

  private

  def cart_has_items
    session[:cart] != nil && session[:cart] != []
  end

end
