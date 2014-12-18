class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all
  end

  def new
    @tenant = Tenant.new
  end

  def create
    @tenant = Tenant.new(tenant_params)
    @tenant.user_id = session[:user_id]
    if @tenant.save
      session[:tenant_id] = @tenant.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @tenant = Tenant.find(params[:id])
  end

  private
  def tenant_params
    params.require(:tenant).permit(:name)
  end
end
