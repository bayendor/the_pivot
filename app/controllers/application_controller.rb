class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  helper_method :current_user

  def code
    redirect_to "https://github.com/bayendor/the_pivot/"
  end

  protected

  def set_items
    @items = Item.all
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_webmaster
    unless current_user && current_user.is_webmaster?
      redirect_to root_path, notice: "Unauthorized"
    end
  end

end
