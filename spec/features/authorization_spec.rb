require 'rails_helper'

describe 'Authorizations', type: :feature do
  let(:user) { FactoryGirl.create(:user) }
  let(:tenant) { FactoryGirl.create(:tenant) }
  let(:wrong_user) { FactoryGirl.create(:borrower) }

  context 'when logged out' do
    before(:each) do
      visit root_path
    end

    it 'cannot access a registered users profile' do
      visit users_path(user.id)
      expect(page).to have_content('Not authorized.')
    end

    it 'cannot access the tenant edit page' do
      visit edit_tenant_path(tenant.id)
      expect(page).to have_content('Access Denied')
    end
  end

  context 'when logged in as a non-tenant' do
    before(:each) do
      visit root_path
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_button 'Log In'
    end

    it 'cannot access the tenant edit page' do
      visit edit_tenant_path(tenant.id)
      expect(page).to have_content('Access Denied')
    end
  end

  context 'as wrong user' do
    it 'cannot visit another users profile page' do
      visit root_path
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_button 'Log In'
      visit edit_user_path(wrong_user.id)
      expect(page).to have_content('Access Denied')
    end
  end
end
