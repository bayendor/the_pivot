FactoryGirl.define do
  factory :user do
    first_name 'Cave'
    last_name 'Johnson'
    email 'cave@aperturelabs.com'
    username 'cavej'
    password 'password'
    password_confirmation 'password'
  end

  factory :tenant do
    name "Mr. Jorge's Place"
    description "It's filled with beiber!"
  end

  factory :borrower, class: User do
    first_name 'Cave'
    last_name 'Johnson'
    email 'cave@aperturelabs.com'
    username 'cavej'
    password 'password'
    password_confirmation 'password'
  end
end
