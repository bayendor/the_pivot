require "rails_helper"

describe "Funding" do

  before(:each) do
    tenant
    loan_request
    visit loan_requests_path
  end

  let(:loan_request) do
    FactoryGirl.create(:loan_request_1, user: user)
  end

  let(:user) do
    FactoryGirl.create(:user)
  end


  let(:tenant) do
    FactoryGirl.create(:tenant) do |tenant|
      tenant.users << user
    end
  end

  context "loan_requests" do

    it "has a loan request" do
      expect(current_path).to eq("/loan_requests")
      expect(page).to have_content("Borrower: Mr. Jorge")
    end

    it "can have it's value selected" do
      select "475", from: "amount_option_55"
    #  find('#amount_option').find(:xpath, 'option[475]').select_option

    end
  end
end
