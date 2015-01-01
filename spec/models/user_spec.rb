require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    FactoryGirl.create(:user)
  end

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'is invalid without a first name' do
    user.first_name = nil
    expect(user).not_to be_valid

    user.first_name = ''
    expect(user).not_to be_valid
  end

  it 'is valid without a last name' do
    user.last_name  = nil
    expect(user).to be_valid
  end

  it 'assigns username to first name if username is not present' do
    user1 = User.create(first_name: 'Jim',
                        last_name: 'Jones',
                        email: 'test@jones.com',
                        password: 'password',
                        password_confirmation: 'password'
                       )
    expect(user1.username).to eq('Jim')
    expect(user1).to be_valid
  end

  it 'is invalid if username is too short' do
    user.username = 'A'
    expect(user).to_not be_valid
  end

  it 'is invalid if username is too long' do
    user.username = ('A' * 33)
    expect(user).to_not be_valid
  end

  it 'requires a valid email address' do
    addresses = %w(user@foo,com user_at_foo.org example.user@foo.
                   foo@bar_baz.com foo@bar_baz.com)
    addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).to_not be_valid
    end
  end

  it 'is invalid if the email is not unique' do
    user.save
    invalid_user = user.dup
    invalid_user.email = user.email.upcase
    expect(invalid_user.save).to be false
  end

  it 'is invalid if password is not present' do
    user.password = user.password_confirmation = ''
    expect(user).to_not be_valid
  end

  it 'is invalid if password is too short' do
    user.password = user.password_confirmation = 'a' * 5
    expect(user).to_not be_valid
  end
  it 'is invalid if password does not match confirmation' do
    user.password = 'foobar'
    expect(user).to_not be_valid
  end

  it "assigns first name to username if username isn't given" do
    user = User.create(first_name: 'Jim',
                       last_name: 'Jones',
                       email: 'test@jones.com',
                       username: nil,
                       password: 'password',
                       password_confirmation: 'password'
                      )

    expect(user.username).to eq('Jim')
  end

  it 'is associated with a role' do
    expect(user).to respond_to(:roles)
  end
end
