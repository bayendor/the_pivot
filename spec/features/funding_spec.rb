require "rails_helper"

describe "Funding" do

  before(:each) do
    tenant
    loan_request

    visit root_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Log In"

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

    it "is closed when fully funded" do
      find(:css, "#loan_requests_[value='#{LoanRequest.first.id}']").set(true)
      find('input[value="Add selected Loans to Cart"]').click
      expect(current_path).to eq('/cart')

      select "475", from: "amounts_"
      click_button "Checkout"
      expect(page).to have_content("Status: closed")
    end
  end
end
