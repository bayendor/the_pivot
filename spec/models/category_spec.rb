require 'rails_helper'

RSpec.describe Category do
  # describe "validations" do
  #   it "validates name" do
  #     category = Category.create
  #     expect(category).to_not be_valid
  #
  #     category  = Category.create(name: "nice name")
  #     category2 = Category.create(name: "nice name")
  #     expect(category).to be_valid
  #     expect(category2).to_not be_valid
  #   end
  # end

  describe "relationships" do
    it "has many loan requests" do
      category = Category.create(name: "name", description: "description")
      loan_request = LoanRequest.create(user_id: 1, title: "title", blurb: "blurb", description: "description", borrowing_amount: 10, amount_funded: 0, requested_by_date: DateTime.new, payments_begin_date: DateTime.new, payments_end_date: DateTime.new, status: true, categories: [category])
      loan_request1 = LoanRequest.create(user_id: 2, title: "title1", blurb: "blurb", description: "description1", borrowing_amount: 110, amount_funded: 10, requested_by_date: DateTime.new, payments_begin_date: DateTime.new, payments_end_date: DateTime.new, status: true, categories: [category])
      expect(category.loan_requests).to eq([loan_request1, loan_request])
    end
  end
end
