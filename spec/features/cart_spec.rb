require "rails_helper"

describe 'cart' do

  it "can't visit the cart page without items in the cart" do
    visit "/cart"
    expect(page).to have_content("cart is empty")
  end

  describe "adding items to the cart" do

    let(:user) do
      User.create!(first_name: "tom",
                   email:      "example@example.com",
                   username:   "tom foolery",
                   password:   "password"
                  )
    end

    before(:each) do
      LoanRequest.create!(user_id:             10101,
                          title:               "Buy Jorge Beiber Tickets",
                          description:         "Jorge desperately wants to see a concert!",
                          borrowing_amount:    500,
                          amount_funded:       10,
                          requested_by_date:   DateTime.new(2015, 3, 25),
                          payments_begin_date: DateTime.new(2015, 7, 25),
                          payments_end_date:   DateTime.new(2015, 10, 25),
                          status:              "open"
                         )

      visit "/loan_requests"
    end

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
      expect(page).to have_content("My Past Contributions")

      visit "/cart"
      expect(page).to have_content("My Past Contributions")
      expect(page).to have_content("Buy Jorge Beiber Tickets")
    end

  end

end
