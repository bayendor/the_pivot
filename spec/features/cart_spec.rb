require "rails_helper"

describe 'cart' do
  before(:each) do
    LoanRequest.create!(user_id:             10101,
                        title:               "Buy Jorge Beiber Tickets",
                        blurb:               "Jorge loves Bieber",
                        description:         "Jorge desperately wants to see a concert!",
                        borrowing_amount:    500,
                        amount_funded:       10,
                        requested_by_date:   DateTime.new(2015, 3, 25),
                        payments_begin_date: DateTime.new(2015, 7, 25),
                        payments_end_date:   DateTime.new(2015, 10, 25),
                        status:              "open"
                       )

    LoanRequest.create!(user_id:             1337,
                        title:               "Steve needs a new phone.",
                        blurb:               "Steve is clumsy.",
                        description:         "Steve broke his phone and it doesn't work.",
                        borrowing_amount:    800,
                        amount_funded:       60,
                        requested_by_date:   DateTime.new(2014, 12, 28),
                        payments_begin_date: DateTime.new(2015, 3, 30),
                        payments_end_date:   DateTime.new(2015, 8, 17),
                        status:              "open"
                       )

    visit "/loan_requests"
  end

  let(:user) do
    User.create!(first_name: "tom",
                 email:      "example@example.com",
                 username:   "tom foolery",
                 password:   "password"
                )
  end

  it "can't visit the cart page without items in the cart" do
    visit "/cart"
    expect(page).to have_content("cart is empty")
  end

  context "adding items to the cart" do
    it "has items on the page" do
      expect(page).to have_content("Buy Jorge Beiber Tickets")
    end

    it "can add items and they persist after logging in" do
      find(:css, "#loan_requests_[value='#{LoanRequest.first.id}']").set(true)
      find('input[value="Add selected Loans to Cart"]').click
      expect(current_path).to eq("/cart")
      expect(page).to have_content("Your Cart")
      expect(page).to have_content("Buy Jorge Beiber Tickets")

      fill_in "username", with: user.username
      fill_in "password", with: user.password
      find('input[value="Log In"]').click

      visit "/cart"
      expect(page).to have_content("Buy Jorge Beiber Tickets")
    end

    it "can add items from multiple borrowers" do
      find(:css, "#loan_requests_[value='#{LoanRequest.first.id}']").set(true)
      find(:css, "#loan_requests_[value='#{LoanRequest.second.id}']").set(true)
      find('input[value="Add selected Loans to Cart"]').click

      expect(page).to have_content("Buy Jorge Beiber Tickets")
      expect(page).to have_content("Steve broke his phone")
    end
  end

  context "checkout process" do
    it "has a checkout button" do

    end

  end



end
