class LendController < ApplicationController

  def lend
    @tenants = Tenant.all
  end

end
