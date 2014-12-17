class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :user_id
      t.integer :loan_request_id
      t.integer :amount
      t.string :status
    end
  end
end
