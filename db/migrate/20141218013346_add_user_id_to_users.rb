class AddUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :tenants, :user_id, :integer 
  end
end
