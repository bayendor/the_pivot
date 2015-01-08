require 'rails_helper'

describe 'Borrower Interactions', type: :feature do
  context 'as a registered borrower' do
    let(:borrower) { FactoryGirl.create(:borrower) }
    let(:tenant) { FactoryGirl.create(:tenant) }
    before(:each) do
      visit root_path
      fill_in 'Username', with: borrower.username
      fill_in 'Password', with: borrower.password
      click_button 'Log In'
      visit new_tenant_path
      fill_in 'Store Name', with: 'Aperture Labs'
      click_button 'Apply'
    end

    describe 'when a borrower logs in' do
      it 'they are shown their store page' do
        page.all(:link, 'My Store')[0].click
        expect(page).to have_content('Aperture Labs')
      end

    end
  end
end
