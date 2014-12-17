class CreateLoanRequestCategories < ActiveRecord::Migration
  def change
    create_table :loan_request_categories do |t|

      t.timestamps
    end
  end
end
