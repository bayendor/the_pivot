class ChangeDescriptionFormatInLoanRequestsTable < ActiveRecord::Migration
  def change
    change_column :loan_requests, :description, :text, :limit => nil
  end
end
