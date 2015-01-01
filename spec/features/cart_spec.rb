require 'rails_helper'

describe 'Cart' do
  before(:each) do
    LoanRequest.create!(user: user,
                        title: 'Buy Jorge Beiber Tickets',
                        blurb: 'Jorge loves Bieber',
                        description: 'Jorge desperately wants to see a concert!',
                        borrowing_amount: 500,
                        amount_funded: 10,
                        requested_by_date: DateTime.now,
                        payments_begin_date: DateTime.now.months_since(1),
                        payments_end_date: DateTime.now.months_since(7),
                        status: 'open')

    LoanRequest.create!(user: user,
                        title: 'Steve needs a new phone.',
                        blurb: 'Steve is clumsy.',
                        description: "Steve broke his phone and it doesn't work.",
                        borrowing_amount: 800,
                        amount_funded: 60,
                        requested_by_date: DateTime.now,
                        payments_begin_date: DateTime.now.months_since(1),
                        payments_end_date: DateTime.now.months_since(7),
                        status: 'open')

    tenant.users << user
    visit '/loan_requests'
  end

  let(:user) do
    FactoryGirl.create(:user)
  end

  let(:tenant) do
    Tenant.create!(name: 'Fantastico')
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
end
