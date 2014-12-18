class RemoveUserIdFromTenants < ActiveRecord::Migration
  def change
    remove_column :tenants, :user_id
  end
end
