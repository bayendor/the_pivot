class SessionsController < ApplicationController
  # before_action :set_items

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    elsif user && user.tenant
      session[:tenant_slug] = user.tenant.slug
      redirect_to tenants_path(session[:tenant_slug]), notice: "Logged in as #{current_user.name}"
    else
      redirect_to :back, notice: "Your account is invalid. Please Try Again."
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: 'Logged out'
  end
end
