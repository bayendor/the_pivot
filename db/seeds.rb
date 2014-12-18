class Seed
  def initialize
    generate_users_and_roles
    generate_categories
    generate_loan_requests
    generate_tenants
    generate_loans
  end


  def generate_users_and_roles
    User.create!(first_name: "Rachel",
                 last_name:  "Warbelow",
                 email:      "demo+rachel@jumpstartlab.com",
                 password:   "password"
    )

    User.create!(first_name: "Jeff",
                 email:      "demo+jeff@jumpstartlab.com",
                 username:   "j3",
                 password:   "password"
    )

    User.create!(first_name: "Jorge",
                 last_name:  "Tellez",
                 email:      "demo+jorge@jumpstartlab.com",
                 username:   "novohispano",
                 password:   "password"
    )

    admin_user = User.create!(first_name: "Josh",
                              last_name:  "Cheek",
                              email:      "demo+josh@jumpstartlab.com",
                              username:   "josh",
                              password:   "password"
    )

    admin_user2 = User.create!(first_name: "Horace",
                              last_name:  "Worace",
                              email:      "demo+horace@jumpstartlab.com",
                              username:   "horace",
                              password:   "password"
    )

    webmaster_user = User.create!(first_name: "Bruce",
                                  last_name:  "Wayne",
                                  email:      "Bruce_Wayne@WayneEnterprises.com",
                                  username:   "batman",
                                  password:   "password"
    )

    admin = Role.create!(name: "admin")
    admin_user.roles, admin_user2.roles = [admin], [admin]
    webmaster_user.roles                = [Role.create!(name: "webmaster"), admin]

    puts "Users generated!"
  end

  def generate_categories
    categories = %W(Conflict Zones Education Food Men Expiring Soon Africa Green Vulnerable Populations)
    categories.each do |category|
      Category.create!(name:        category,
                       description: Faker::Lorem.sentence
                      )
    end

    puts "Categories Created!"
  end

  def generate_loan_requests
    status = %W(open closed)
    User.all.each do |user|
      LoanRequest.create(user_id:             user.id,
                         title:               Faker::Company.bs,
                         description:         Faker::Lorem.sentence,
                         borrowing_amount:    (Faker::Commerce.price * 1000).to_i,
                         amount_funded:       (Faker::Commerce.price * 100).to_i,
                         requested_by_date:   Faker::Date.forward(100).to_datetime,
                         payments_begin_date: Faker::Date.forward(100).to_datetime,
                         payments_end_date:   Faker::Date.forward(200).to_datetime,
                         status:              status.sample
                        )
    end

    LoanRequest.all.each do |lr|
      lr.categories << Category.all.sample
    end

    puts "Loan requests generated!"
    puts "Categories added to loan requests!"
  end

  def generate_tenants
    User.count.times do
      t = Tenant.create(name:         Faker::App.name,
                        description:  Faker::Lorem.sentence
                       )
    end

    puts "Tenants generated!"
  end

  def generate_loans
    status = %W(ordered completed canceled paid)
    10.times do
      n = (Random.rand * 10).to_i
      loan_request = LoanRequest.all.sample
      user = User.create(first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name,
                          email:     Faker::Internet.safe_email("#{n} #{Faker::Internet.user_name}"),
                          password:  "password"
                         )

      loan = Loan.create(user:         user,
                         loan_request: loan_request,
                         amount:       (Faker::Commerce.price * 100).to_i,
                         status:       status.sample
                        )

    end

    puts "Users with loans generated!"
    puts "Loans generated!"
  end
end

Seed.new
