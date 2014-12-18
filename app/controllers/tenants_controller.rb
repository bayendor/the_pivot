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
      redirect_to register_path
    else
      render :new
    end
  end

  def show
    @tenant = Tenant.find_by(slug: params[:slug])
    @loan_requests = []
  end

  private
  def tenant_params
    params.require(:tenant).permit(:name)
  end
end
