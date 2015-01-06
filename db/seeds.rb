class Seed
  def initialize
    generate_users_and_roles
    generate_tenants
    generate_categories
    generate_loan_requests
    generate_loans
  end

  def generate_users_and_roles
    User.create!(first_name: 'Rachel',
                 last_name:  'Warbelow',
                 email:      'demo+rachel@jumpstartlab.com',
                 username:   'rachel',
                 password:   'password'
                )

    User.create!(first_name: 'Jeff',
                 last_name:  'Casimir',
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

    User.create!(first_name: 'Herbert',
                 last_name:  'Joseph',
                 email:      'herbert@example.com',
                 username:   'herbert',
                 password:   'password'
                )

    User.create!(first_name: 'Tu',
                 last_name:  'Myaung',
                 email:      'burmavillage@example.com',
                 username:   'burmavillage',
                 password:   'password'
                )

    User.create!(first_name: 'Hai',
                 last_name:  'Nhom',
                 email:      'vietnamfish@example.com',
                 username:   'vietnamfish',
                 password:   'password'
                )

    User.create!(first_name: 'Maria',
                 last_name:  'Orbelina',
                 email:      'maria@example.com',
                 username:   'maria',
                 password:   'password'
                )

    User.create!(first_name: 'Shukri',
                 last_name:  'Shala',
                 email:      'shalashukri@example.com',
                 username:   'shukri',
                 password:   'password'
                 )

    User.create!(first_name: 'Kayed',
                 last_name:  'Ahmadi',
                 email:      'kayed94@example.com',
                 username:   'kahmadi',
                 password:   'password'
                 )


    User.create!(first_name: 'Guillermo',
                 last_name:  'Rodriguez',
                 email:      'guillermo@example.com',
                 username:   'grodriguez',
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
                                  email:      'bruce_wayne@wayneenterprises.com',
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
                  "Men", "Women", "Agriculture",
                  "Green", "Vulnerable Populations"]
    categories.each do |category|
      Category.create!(name:        category,
                       description: Faker::Lorem.sentence
                      )
    end

    puts 'Categories Created!'
  end

  def generate_tenants
    rachel = User.find_by(first_name: "Rachel", email: "demo+rachel@jumpstartlab.com")
    rachel.tenant = Tenant.create!(name:         "Rachel's Store",
                                   blurb:        Faker::Lorem.sentence,
                                   description:  Faker::Lorem.paragraph
                                  )
    rachel.save!

    jeff = User.find_by(first_name: "Jeff", email: "demo+jeff@jumpstartlab.com")
    jeff.tenant = Tenant.create!(name:         "Jeff's Store",
    blurb:        Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
    )
    jeff.save!

    jorge = User.find_by(first_name: "Jorge", email: "demo+jorge@jumpstartlab.com")
    jorge.tenant = Tenant.create!(name:         "Jorge's Store",
    blurb:        Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
    )
    jorge.save!

    tu = User.find_by(first_name: "Tu", email: "burmavillage@example.com")
    tu.tenant = Tenant.create!(name:         "The Widows of Tu Myaung Village",
    blurb:        "A group of widows join forces to support each other as their village in Myanmar struggles to recover from a devastating cyclone.",
    description:  "The Ayeyarwady region of Myanmar was heavily devastated when Cyclone Nargis made landfall in 2008, one of the deadliest cyclones ever recorded. Nargis claimed nearly 1 million lives and left thousands homeless. Millions of low income farmers are still struggling to recover their productivity and income. The majority of these farmers have virtually no access to formal credit institutions and are unable to afford the equipment, material, and labor necessary to grow their crops. Keevahh funding will be used to help financing opportunities that reach low income, rural farmers. In the village of Tu Myaung, a group of women widowed by Nargis have come together to support each other as they rebuild their lives, sharing the resources necessary to raise livestock, run their small farms and grow crops and flowers to sell at morning market. Your support helps them rebuild dependable livelihoods after one of the worst natural disasters in history."
    )
    tu.save!

    herbert = User.find_by(first_name: "Herbert", email: "herbert@example.com")
    herbert.tenant = Tenant.create!(name:         "Los Amigos Gordos",
    blurb:        "A build-your-own burrito truck will reinvigorate the careers of four men.",
    description:  "Los Amigos Gordos are Travis, Sam, Herbert and Tim, four Coloradans who all lost their jobs in the economic downturn. Bonding over a common love of Mexican street food and pooling shared entrepreneurial backgrounds, they have joined together to start a food truck specializing in build-your-own burritos. The food truck scene has exploded in the last decade, offering exciting new business opportunities to dedicated individuals. The Amigos aim to bring eco-friendly, sustainable street food to the citizens of Denver. Their truck will run on biodiesel, use recycled vending materials, and sell delicious burritos made from ingredients that are organic and locally-sourced, including grass-fed Colorado beef and CSA vegetables. Their burrito truck will both support and become a part of the local economy and community. The menu will be designed around a build-your-own burrito concept, giving customers a wide range of flexible options. Your support helps the Amigos with initial funding to turn their truck dream into a reality and restart their careers."
    )
    herbert.save!

    hai = User.find_by(first_name: "Hai", email: "vietnamfish@example.com")
    hai.tenant = Tenant.create!(name:         "Nhom Fishery",
    blurb:        Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
    )
    hai.save!

    maria = User.find_by(first_name: "Maria", email: "maria@example.com")
    maria.tenant = Tenant.create!(name:         "San Miguel Market",
    blurb:        Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
    )
    maria.save!

    shukri = User.find_by(first_name: "Shukri", email: "shalashukri@example.com")
    shukri.tenant = Tenant.create!(name:         "Shukri from Kosovo",
    blurb:        Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
    )
    shukri.save!

    kayed = User.find_by(first_name: "Kayed", email: "kayed94@example.com")
    kayed.tenant = Tenant.create!(name:         "Kayed the Student",
    blurb:        Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
    )
    kayed.save!

    guillermo = User.find_by(first_name: "Guillermo", email: "guillermo@example.com")
    guillermo.tenant = Tenant.create!(name:         "Profesor Guillermo",
    blurb:        Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
    )
    guillermo.save!

    puts 'Tenants generated!'
  end

  def generate_loan_requests
    users = User.where.not(tenant_id: nil)
    users.each do |user|
      borrowing_amount = rand(40..60) * 25.to_i
      amount_funded = rand(20..30) * 25.to_i
        20.times do |i|
          LoanRequest.create!(
          user_id:             user.id,
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
      category = Category.all.sample
      lr.categories << category
    end

    puts 'Categories added to loan requests!'

  end

  def generate_loans
    status = %w(ordered completed canceled paid)
    5.times do |i|
      loan_request = LoanRequest.all.sample
      User.all.each do |user|
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
    end

    puts 'Users with loans generated!'
    puts 'Loans generated!'
  end
end

Seed.new
