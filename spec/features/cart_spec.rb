require 'rails_helper'

describe 'Cart' do

  before(:each) do
    loan_request_1
    loan_request_2
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

  context 'visiting the cart page' do
    it "can't happen without items in the cart" do
      visit '/cart'
      expect(page).to have_content('cart is empty')
    end

    it 'has items on the page' do
      expect(page).to have_content('Buy Jorge Beiber Tickets')
    end
  end

  context 'adding items to the cart' do

    it 'get added and they persist after logging in' do
      find("input[name='loan_request_#{LoanRequest.first.id}']").click
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
      find('input[value="Log In"]').click

      click_link 'Take me to my cart!'
      expect(current_path).to eq('/cart')
      expect(page).to have_content('Your Cart')
      expect(page).to have_content('Steve Needs A New Phone.')


      visit '/cart'
      expect(page).to have_content('Steve Needs A New Phone.')
    end

    it 'can be from multiple borrowers' do
      find("input[name='loan_request_#{LoanRequest.first.id}']").click
      find("input[name='loan_request_#{LoanRequest.second.id}']").click
      click_link 'Take me to my cart!'

      expect(page).to have_content('Steve Needs A New Phone.')
      expect(page).to have_content('Buy Jorge Beiber Tickets')
    end
  end
end
