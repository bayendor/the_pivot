require 'rails_helper'

describe 'Iteration 1 User Interactions', type: :feature do
  
  context 'a registered user' do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      visit root_path
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_button 'Log In'
    end

    it 'can register as a borrower' do
      
    end
  end
end
