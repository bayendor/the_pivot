class CreateLoanRequestCategories < ActiveRecord::Migration
  def change
    create_table :loan_request_categories do |t|
      t.integer :loan_request_id
      t.integer :category_id

      t.timestamps
    end
  end
end
