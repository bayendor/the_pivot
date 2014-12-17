class AddTimestampsToLoanRequests < ActiveRecord::Migration
  def change
    add_column :loan_requests, :created_at, :datetime
    add_column :loan_requests, :updated_at, :datetime
  end
end
