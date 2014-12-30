class AddBlurbToLoanRequests < ActiveRecord::Migration
  def change
    add_column :loan_requests, :blurb, :string
  end
end
