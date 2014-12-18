class CartController < ApplicationController

  # TODO: Reimplement this method
  def index
    if cart_has_items
      # @items = Item.order(id: :asc)
      # @cart = session[:cart]
      # @cart_loans ||= []
      # get_cart_items
      # get_total_price
    else
      redirect_to root_path, notice: "Your cart is empty."
    end
  end

  # TODO: Reimplement this method
  def get_cart_items
    @cart.each do |line_item|
      # cart_line_items = Hash.new
      # cart_line_items[:item] = Item.find(line_item["item_id"])
      # cart_line_items[:fillings] = line_item["filling_ids"].map { |filling_id| Filling.find(filling_id) }
      # cart_line_items[:quantity] = line_item["quantity"]
      # cart_line_items[:id] = line_item["id"]
      # @cart_items << cart_line_items
    end
    # get_line_item_price
  end

  # TODO: Reimplement this method
  def get_total_price
    # @total_price = @cart_items.map { |line_item| line_item[:price] }.reduce(&:+)
  end

  def cart_has_items
    session[:cart] != nil && session[:cart] != []
  end

  # TODO: Reimplement this method
  def update_quantity
    # session[:cart].each do |line_item|
    #   if line_item["id"] == params[:id]
    #     line_item["quantity"] = params[:quantity]
    #   end
    # end
    redirect_to cart_index_path, notice: "Item quantity has been updated."
  end

  # TODO: Reimplement this method
  def create
    session[:cart] ||= []
    # if params["item"] != nil
      # line_item = {"item_id" => params["item_id"],
      #              "filling_ids" => params["item"]["filling_ids"],
      #              "quantity" => params["quantity"],
      #              "id" => params["id"]
      #             }
      # session[:cart] << line_item
      redirect_to cart_index_path, notice: "Cart created. Please log in."
    else
      redirect_to :back, notice: "Please add some loans."
    end
  end

  # TODO: Reimplement this method
  def remove_item
    # session[:cart].delete_if { |line_item| line_item["id"] == params[:id] }
    # redirect_to cart_index_path, notice: "Item quantity has been updated."
  end

  private

  # TODO: Reimplement this method
  def check_duplicate(line_item)
    # session[:cart].any? {|line| line.include?(line_item["item_id"]) }
  end
end
