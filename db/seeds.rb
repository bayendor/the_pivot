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
    categories = %w(Conflict Zones Education Food Men Expiring Soon Africa Green Vulnerable Populations)
    categories.each do |category|
      Category.create!(name:        category,
                       description: Faker::Lorem.sentence
                      )
    end

    puts 'Categories Created!'
  end

  def generate_loan_requests
    status = %w(open closed)
    date = Time.now.to_datetime
    User.all.each do |user|
      borrowing_amount = rand(200) * 50.to_i
      amount_funded = rand(40) * 25.to_i
      while amount_funded > borrowing_amount
        amount_funded = rand(40) * 25.to_i
      end
      LoanRequest.create!(user_id:             user.id,
                          title:               Faker::Company.bs,
                          blurb:               "This is a blurb.", 
                          description:         Faker::Lorem.sentence,
                          borrowing_amount:    borrowing_amount,
                          amount_funded:       amount_funded,
                          requested_by_date:   date.next_month,
                          payments_begin_date: date.next_month(3),
                          payments_end_date:   date.next_year,
                          status:              status.sample
                         )
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
    10.times do
      n = (Random.rand * 100).to_i
      loan_request = LoanRequest.all.sample
      user = User.create!(first_name: Faker::Name.first_name,
                          last_name:  Faker::Name.last_name,
                          email:      Faker::Internet.safe_email("#{n} #{Faker::Internet.user_name}"),
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
