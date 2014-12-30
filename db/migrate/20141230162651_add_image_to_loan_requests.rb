class AddImageToLoanRequests < ActiveRecord::Migration
  def self.up
    change_table :loan_requests do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :loan_requests, :image
  end
end
