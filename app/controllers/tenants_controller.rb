class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all
  end

  def show
    @tenant = Tenant.find(params[:id])
  end
end
