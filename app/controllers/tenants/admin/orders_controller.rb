class Admin::OrdersController < Admin::BaseAdminController
  layout 'admin'

  def index
    @orders = Order.order(id: :asc)
    @states = ['paid','completed','canceled','ordered']
  end

  def show
    @order = Order.find(params[:id])
    @line_items = @order.line_items.sort_by(&:id)
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
        redirect_to admin_order_path(@order), notice: "You have updated the order."
    else
      flash.now[:alert] = "The order was not updated. Please try again."
      render :show
    end
  end

  def remove_item
    @order = Order.find(params[:order][:id])
    @order.line_items.find(params[:order][:line_item_id]).destroy
    redirect_to admin_order_path(@order), notice: "You have removed the item from this order."
  end

  def update_quantity
    @order = Order.find(params[:id])
    line_item = LineItem.find(params[:line_item_id])
    line_item.quantity = params[:quantity].to_i
    line_item.save
    redirect_to admin_order_path(@order), notice: "You have updated an item quantity for this order."
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :state)
  end
end
