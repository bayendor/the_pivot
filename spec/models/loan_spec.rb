require 'rails_helper'

RSpec.describe Loan do
  let(:user) do
    User.create!(first_name: "Jim",
                 last_name: "Jones",
                 email: "jimmy100@jones.com",
                 username: "JimJones",
                 password: "password",
                 password_confirmation: "password"
                )
  end

  let(:loan) do
    Loan.create!(user: user,
                 loan_request_id: 1000,
                 amount: 100,
                 status: "completed"
                )
  end

  describe "validations" do
    it "is valid" do
      expect(loan).to be_valid
    end

    it "is invalid without a user_id" do
      loan.user_id = nil
      expect(loan).to_not be_valid

      loan.user_id = ""
      expect(loan).to_not be_valid
    end
  end

  describe "relationships" do
    it "has a user" do
      expect(loan.user).to eq(user)
    end
  end
end
