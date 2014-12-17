require 'rails_helper'

RSpec.describe Loan do
  let(:loan) do
    Loan.create(user_id: 1,
                loan_request_id: 1,
                amount: 100,
                status: "completed"
               )
  end

  it "is valid" do
    expect(role).to be_valid
  end

  it "is valid if no role is provided" do
    role.name = nil
    expect(role).to be_valid

    role.name = ""
    expect(role).to be_valid
  end

  it "is associated with a user" do
    expect(role).to respond_to(:users)
  end

end
