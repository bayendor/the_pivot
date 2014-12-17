class DropLoanRequestCategories < ActiveRecord::Migration
  def change
    drop_table :loan_request_categories
  end
end
