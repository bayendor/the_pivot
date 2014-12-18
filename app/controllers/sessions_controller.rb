class SessionsController < ApplicationController
  before_action :set_items

  def new
    @tenant = Tenant.find_by(slug: params[:slug])

    unless @tenant
      redirect_to tenants_path, notice: 'That tenant does not exist.'
    end
  end

  def create
    @tenant = Tenant.find_by(slug: params[:slug])
    user = @tenant.users.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user] = user.id
      session[:tenant_slug] = @tenant.slug
      redirect_to tenants_path(@tenant.slug), notice: "Logged in as #{current_user.name}"
    else
      flash.now[:notice] = "Your account is invalid. Please Try Again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: 'Logged out'
  end
end
