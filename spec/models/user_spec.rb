require 'rails_helper'

RSpec.describe User, :type => :model do
  let!(:user) do
    User.create(first_name: "Jim",
                last_name: "Jones",
                email: "jimmy@jones.com",
                username: "JimJones",
                password: "password",
                password_confirmation: "password"
    )
  end

  it "is valid" do
    expect(user).to be_valid
  end

  it 'is invalid without a first name' do
    user.first_name = nil
    expect(user).not_to be_valid

    user.first_name = ""
    expect(user).not_to be_valid
  end

  it 'is valid without a last name' do
    user.last_name  = nil
    expect(user).to be_valid
  end

  it 'assigns username to first name if username is not present' do
    user1 = User.create(first_name: "Jim",
                        last_name: "Jones",
                        email: "test@jones.com",
                        password: "password",
                        password_confirmation: "password"
    )
    expect(user1.username).to eq("Jim")
    expect(user1).to be_valid
  end

  it 'can have a username with more than 2 characters but less than 32' do
    user.username = "j"
    expect(user).not_to be_valid

    user.username = "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
    expect(user).not_to be_valid
  end

  it 'cannot create a user with the same email' do
    user1 = User.create(first_name: "Jim",
                        last_name: "Jones",
                        email: "test@jones.com",
                        username: "Jim",
                        password: "password",
                        password_confirmation: "password"
    )
    user2 = User.create(first_name: "Jim",
                        last_name: "Jones",
                        email: "test@jones.com",
                        username: "Jim",
                        password: "password",
                        password_confirmation: "password"
    )

    expect(user2).not_to be_valid
  end

  it "assigns first name to username if username isn't given" do
    user = User.create(first_name: "Jim",
                        last_name: "Jones",
                        email: "test@jones.com",
                        username: nil,
                        password: "password",
                        password_confirmation: "password"
    )

    expect(user.username).to eq("Jim")
  end

  it "is associated with a role" do
    expect(user).to respond_to(:roles)
  end

end
