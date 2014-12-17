require 'rails_helper'

RSpec.describe LoanRequest do

  let(:category) do
    category = Category.create(name: "name",
                               description: "description"
                              )
  end

  let(:category1) do
    category1 = Category.create(name: "name",
                                description: "description"
                               )

  end

  let(:loan_request) do
      loan_request = LoanRequest.create(user_id: 1,
                                        category: category,
                                        title: "title",
                                        description: "description",
                                        borrowing_amount: 10,
                                        amount_funded: 0,
                                        requested_by_date: DateTime.new,
                                        payments_begin_date: DateTime.new,
                                        payments_end_date: DateTime.new,
                                        status: true
                                       )
  end

  describe "relationships" do
    it "has many categories" do
      expect(loan_request.categories).to eq([category, category1])
    end
  end
end
