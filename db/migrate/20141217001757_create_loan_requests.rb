class CreateLoanRequests < ActiveRecord::Migration
  def change
    create_table :loan_requests do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :title
      t.string :description
      t.integer :borrowing_amount
      t.integer :amount_funded
      t.datetime :requested_by_date
      t.datetime :payments_begin_date
      t.datetime :payments_end_date
      t.string :status
    end
  end
end
