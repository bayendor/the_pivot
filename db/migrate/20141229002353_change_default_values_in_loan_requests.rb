class ChangeDefaultValuesInLoanRequests < ActiveRecord::Migration
  def change
    change_column_default :loan_requests, :borrowing_amount, 0
    change_column_default :loan_requests, :amount_funded, 0
    change_column_default :loan_requests, :status, 'open' 
  end
end
