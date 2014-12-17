class OrdersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_items
  before_action :require_current_user

  def index
    @orders = current_user.orders
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    require_current_user_id
    @line_items = @order.line_items
    @order_total = @order.order_total
  end

  def create
    @order = Order.create(user_id: session[:user_id], delivery_method: params["delivery_method"])
    session[:cart].each do |line_item|
      item = @order.line_items.create(item_id: line_item["item_id"], quantity: line_item["quantity"])
      item.filling_ids = line_item["filling_ids"]
    end
    add_address_to_user
    if @order.save!
      session[:cart].clear
      redirect_to order_path(@order), notice: "Deliciousness is imminent!"
    else
      flash.now[:error] = "Order could not be placed. Error!"
      redirect_to cart_path
    end
  end

  def add_address_to_user
    current_user.update(user_params)
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :state)
  end

  def user_params
    params.permit(:address_1, :address_2, :city, :state, :zip_code)
  end

  def require_current_user_id
    unless current_user.id == @order.user.id
      redirect_to root_path, notice: "Unauthorized"
    end
  end

  def require_current_user
    unless current_user
      redirect_to root_path, notice: "Unauthorized"
    end
  end

end

