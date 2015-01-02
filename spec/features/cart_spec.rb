require 'rails_helper'

describe 'Cart' do

  before(:each) do
    loan_request_1
    loan_request_2
    user
    tenant

    visit "/loan_requests"
  end

  let(:loan_request_1) do
    FactoryGirl.create(:loan_request_1, user: user)
  end

  let(:loan_request_2) do
    FactoryGirl.create(:loan_request_2, user: user)
  end

  let(:user) do
    FactoryGirl.create(:user)
  end

  let(:tenant) do
    FactoryGirl.create(:tenant) do |tenant|
      tenant.users << user
    end
  end

  it "can't visit the cart page without items in the cart" do
    visit '/cart'
    expect(page).to have_content('cart is empty')
  end

  context 'adding items to the cart' do
    it 'has items on the page' do
      expect(page).to have_content('Buy Jorge Beiber Tickets')
    end

    it 'can add items and they persist after logging in' do
      find(:css, "#loan_requests_[value='#{LoanRequest.first.id}']").set(true)
      find('input[value="Add selected Loans to Cart"]').click
      expect(current_path).to eq('/cart')
      expect(page).to have_content('Your Cart')
      expect(page).to have_content('Steve Needs A New Phone.')

      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
      find('input[value="Log In"]').click

      visit '/cart'
      expect(page).to have_content('Steve Needs A New Phone.')
    end

    it 'can add items from multiple borrowers' do
      find(:css, "#loan_requests_[value='#{LoanRequest.first.id}']").set(true)
      find(:css, "#loan_requests_[value='#{LoanRequest.second.id}']").set(true)
      find('input[value="Add selected Loans to Cart"]').click

      expect(page).to have_content('Steve Needs A New Phone.')
      expect(page).to have_content('Buy Jorge Beiber Tickets')
    end
  end

end
