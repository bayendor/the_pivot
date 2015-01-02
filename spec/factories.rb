FactoryGirl.define do
  factory :user do
    first_name            'Cave'
    last_name             'Johnson'
    email                 'cave@aperturelabs.com'
    username              'cavej'
    password              'password'
    password_confirmation 'password'
  end

  factory :tenant do
    name        "Mr. Jorge's Place"
    description "It's filled with beiber!"
  end

  factory :borrower, class: User do
    first_name            'Cave'
    last_name             'Johnson'
    email                 'cave@aperturelabs.com'
    username              'cavej'
    password              'password'
    password_confirmation 'password'
  end

  factory :loan_request_1, class: LoanRequest do
    user_id             10101
    title               'Buy Jorge Beiber Tickets'
    blurb               'Jorge loves Bieber'
    description         'Jorge desperately wants to see a concert!'
    borrowing_amount    500
    amount_funded       10
    requested_by_date   DateTime.now
    payments_begin_date DateTime.now.months_since(1)
    payments_end_date   DateTime.now.months_since(7)
    status             'open'
  end

  factory :loan_request_2, class: LoanRequest do
    user_id             1337
    title               'Steve needs a new phone.'
    blurb               'Steve is clumsy.'
    description         "Steve broke his phone and it doesn't work."
    borrowing_amount    800
    amount_funded       60
    requested_by_date   DateTime.new(2014, 12, 28)
    payments_begin_date DateTime.new(2015, 3, 30)
    payments_end_date   DateTime.new(2015, 8, 17)
    status             'open'
  end

  factory :category_1, class: Category do
    name        'Pig Farmers'
    description 'Swine wrestlers getting dirty.'
  end

  factory :category_2, class: Category do
    name        'Dinosaurs'
    description 'Helping dinosaurs and their needs.'
  end

  factory :loan, class: Loan do
    user
    loan_request_id 1000
    amount          100
    status          'completed'
  end

  factory :role, class: Role do
    name 'admin'
  end

end
