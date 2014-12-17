require 'rails_helper'

RSpec.describe LoanRequest do
  describe "relationships" do
    it "has many categories" do
      category = Category.create(name: "name", description: "description")
      category1 = Category.create(name: "name", description: "description")
      loan_request = LoanRequest.create(user_id: 1, title: "title", description: "description", borrowing_amount: 10, amount_funded: 0, requested_by_date: DateTime.new, payments_begin_date: DateTime.new, payments_end_date: DateTime.new, status: true, categories: [category, category1])
      expect(loan_request.categories).to eq([category, category1])
    end
  end
end
