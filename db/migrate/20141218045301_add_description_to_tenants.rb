class AddDescriptionToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :description, :string
  end
end
