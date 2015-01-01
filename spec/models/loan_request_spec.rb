require 'rails_helper'

RSpec.describe LoanRequest do
  let(:category_1) do
    FactoryGirl.create(:category_1)
  end

  let(:category_2) do
    FactoryGirl.create(:category_2)
  end

  let(:loan_request) do
    LoanRequest.create(user_id: 1,
                       categories: [category_1, category_2],
                       title: 'title',
                       description: 'description',
                       borrowing_amount: 10_000,
                       amount_funded: 0,
                       requested_by_date: DateTime.new,
                       payments_begin_date: DateTime.now,
                       payments_end_date: DateTime.now.months_since(5),
                       status: true
                      )
  end

  describe 'relationships' do
    it 'has many categories' do
      expect(loan_request.categories).to eq([category_1, category_2])
    end
  end

  describe 'repayment terms' do
    it 'calculates the loan term in months' do
      expect(loan_request.loan_term).to eq(5)
    end

    it 'calculates the monthly repayment rate' do
      expect(loan_request.repayment_rate).to eq(2000)
    end
  end
end
