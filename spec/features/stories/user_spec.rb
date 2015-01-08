require 'rails_helper'

describe 'User Interactions', type: :feature do
  context 'a registered user' do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      visit root_path
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_button 'Log In'
    end

    context 'can register as a borrower' do
      it 'and is assigned a business page' do
        tenant_count = Tenant.count
        visit '/new'
        expect(page).to have_content('Apply to Become a Borrower!')
        fill_in 'Store Name', with: 'Aperture Labs'
        click_button 'Apply'
        expect(page).to have_content('Thanks for creating your store')
        expect(Tenant.count).to eq(tenant_count + 1)
      end
    end

    context 'can update their user profile' do
      it 'has a link to the user profile' do
        expect(page).to have_link('My Profile')
      end

      it 'can navigate to an edit profile page' do
        click_link 'My Profile'
        expect(page).to have_content('edit')
      end

      it 'can change their username' do
        click_link 'My Profile'
        click_link 'edit'
        fill_in 'Username', with: 'Cavey'
        click_button 'Submit'
        expect(page).to have_content('User was updated.')
      end

      it 'can change their email' do
        click_link 'My Profile'
        click_link 'edit'
        fill_in 'Email', with: 'boss@aperturelabs.com'
        click_button 'Submit'
        expect(page).to have_content('User was updated.')
      end
    end
  end
end
