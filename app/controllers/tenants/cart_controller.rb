class Tenants::CartController < ApplicationController

  def index
    if cart_has_items
      @items = Item.order(id: :asc)
      @cart = session[:cart]
      @cart_items ||= []
      get_cart_items
      get_total_price
    else
      redirect_to root_path, notice: "Your cart is empty.  Please fill it up and give us money!"
    end
  end

  def get_cart_items
    @cart.each do |line_item|
      cart_line_items = Hash.new
      cart_line_items[:item] = Item.find(line_item["item_id"])
      cart_line_items[:fillings] = line_item["filling_ids"].map { |filling_id| Filling.find(filling_id) }
      cart_line_items[:quantity] = line_item["quantity"]
      cart_line_items[:id] = line_item["id"]
      @cart_items << cart_line_items
    end
    get_line_item_price
  end

  def get_line_item_price
    @cart_items.each do |line_item|
      line_item[:price] = line_item[:fillings].map(&:price).reduce(line_item[:item].price, &:+) * line_item[:quantity].to_i
    end
  end

  def get_total_price
    @total_price = @cart_items.map { |line_item| line_item[:price] }.reduce(&:+)
  end

  def cart_has_items
    session[:cart] != nil && session[:cart] != []
  end

  def update_quantity
    session[:cart].each do |line_item|
      if line_item["id"] == params[:id]
        line_item["quantity"] = params[:quantity]
      end
    end
    redirect_to cart_index_path, notice: "Item quantity has been updated."
  end

  def create
    session[:cart] ||= []
    if params["item"] != nil
      line_item = {"item_id" => params["item_id"],
                   "filling_ids" => params["item"]["filling_ids"],
                   "quantity" => params["quantity"],
                   "id" => params["id"]
                  }
      session[:cart] << line_item
      redirect_to cart_index_path, notice: "Cart created. Please log in."
    else
      redirect_to :back, notice: "Please add fillings to your item."
    end
  end

  def remove_item
    session[:cart].delete_if { |line_item| line_item["id"] == params[:id] }
    redirect_to cart_index_path, notice: "Item quantity has been updated."
  end

  def delivery
    if cart_has_items
      @items = Item.order(id: :asc)
      @cart = session[:cart]
      @cart_items ||= []
      get_cart_items
      get_total_price
    else
      redirect_to root_path, notice: "Your cart is empty.  Please fill it up and give us money!"
    end
  end

  private

    def check_duplicate(line_item)
       session[:cart].any? {|line| line.include?(line_item["item_id"]) && line.include?(line_item["item"]["filling_ids"]) }
    end
end

