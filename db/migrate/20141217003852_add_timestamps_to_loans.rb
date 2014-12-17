class AddTimestampsToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :created_at, :datetime
    add_column :loans, :updated_at, :datetime
  end
end
