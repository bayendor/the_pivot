require 'rails_helper'

RSpec.describe LoanRequest do

  let(:category_1) do
    FactoryGirl.create(:category_1)
  end

  let(:category_2) do
    FactoryGirl.create(:category_2)
  end

  let(:loan_request) do
    FactoryGirl.create(:loan_request_1,
                       user_id:          1,
                       borrowing_amount: 10_000,
                       amount_funded:    0,
                       categories: [category_1, category_2]
                      )
  end

  describe 'relationships' do
    it 'has many categories' do
      expect(loan_request.categories).to eq([category_1, category_2])
    end

    it 'belongs to a user' do
      expect(loan_request.user_id).to eq(1)
    end
  end

  describe 'loan request information' do
    it 'must have a title' do
      loan_request.title = nil
      expect(loan_request).to_not be_valid
    end

    it 'must have a short description' do
      loan_request.blurb = nil
      expect(loan_request).to_not be_valid
    end

    it 'must have a regular description' do
      loan_request.description = nil
      expect(loan_request).to_not be_valid
    end
  end

  describe 'repayment terms' do
    it 'calculates the loan term in months' do
      expect(loan_request.loan_term).to eq(6)
    end

    it 'calculates the monthly repayment rate' do
      expect(loan_request.repayment_rate).to eq(1666)
    end

    it 'the request date cannot be in the past' do
      loan_request.requested_by_date = DateTime.now.months_ago(1)
      expect(loan_request).to_not be_valid
    end

    it 'the payment start date is at least one month from the request' do
      loan_request.payments_begin_date = DateTime.now.months_since(1)
      expect(loan_request).to be_valid
    end

    it 'the payment end date is at least three months from the request' do
      loan_request.payments_end_date = DateTime.now.months_since(5)
      expect(loan_request).to be_valid
    end
  end

  describe 'funded status' do
    it 'must have a status' do
      loan_request.status = nil
      expect(loan_request).to_not be_valid
    end

    it 'can change the status to closed' do
      expect(loan_request.status).to eq("open")
      loan_request.amount_funded = 10_000
      expect(loan_request.is_fulfilled?).to eq(true)
      loan_request.mark_as_funded!
      expect(loan_request.status).to eq("closed")
    end
  end
end
