class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all 
  end

  def show

  end
end
