require 'rails_helper'

describe 'checkout' do
  context 'checkout process' do
    it 'can go through a whole process' do
      visit root_path
      click_link_or_button 'Sign Up'
      expect(page).to have_content('Register as a Keevahh User')
      fill_in 'user[first_name]', with: 'Chase'
      fill_in 'user[last_name]', with: 'van Hekken'
      fill_in 'user[email]', with: 'chase@gmail.com'
      fill_in 'user[username]', with: 'ChasevH'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button 'Submit'

      find(:xpath, "//a/img[@alt='Borrow']/..").click
      expect(page).to have_content('Apply to Become a Borrower!')

      fill_in 'tenant[name]', with: 'Chase Business'
      fill_in 'tenant[description]', with: 'This good description'
      click_link_or_button 'Apply'
      expect(page).to have_content('Chase Business')
      click_link_or_button 'Create new loan request'
      expect(page).to have_content('Create New Loan Request')

      fill_in 'loan_request[title]', with: 'I need money'
      fill_in 'loan_request[blurb]', with: 'I need more money'
      fill_in 'loan_request[description]', with: 'I need lots of  money'
      fill_in 'loan_request[borrowing_amount]', with: '5000'
      fill_in 'loan_request[requested_by_date]', with: DateTime.now
      fill_in 'loan_request[payments_begin_date]', with: DateTime.now.months_since(1)
      fill_in 'loan_request[payments_end_date]', with: DateTime.now.months_since(10)
      click_link_or_button 'Submit'

      within('nav') do
        click_link_or_button 'Make A Loan'
      end
      expect(page).to have_content('Loan Requests')

      find("input[type='checkbox']").set(true)

      click_link_or_button('Add selected Loans to Cart')

      click_link_or_button('Checkout')

      expect(page).to have_content('Amount You Funded This Order: $25')
    end

    it "can't make loan request without title" do
      visit root_path
      click_link_or_button 'Sign Up'
      expect(page).to have_content('Register as a Keevahh User')
      fill_in 'user[first_name]', with: 'Chase'
      fill_in 'user[last_name]', with: 'van Hekken'
      fill_in 'user[email]', with: 'chase@gmail.com'
      fill_in 'user[username]', with: 'ChasevH'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button 'Submit'

      find(:xpath, "//a/img[@alt='Borrow']/..").click
      expect(page).to have_content('Apply to Become a Borrower!')

      fill_in 'tenant[name]', with: 'Chase Business'
      fill_in 'tenant[description]', with: 'This good description'
      click_link_or_button 'Apply'
      expect(page).to have_content('Chase Business')
      click_link_or_button 'Create new loan request'
      expect(page).to have_content('Create New Loan Request')

      fill_in 'loan_request[blurb]', with: 'I need more money'
      fill_in 'loan_request[description]', with: 'I need lots of  money'
      fill_in 'loan_request[borrowing_amount]', with: '5000'
      fill_in 'loan_request[requested_by_date]', with: DateTime.now
      fill_in 'loan_request[payments_begin_date]', with: DateTime.now.months_since(1)
      fill_in 'loan_request[payments_end_date]', with: DateTime.now.months_since(10)
      click_link_or_button 'Submit'
      expect(page).to have_content('Create New Loan Request')
      expect(page).to have_content('error occurred')
    end
  end
end
