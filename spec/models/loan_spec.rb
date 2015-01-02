require 'rails_helper'

RSpec.describe Loan do

  let(:loan) do
    FactoryGirl.create(:loan)
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
      expect(loan.user.first_name).to eq("Cave")
    end
  end
end
