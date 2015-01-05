class ChangeDescriptionFormatInTenantsTable < ActiveRecord::Migration
  def change
    change_column :tenants, :description, :text, :limit => nil
  end
end
