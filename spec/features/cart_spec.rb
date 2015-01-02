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
    FactoryGirl.create(:loan_request_1, user_id: user.id)
  end

  let(:loan_request_2) do
    FactoryGirl.create(:loan_request_2, user_id: user.id)
  end

  let(:user) do
    FactoryGirl.create(:user)
  end

  let(:tenant) do
<<<<<<< HEAD
    Tenant.create!(name: 'Fantastico')
=======
    FactoryGirl.create(:tenant) do |tenant|
      tenant.users << user
    end
>>>>>>> 5aa67cd... updated the before(:each) to use factory girl to
  end

  it "can't visit the cart page without items in the cart" do
    visit '/cart'
    expect(page).to have_content('cart is empty')
  end

<<<<<<< HEAD
  context 'adding items to the cart' do
    it 'has items on the page' do
      expect(page).to have_content('Buy Jorge Beiber Tickets')
=======
  context "adding items to the cart" do
    it "has items on the page" do

      expect(page).to have_content("Buy Jorge Beiber Tickets")
>>>>>>> 5aa67cd... updated the before(:each) to use factory girl to
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

<<<<<<< HEAD
<<<<<<< HEAD
  context 'checkout process' do
    it 'has a checkout button' do
    end
  end
=======
  context "checkout process" do
    xit "has a checkout button" do

    end
  end

>>>>>>> 762001e... replaced data being created with factories
=======
>>>>>>> 5aa67cd... updated the before(:each) to use factory girl to
end
