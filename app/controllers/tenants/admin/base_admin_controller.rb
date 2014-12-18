  class Tenants::Admin::BaseAdminController < ActionController::Base
    protect_from_forgery with: :null_session
    before_action :require_admin
    helper_method :current_user
    layout "admin"

    def index
      @highest_selling_product = LineItem.highest_selling_product
      @top_item                = Item.find_by(id: @highest_selling_product.first) ||
                                   Item.new(price: 0, name: 'n/a', description: 'n/a')
      @total_revenue           = Order.total_revenue
      @latest_orders           = Order.order(created_at: :asc)[0..4]
      @hermano_said            = Hermano.say_cool_thing
      render :dashboard
    end

    protected

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_admin
      unless current_user && current_user.is_admin?
        redirect_to root_path, notice: "Unauthorized"
      end
    end

    def require_webmaster
      unless current_user && current_user.is_webmaster?
        redirect_to root_path, notice: "Unauthorized"
      end
    end
  end
