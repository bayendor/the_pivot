class Seed
  def initialize
    generate_users_and_roles
    generate_tenants
    generate_categories
    generate_loan_requests
    # generate_images
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
    amigos = User.find_by(email: "herbert@example.com")
    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Truck Purchase',
          blurb:               'Help Los Amigos Gordos purchase their new food truck, the foundation of their business!',
          description:         'This loan would help Los Amigos Gordos purchase their food truck. They’ve identified a truck that meets their needs — it’s ready to be converted and branded into a burrito-serving powerhouse. Your help will take the Amigos one step closer to a street-ready burrito business!',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/foodtruck.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Truck Branding',
          blurb:               'Help Los Amigos Gordos purchase branding services to make their truck stand out.',
          description:         'This loan would help Los Amigos Gordos purchase branding services with which to decorate their truck using their logo and other information about the business. The truck serves as the ambassador for the entire business, and needs to look fantastic, draw attention and provide info… like a giant business card on wheels.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/foodtruck2.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Grill',
          blurb:               'Help Los Amigos Gordos purchase a grill for their build-your-own-burrito truck.',
          description:         'This loan would help Los Amigos Gordos purchase the grill and other custom accoutrements for their food truck’s kitchen. The Amigos are dedicated to building an environmentally-responsible food truck, and the purchase/conversion of major appliances is something they have researched carefully. They’ve identified a grill that is both affordable and that can be responsibly fueled.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/grill.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Vegetables',
          blurb:               'Help Los Amigos Gordos purchase fresh vegetables for their food truck menu.',
          description:         'This loan would help Los Amigos Gordos purchase fresh staple vegetables. Their menu is full of healthy, delicious options that demand the freshest ingredients.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/veg.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'CSA Membership',
          blurb:               'Help Los Amigos Gordos purchase produce in a way that supports Colorado community farmers.',
          description:         'This loan would help Los Amigos Gordos purchase a subscription to their local CSA, which would provide locally-grown seasonal produce for the production of specialty menu items. By supporting a CSA, the Amigos would also be supporting local farmers and contributing to the community.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/csa.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Spices',
          blurb:               'Help Los Amigos Gordos purchase spices for their food truck’s unique flavor blends.',
          description:         'This loan would help Los Amigos Gordos purchase spices and seasonings for their culinary arsenal. Their menu is full of flavorful, custom-created blends and secret recipes that set their burritos apart from the competition.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/spices.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Meat',
          blurb:               'Help Los Amigos Gordos purchase the best meat possible for their food truck menu.',
          description:         'This loan would help Los Amigos Gordos purchase staple cuts of pork and poultry. The Amigos are committed to a menu featuring only high-quality, responsibly farmed meats.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/meat.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Ranch Parnership',
          blurb:               'Help Los Amigos Gordos purchase a partnership agreement with a Colorado Ranch to serve responsibly-raised beef.',
          description:         'This loan would help Los Amigos Gordos purchase a partnership with Craig Angus Ranch, a family-owned Colorado farm specializing in grass-fed black angus beef that has no antibiotics or hormones. The Amigos would serve Craig Angus beef exclusively, supporting the community while delivering a superior product to their burrito-loving customers.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/meat_grassfed.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Sustainable Operations - Phase 1',
          blurb:               'Help Los Amigos Gordos purchase a biodiesel rig for their food truck.',
          description:         'This loan would help Los Amigos Gordos purchase the items necessary to fuel their food truck with biodiesel. Food trucks are already ahead of brick-and-mortar restaurants as far as environmental footprints, but converting cooking oil into alternative fuel takes things even further.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/operations1.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Sustainable Operations - Phase 2',
          blurb:               'Help Los Amigos Gordos purchase solar power panels for their food truck.',
          description:         'This loan would help Los Amigos Gordos purchase solar tent panels for the top of the truck. The Amigos are dedicated to green resources, and solar power in combination with a converted biodiesel engine would make a truck they’d be proud to call their burrito homebase!',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/operations2.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Insurance',
          blurb:               'Help Los Amigos Gordos purchase insurance coverage for their business.',
          description:         'This loan would help Los Amigos Gordos purchase insurance coverage for the truck. Insurance would cover possible damage to the vehicle or its contents, liability for injury of patrons, workers comp for employees and more. The Amigos are dedicated to a safe, protected truck environment that is fully insured.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/insurance.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Sustainable Vending Supplies',
          blurb:               'Help Los Amigos Gordos purchase environmentally-responsible supplies.',
          description:         'This loan would help Los Amigos Gordos purchase disposables that are recyclable, biodegradable or compostable. The Amigos are dedicated to maintaining an environmentally-responsible truck in every way, and that includes serving their food and disposing of waste in eco-friendly ways.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/materials.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Permits',
          blurb:               'Help Los Amigos Gordos purchase their food truck business permits.',
          description:         'This loan would help Los Amigos Gordos purchase the necessary permits for operation within the city of Denver, CO. Completing the various paperwork and obtaining specific permits can often be the most difficult — and expensive — part of the food truck startup process. Any support is greatly appreciated!',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/permits.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Advertising Supplies',
          blurb:               'Help Los Amigos Gordos purchase the materials needed to spread the word about their food truck.',
          description:         'This loan would help Los Amigos Gordos purchase the minimum of advertising and marketing materials needed to get the word out about their new truck. These funds would include the initial round of application fees for special events such as Food Truck Fridays.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/advertising.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Liquor License',
          blurb:               'Help Los Amigos Gordos purchase their food truck’s liquor license.',
          description:         'This loan would help Los Amigos Gordos purchase the license necessary for legal sale of alcoholic beverages within the city of Denver, CO. The Amigos are looking forward to being able to offer a range of Mexican beers as well as speciality margaritas.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/beer.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Admin Costs',
          blurb:               'Help Los Amigos Gordos purchase what they need to run their burrito business behind the scenes.',
          description:         'This loan would help Los Amigos Gordos purchase basic administrative supplies for bookkeeping, payroll and other organizational needs related to the business. This would also include an initial round of branded collateral and any event-related administrative fees.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/amigos.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Additional Staff',
          blurb:               'Help Los Amigos Gordos purchase some additional helping hands for their food truck.',
          description:         'This loan would help Los Amigos Gordos purchase at least one additional staff member. The four Amigos sometimes need a little extra help when eight hands are not quite enough. The goal is to expand staff slowly, as needed.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/staff.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Branded Tees',
          blurb:               'Help Los Amigos Gordos purchase tees for staff and proud patrons to sport.',
          description:         'This loan would help Los Amigos Gordos purchase an initial order of branded t-shirts for employees to wear and loyal food truck patrons to purchase. The Amigos hope to expand into other branded items but are starting at the basic level with tees. Tees will be made in the USA of responsible materials by a company that maintains fair labor practices.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/shirt.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Cooking Oil',
          blurb:               'Help Los Amigos Gordos purchase cooking oil to fuel their food… and truck!',
          description:         'This loan would help Los Amigos Gordos purchase an initial order of branded t-shirts for employees to wear and loyal food truck patrons to purchase. The Amigos hope to expand into other branded items but are starting at the basic level with tees. Tees will be made in the USA of responsible materials by a company that maintains fair labor practices.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/oil.jpg")
          )
    amigos.save!

    amigos.loan_requests.create!(
          user_id:             amigos.id,
          title:               'Diesel Backsupply',
          blurb:               'Help Los Amigos Gordos purchase a diesel gasoline backup for their food truck for use during Colorado winters.',
          description:         'This loan would help Los Amigos Gordos purchase diesel fuel for use in combination with their biodiesel outfit during the colder months. Biodiesel fuel freezes up in chilly weather, but blending biodiesel with other fuels such as diesel can make winter operation possible. The Amigos plan to have to two fuel tanks — one for regular diesel and an insulated one for biodiesel — specifically to get them through the Colorado winter.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/los_amigos_gordos/gas.jpg")
          )
    amigos.save!

    LoanRequest.all.each do |lr|
      category = Category.all.sample
      lr.categories << category
    end

    puts 'Categories added to loan requests!'

  end

  # def generate_images
  #   lag_pic1 = LoanRequest.find_by(title: 'Truck Purchase')
  #   lag_pic1.image = File.open('#{Rails.root}/app/assets/images/los_amigos_gordos/amigos.jpg')
  #   lag_pic1.save!
  # end

  # puts 'Images seeded!'

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
