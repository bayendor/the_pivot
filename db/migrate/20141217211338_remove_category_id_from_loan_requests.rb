class RemoveCategoryIdFromLoanRequests < ActiveRecord::Migration
  def change
    remove_column :loan_requests, :category_id
  end
end
