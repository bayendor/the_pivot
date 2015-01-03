class Seed
  def initialize
    generate_users_and_roles
    generate_categories
    generate_loan_requests
    generate_tenants
    generate_loans
  end

  def generate_users_and_roles
    User.create!(first_name: 'Rachel',
                 last_name:  'Warbelow',
                 email:      'demo+rachel@jumpstartlab.com',
                 password:   'password'
                )

    User.create!(first_name: 'Jeff',
                 email:      'demo+jeff@jumpstartlab.com',
                 username:   'j3',
                 password:   'password'
                )

    User.create!(first_name: 'Jorge',
                 last_name:  'Tellez',
                 email:      'demo+jorge@jumpstartlab.com',
                 username:   'novohispano',
                 password:   'password'
                )

    admin_user = User.create!(first_name: 'Josh',
                              last_name:  'Cheek',
                              email:      'demo+josh@jumpstartlab.com',
                              username:   'josh',
                              password:   'password'
                             )

    admin_user2 = User.create!(first_name: 'Horace',
                               last_name:  'Worace',
                               email:      'demo+horace@jumpstartlab.com',
                               username:   'horace',
                               password:   'password'
                              )

    webmaster_user = User.create!(first_name: 'Bruce',
                                  last_name:  'Wayne',
                                  email:      'bruce_wayne@waynewnterprises.com',
                                  username:   'batman',
                                  password:   'password'
                                 )

    admin = Role.create!(name: 'admin')
    admin_user.roles, admin_user2.roles = [admin], [admin]
    webmaster_user.roles                = [Role.create!(name: 'webmaster'), admin]

    puts 'Users generated!'
  end

  def generate_categories
    categories = ["Conflict Zones", "Education", "Food",
                  "Men", "Expiring Soon", "Africa",
                  "Green", "Vulnerable Populations"]
    categories.each do |category|
      Category.create!(name:        category,
                       description: Faker::Lorem.sentence
                      )
    end

    puts 'Categories Created!'
  end

  def generate_loan_requests
    User.all.each do |user|
      borrowing_amount = rand(40..60) * 25.to_i
      amount_funded = rand(20..30) * 25.to_i
     2.times do
        LoanRequest.create!(user_id:             user.id,
                            title:               Faker::Company.bs,
                            blurb:               'This is a blurb.',
                            description:         Faker::Lorem.sentence,
                            borrowing_amount:    borrowing_amount,
                            amount_funded:       amount_funded,
                            requested_by_date:   DateTime.now,
                            payments_begin_date: DateTime.now.months_since(1),
                            payments_end_date:   DateTime.now.months_since(7),
                            status:              'open'
                           )
      end
    end

    LoanRequest.all.each do |lr|
      lr.categories << Category.all.sample
    end

    puts 'Loan requests generated!'
    puts 'Categories added to loan requests!'
  end

  def generate_tenants
    User.all.each do |user|
      user.tenant = Tenant.create!(name:         "#{Faker::App.name} #{Faker::App.name}",
                                   description:  Faker::Lorem.sentence
                                  )
      user.save!
    end

    puts 'Tenants generated!'
  end

  def generate_loans
    status = %w(ordered completed canceled paid)
    10.times do |i|
      loan_request = LoanRequest.all.sample
      user = User.create!(first_name: Faker::Name.first_name,
                          last_name:  Faker::Name.last_name,
                          email:      Faker::Internet.safe_email("#{i} #{Faker::Internet.user_name}"),
                          password:   'password'
                         )

      loan = Loan.create!(user:         user,
                          loan_request: loan_request,
                          amount:       (Faker::Commerce.price * 100).to_i,
                          status:       status.sample
                         )
    end

    puts 'Users with loans generated!'
    puts 'Loans generated!'
  end
end

Seed.new
