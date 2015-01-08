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

    User.create!(first_name: 'Tu Myaung',
                 last_name:  'Widow',
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

    User.create!(first_name: 'Steve',
                 last_name:  'Kinney',
                 email:      'demo+steve@jumpstartlab.com',
                 username:   'steve',
                 password:   'password'
                 )


    User.create!(first_name: 'Ben',
                 last_name:  'Orenstein',
                 email:      'demo+ben@jumpstartlab.com',
                 username:   'ben',
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
    tu = User.find_by(first_name: "Tu Myaung", email: "burmavillage@example.com")
    tu.tenant = Tenant.create!(name:         "The Widows of Tu Myaung Village",
    blurb:        "Widowed farmers join forces to support each other as their village in Myanmar struggles to recover from a devastating cyclone.",
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
    blurb:        "A young mother in one of the poorest regions of Vietnam needs capital to keep her established fishery afloat.",
    description:  "Hai is 32 years old, married with 2 children. For more than ten years, she has worked in agriculture, raising fish. She is requesting loans to purchase more baby fish to raise and sell in the future. As a resident of the central Vietnamese province of Thanh Hoa, one of the poorest regions of the country, the main hardship that Hai faces in her business is a lack of capital. Keevahh support helps Hai and other women in Vietnam who are living in poverty access essential financial services."
    )
    hai.save!

    maria = User.find_by(first_name: "Maria", email: "maria@example.com")
    maria.tenant = Tenant.create!(name:         "San Miguel Market",
    blurb:        "An elderly woman in El Salvador needs your help to strengthen her pupusa business",
    description:  "70 year-old Maria lives in San Miguel, El Salvador with her 36 year-old daughter. Their business is selling meals, pupusas (traditional stuffed tortilla) and soft drinks. They started the business 12 years ago. Maria and her daughter work together every day of the week, from 5.00am to 3.00pm. Their advantage is that there are no similar businesses in the area. Maria's goals are to keep going in her business, to provide a good service to her customers and to increase her contribution in covering her family expenses. Keevahh helps provide growth opportunities to elderly people. People 60 years old and older in El Salvador have limited access to credit, even when fully physically and mentally capable of working. Your support will help Maria keep her business healthy and running."
    )
    maria.save!

    shukri = User.find_by(first_name: "Shukri", email: "shalashukri@example.com")
    shukri.tenant = Tenant.create!(name:         "Shukri from Kosovo",
    blurb:        "Help a father of four from Kosovo renovate his home to improve conditions for his family.",
    description:  "Shukri comes from the Roma community. As with most families in the Roma community, Shukri’s family lives in very poor and terrible conditions. He is the father of four children between the ages of two and eight years old, with three of them currently attending school. In order to support his family, he works in construction, however his salary is very low and since his wife stays home to care for the home and the children, he is the main source of income. The house that they live in is very old and in need of renovations in order to be more livable and a healthier environment. The children are often ill and it becomes difficult to provide the proper health care and treatments to them, especially in the winter. Now, they have decided to improve their conditions to address this issue and take care of their health. Better housing means better health, sanitation, and even educational outcomes for children. Keevahh supports the economic aspirations of minority people in Kosovo. Roma people and ethnic Serbians have historically faced a tremendous amount of hardship in Kosovo, and are still socioeconomically and politically vulnerable. During the 1998-1999 war, the fighting displaced 250,000 people. Among those displaced were an estimated 80-90% of the region’s Roma population. Today, Roma and ethnic Serbians living in Kosovo still face discrimination and are excluded from many aspects of society, including fair political representation and high rates of unemployment. By supporting Shukri you are helping provide opportunity to marginalized populations."
    )
    shukri.save!

    rachel = User.find_by(first_name: "Rachel", email: "demo+rachel@jumpstartlab.com")
    rachel.tenant = Tenant.create!(name:         "Rachel's Sample Store",
    blurb:        Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
    )
    rachel.save!

    jeff = User.find_by(first_name: "Jeff", email: "demo+jeff@jumpstartlab.com")
    jeff.tenant = Tenant.create!(name:         "Jeff's Sample Store",
    blurb:        Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
    )
    jeff.save!

    jorge = User.find_by(first_name: "Jorge", email: "demo+jorge@jumpstartlab.com")
    jorge.tenant = Tenant.create!(name:         "Jorge's Sample Store",
    blurb:        Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
    )
    jorge.save!

    steve = User.find_by(first_name: "Steve", email: "demo+steve@jumpstartlab.com")
    steve.tenant = Tenant.create!(name:         "Steve's Sample Store",
    blurb:        Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
    )
    steve.save!

    ben = User.find_by(first_name: "Ben", email: "demo+ben@jumpstartlab.com")
    ben.tenant = Tenant.create!(name:         "Ben's Sample Store",
    blurb:        Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
    )
    ben.save!

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
          title:               'Ranch Partnership',
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

    amigos.loan_requests.each do |lr|
      category = Category.find(3, 4, 7)
      lr.categories << category
    end

    burma = User.find_by(email: "burmavillage@example.com")
    burma.loan_requests.create!(
          user_id:             burma.id,
          title:               'Ducks',
          blurb:               'Help the widows of Tu Myaung village purchase ducks.',
          description:         'This loan would help the widows of Tu Myaung village purchase ducklings to raise. Nearly every house in the village raises pigs, hens, goats and ducks as livestock. If ducks are kept happy and fed, 60% will lay eggs every day on average. More duck eggs mean more income to villagers. Ducks also help rid farms of pesky weeds and insects.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/burma/ducks.jpg")
          )
    burma.save!

    burma.loan_requests.create!(
          user_id:             burma.id,
          title:               'Duck Feed',
          blurb:               'Help the widows of Tu Myaung village purchase feed for ducks.',
          description:         'This loan would help the widows of Tu Myaung village purchase high quality nutritious feed for their ducks. A packet of feed lasts only a week for 100 ducks, so feed must be purchased every week to make duck life healthy and happy.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/burma/duckfeed.jpg")
          )
    burma.save!

    burma.loan_requests.create!(
          user_id:             burma.id,
          title:               'Pigs',
          blurb:               'Help the widows of Tu Myaung village purchase piglets to raise.',
          description:         'This loan would help the widows of Tu Myaung village purchase at least one pig. Nearly every house in the village raises pigs, hens, goats and ducks as livestock. Most pigs live 10-15 years and the average sow can provide 16 or more piglets a year — those piglets can be sold for anywhere between $50 and $250 USD, providing villagers with the ability to purchase clothing, schooling and other important necessities. The purchase of a pig can be a viable and long term path to sustainability.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/burma/pigs.jpg")
          )
    burma.save!

    burma.loan_requests.create!(
          user_id:             burma.id,
          title:               'Pig Feed',
          blurb:               'Help the widows of Tu Myaung village purchase feed for their pigs.',
          description:         'This loan would help the widows of Tu Myaung village purchase quality feed for their pigs. Though pigs are omnivores and can thrive on crop and garden byproduct scraps, a healthy swine diet comes from a combination of foods. Keevahh support helps buy specific feed that pigs need to stay healthy and grow.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/burma/pigfeed.jpg")
          )
    burma.save!

    burma.loan_requests.create!(
          user_id:             burma.id,
          title:               'Chickens',
          blurb:               'Help the widows of Tu Myaung village purchase chickens.',
          description:         'This loan would help the widows of Tu Myaung village purchase chickens. Nearly every house in the village raises pigs, hens, goats and ducks as livestock. A single chicken can lay up to 200 eggs a year which provides a great source of nutrition and extra income. Chickens also provide organic pest control by getting rid of bugs and worms.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/burma/chickens.jpg")
          )
    burma.save!

    burma.loan_requests.create!(
          user_id:             burma.id,
          title:               'Chicken Feed',
          blurb:               'Help the widows of Tu Myaung village purchase feed for their chickens.',
          description:         'This loan would help the widows of Tu Myaung village purchase high quality nutritious feed for their chickens. Well-fed, healthy hens lay eggs that provide the cornerstone of a healthy diet and that can also be sold for income.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/burma/chickenfeed.jpg")
          )
    burma.save!

    burma.loan_requests.create!(
          user_id:             burma.id,
          title:               'Goats',
          blurb:               'Help the widows of Tu Myaung village purchase goats.',
          description:         'This loan would help the widows of Tu Myaung village purchase at least two goats. Nearly every house in the villages raise pigs, hens, goats and ducks as livestock. On average, each goat produces over 10 times its body weight each year in milk — almost 1 ton of milk per year! The milk can be consumed or sold at market, contributing food at home or a small ongoing income.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/burma/goats.jpg")
          )
    burma.save!

    burma.loan_requests.create!(
          user_id:             burma.id,
          title:               'Goat Feed',
          blurb:               'Help the widows of Tu Myaung village purchase feed for their goats.',
          description:         'This loan would help the widows of Tu Myaung village purchase high quality nutritious feed for their goats. Goats love to forage on grasses and weeds but also need a sampling of grains and minerals in their diet. Keevahh support helps buy what goats need to stay healthy.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/burma/goatfeed.jpg")
          )
    burma.save!

    burma.loan_requests.create!(
          user_id:             burma.id,
          title:               'Flowers for Planting and Selling',
          blurb:               'Help the widows of Tu Myaung village purchase supplies for an income-generating garden.',
          description:         'This loan would help the widows of Tu Myaung village purchase seeds for flower planting. The villagers grow colorful flowers which they sell at morning market. Flowers help generate a steady source of income.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/burma/flowers.jpg")
          )
    burma.save!

    burma.loan_requests.create!(
          user_id:             burma.id,
          title:               'Coconuts for Planting and Selling',
          blurb:               'Help the widows of Tu Myaung village purchase coconut growing supplies.',
          description:         'This loan would help the widows of Tu Myaung village purchase supplies needed to grow and maintain their coconut palms. Coconuts are a staple in the local diet and have many uses. Villagers sell their coconuts at morning market to generate income.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/burma/coconuts.jpg")
          )
    burma.save!

    burma.loan_requests.create!(
          user_id:             burma.id,
          title:               'Betel for Planting and Selling',
          blurb:               'Help the widows of Tu Myaung village purchase betel plants.',
          description:         'This loan would help the widows of Tu Myaung village purchase betel plants to grow. Betel has been cultivated and consumed in southeast Asia since ancient times, used as a stimulant, an antiseptic and a breath-freshener. Villagers sell the leaves at morning market to generate income.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/burma/betel.jpg")
          )
    burma.save!

    burma.loan_requests.create!(
          user_id:             burma.id,
          title:               'Farm Care',
          blurb:               'Help the widows of Tu Myaung village purchase farm and garden supplies.',
          description:         'This loan would help the widows of Tu Myaung village purchase supplies for their farms and gardens. In addition to small crop gardens, most of the women have 5-6 acres of farmland to maintain. Keevahh support helps them conserve soil, irrigate crops and sell goods for income.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/burma/fertilizer.jpg")
          )
    burma.save!

    burma.loan_requests.create!(
          user_id:             burma.id,
          title:               'Farming Staff',
          blurb:               'Help the widows of Tu Myaung village purchase hired help for their farms.',
          description:         'This loan would help the widows of Tu Myaung village hire help to run their farms. Most of the women have 5-6 acres of farmland. Though some have families to help farm the crops, additional assistance is often needed, especially during harvest. Keevahh support helps boost the productivity of these small farms.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/burma/farm.jpg")
          )
    burma.save!

    burma.loan_requests.each do |lr|
      category = Category.find(1, 3, 5, 6)
      lr.categories << category
    end

    vietnam = User.find_by(email: "vietnamfish@example.com")
    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Yellowfin Goby',
          blurb:               'Help Nhom Fishery purchase yellowfin goby fish eggs.',
          description:         'This loan would help Nhom Fishery purchase yellowfin goby to raise. Acanthogobius flavimanus is a species of fish in the goby family known by the common name yellowfin goby. In Vietnam this fish is called Cá Bống hoa.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_yellowfingoby.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Horseface Loach',
          blurb:               'Help Nhom Fishery purchase horseface loach fish eggs.',
          description:         'This loan would help Nhom Fishery purchase horseface loach to raise. Acantopsis choirorhynchos can be distinguished by its down-turned (horse-like) nose. In Vietnam this fish is called Cá chia voi.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_horsefaceloach.jpg")
          )
          vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Tropical Sand Goby',
          blurb:               'Help Nhom Fishery purchase tropical sand goby fish eggs.',
          description:         'This loan would help Nhom Fishery purchase tropical sand gobies to raise. Favonigobius reichei, the Indopacific Tropical Sand Goby, is often simply called tropical sand goby since all sand gobies are tropical. In Vietnam this fish is called Cá Bống răng chó.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_tropicalsandgoby.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Climbing Perch',
          blurb:               'Help Nhom Fishery purchase climbing perch eggs.',
          description:         'This loan would help Nhom Fishery purchase climbing perch to raise. Anabas testudineus is important as a food fish in certain areas of India and in Southeast Asia, where its ability to survive out of the water for extended periods of time, provided it is kept moist, improves its marketability. In Vietnam this fish is called Cá Rô đồng.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_climbingperch.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Japanese Eel',
          blurb:               'Help Nhom Fishery purchase Japanese eel eggs.',
          description:         'This loan would help Nhom Fishery purchase Japanese eels to raise. Anguilla japonica spawns in the sea but lives parts of its life in freshwater. It is an important food fish and used in medicine. In Vietnam the eel is called Cá chình Nhật.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_japaneseeel.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Blue Panchax',
          blurb:               'Help Nhom Fishery purchase blue panchax eggs.',
          description:         'This loan would help Nhom Fishery purchase blue panchax to raise. The blue panchax or whitespot, Aplocheilus panchax, is a common freshwater fish found in a large variety of habitats due to its high adaptability. In Vietnam this fish is called Cá Bạc đầu.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_bluepanchax.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Bighead Carp',
          blurb:               'Help Nhom Fishery purchase bighead carp eggs.',
          description:         'This loan would help Nhom Fishery purchase bighead carp to raise. The bighead carp, Hypophthalmichthys nobilis, has a tremendous growth rate, making it a lucrative aquaculture fish. In Vietnam this fish is called Cá Mè hoa.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_bigheadcarp.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Dwarf Goonch',
          blurb:               'Help Nhom Fishery purchase dwarf goonch eggs.',
          description:         'This loan would help Nhom Fishery purchase dwarf goonch to raise. Bagarius bagarius, also known as the devil catfish, dwarf goonch or goonch, is the much smaller version of the infamous giant goonch. In Vietnam this fish is called Cá chien.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_dwarfgoonch.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Tricolor Sharkminnow',
          blurb:               'Help Nhom Fishery purchase tricolor sharkminnow eggs.',
          description:         'This loan would help Nhom Fishery purchase tricolor sharkminnow to raise. The bala shark, Balantiocheilos melanopterus, also known as the tricolor shark, silver shark, or tricolor shark minnow, is not a true shark, but is commonly so called because of its torpedo-shaped body and large fins. In Vietnam this fish is called Cá hoc tro.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_tricolorsharkminnow.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Sucker Barb',
          blurb:               'Help Nhom Fishery purchase sucker barb eggs.',
          description:         'This loan would help Nhom Fishery purchase sucker barb to raise. The sucker barb (Barbichthys laevis) is a member of the cyprinid family of freshwater fishes. In Vietnam this fish is called Cá ba luoi.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_suckerbarb.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Red Tailed Tinfoil',
          blurb:               'Help Nhom Fishery purchase red tailed tinfoil eggs.',
          description:         'This loan would help Nhom Fishery purchase red tailed tinfoil to raise. The red tailed tinfoil, Barbonymus altus, is a species of freshwater cyprinid fish native to the Mekong river basin. In Vietnam this fish is called Cá he vàng.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_redtailedtinfoil.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Siamese Fighting Fish',
          blurb:               'Help Nhom Fishery purchase siamese fighting fish eggs.',
          description:         'This loan would help Nhom Fishery purchase siamese fighting fish to raise. The Siamese fighting fish, Betta splendens, is known for its brilliant colors and large, flowing fins. In Vietnam this fish is called Cá lia thia.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_siamesefightingfish.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Boeseman Croaker',
          blurb:               'Help Nhom Fishery purchase boeseman croaker eggs.',
          description:         'This loan would help Nhom Fishery purchase boeseman croakers to raise.
          Boesemania microlepis, also known as the boeseman croaker and smallscale croaker, can be heard to make loud, continuous, croaking sounds. In Vietnam this fish is called Ca suu.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_boesemancroaker.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Blotched Snakehead',
          blurb:               'Help Nhom Fishery purchase blotched snakehead eggs.',
          description:         'This loan would help Nhom Fishery purchase blotched snakeheads to raise. The blotched snakehead, Channa maculata, is an elongated, predatory fish distinguished by its long dorsal fins, large mouth and shiny teeth. In Vietnam this fish is called Cá Chuối hoa.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_blotchedsnakehead.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Clown Featherback',
          blurb:               'Help Nhom Fishery purchase clown featherback eggs.',
          description:         'This loan would help Nhom Fishery purchase clown featherbacks to raise. The clown featherback, clown knifefish, or spotted knifefish, Chitala ornata, is a nocturnal tropical fish with a long, knife-like body. In Vietnam this fish is called Cá linh gió.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_clownfeatherback.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Finescale Tigerfish',
          blurb:               'Help Nhom Fishery purchase finescale tigerfish eggs.',
          description:         'This loan would help Nhom Fishery purchase finescale tigerfish to raise. Datnioides microlepis goes by the common names Indonesian tiger datnoid, Indonesian tigerfish or finescale tigerfish. In Vietnam this fish is called Cá huòng.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_finescaletigerfish.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Red Stingray',
          blurb:               'Help Nhom Fishery purchase red stingray eggs.',
          description:         'This loan would help Nhom Fishery purchase red stingrays to raise. Dasyatis akajei, the red stingray, has a diamond-shaped pectoral fin disc and gains its common name from its bright orange-red underside. In Vietnam the red stingray is called Cá Đuối bồng đỏ.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_redstingray.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Wrestling Halfbeak',
          blurb:               'Help Nhom Fishery purchase wrestling halfbeak eggs.',
          description:         'This loan would help Nhom Fishery purchase wrestling halfbeaks to raise. Dermogenys pusilla is a small, slender, livebearing fish, with the elongated lower jaw characteristic of its family. In Vietnam this fish is called Cá lìm kìm.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_wrestlinghalfbeak.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Sharpbelly',
          blurb:               'Help Nhom Fishery purchase sharpbelly eggs.',
          description:         'This loan would help Nhom Fishery purchase sharpbelly to raise. The sharpbelly, Hemiculter leucisculus, wild carp, Korean sharpbelly, or common sawbelly is canned for food in some countries. In Vietnam this fish is called Cá Mựơng.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_sharpbelly.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.create!(
          user_id:             vietnam.id,
          title:               'Zigzag Eel',
          blurb:               'Help Nhom Fishery purchase zigzag eel eggs.',
          description:         'This loan would help Nhom Fishery purchase zigzag eels to raise.
          Mastacembelus armatus is also called the tire track eel, spiny eel, leopard spiny eel and white-spotted spiny eel. This species is not only a popular aquarium fish but also a food fish. In Vietnam this eel is called Cá Chạch bông.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/vietnam_fish/fish_zigzageel.jpg")
          )
    vietnam.save!

    vietnam.loan_requests.each do |lr|
      category = Category.find(5, 6)
      lr.categories << category
    end

    maria = User.find_by(email: "maria@example.com")
    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Basic Grains',
          blurb:               'Help Maria Orbelina purchase basic grains to make her traditional pupusas.',
          description:         'This loan would help Maria purchase basic grains to use as menu ingredients. Though she uses store tortillas for some menu items, the foundation of her business are her delicious pupusas (traditional stuffed tortillas), which she makes from scratch.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/grains.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Vegetables',
          blurb:               'Help Maria Orbelina purchase vegetables for her business.',
          description:         'This loan would help Maria purchase fresh vegetables to grill and roast for various menu items.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/veg.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Condiments',
          blurb:               'Help Maria Orbelina purchase a variety of condiments that compliment her menu items.',
          description:         'This loan would help Maria purchase popular brands of condiments like hot sauce and various salsas. Her patrons appreciate the ability to choose from several brands.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/condiments.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Beans',
          blurb:               'Help Maria Orbelina purchase pinto beans for her business.',
          description:         'This loan would help Maria purchase pinto beans in bulk. She has a family recipe for delicious bean-based side dishes, which she rotates on her menu.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/beans.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Plates',
          blurb:               'Help Maria Orbelina purchase paper plates for her business.',
          description:         'This loan would help Maria purchase the paper plates on which all of her delicious items are served. The majority of Maria’s business is takeaway, so paper plates are the most practical option.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/plates.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Cups',
          blurb:               'Help Maria Orbelina purchase plastic cups for her business.',
          description:         'This loan would help Maria purchase plastic cups for soft drinks. The majority of Maria’s business is takeaway, so plastic cups are the most practical option.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/cups.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Utensils',
          blurb:               'Help Maria Orbelina purchase plastic utensils for her business.',
          description:         'This loan would help Maria purchase plastic forks and spoons for her customers to use. The majority of Maria’s business is takeaway, so plastic utensils are the most practical option.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/utensils.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Pork',
          blurb:               'Help Maria Orbelina purchase pork for her menu items.',
          description:         'This loan would help Maria purchase pork to make carnitas and other delicious pork recipes that were passed down by her abuela.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/pork.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Chicken',
          blurb:               'Help Maria Orbelina purchase chicken for her menu items.',
          description:         'This loan would help Maria purchase chicken for her recipes. Roasted chicken pupusas are one of her most popular menu items.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/chicken.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Beef',
          blurb:               'Help Maria Orbelina purchase beef for her menu items.',
          description:         'This loan would help Maria purchase beef to make carnitas and other delicious beef recipes that were passed down by her abuela.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/beef.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Rice',
          blurb:               'Help Maria Orbelina purchase rice for her business.',
          description:         'This loan would help Maria purchase rice, a foundation menu item that she serves every day.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/rice.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Tortillas',
          blurb:               'Help Maria Orbelina purchase tortillas for her business.',
          description:         'This loan would help Maria purchase tortillas. Though the foundation of her business are her homemade pupusas, she uses store-bought tortillas for other menu items like tacos.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/tortillas.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Soft Drinks',
          blurb:               'Help Maria Orbelina purchase soft drinks for her business.',
          description:         'This loan would help Maria purchase soft drinks like Jarritos, Coca-Cola, Fanta and carbonated juices. Her customers appreciate a range of sodas and drinks.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/softdrinks.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Chair',
          blurb:               'Help Maria Orbelina purchase a comfortable chair so she can rest.',
          description:         'This loan would help Maria purchase a comfortable folding chair so that she can get off her feet occasionally. Maria is 70 years old and is not as young as she once was. She’s used to standing all day but she would love to take a break once in a while.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/chair.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Oil',
          blurb:               'Help Maria Orbelina purchase cooking oil for her business.',
          description:         'This loan would help Maria purchase cooking oil. She uses oil to fry her signature pupusas and to cook other menu items like potatoes and meats.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/oil.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Griddle',
          blurb:               'Help Maria Orbelina purchase a new griddle for her business.',
          description:         'This loan would help Maria purchase a new griddle. She has been using the same griddle since starting her business 12 years ago and an upgrade is sorely needed.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/griddle.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Drinks Cooler',
          blurb:               'Help Maria Orbelina purchase a cooler for her soft drinks.',
          description:         'This loan would help Maria purchase a drinks cooler which she’ll use to serve and cool soft drinks like Jarritos and bottled Coca-Cola. A bicycle cooler is the most practical choice since she would need to move it every night as she closes shop.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/cooler.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Comfortable Shoes',
          blurb:               'Help Maria Orbelina purchase a pair of comfortable shoes to wear to work.',
          description:         'This loan would help Maria purchase a pair of comfortable orthopedic shoes that she can wear throughout her long workday. She’s used to standing all day but usually wears thin, inexpensive sandals. Maria is 70 years old and is not as young as she once was.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/shoes.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'Portable Cooktop and Fuel',
          blurb:               'Help Maria Orbelina purchase a portable cooktop for her business.',
          description:         'This loan would help Maria purchase a cooktop that she can roll away and lock up at the end of every day. She is very worried about the small grill table that she uses being stolen, and seeking a more practical solution.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/cooker.jpg")
          )
    maria.save!

    maria.loan_requests.create!(
          user_id:             maria.id,
          title:               'New Pots',
          blurb:               'Help Maria Orbelina purchase new pots and pans for her business.',
          description:         'This loan would help Maria purchase new pots and pans. She has been using the same pots and pans since starting her business 12 years ago and an upgrade is sorely needed.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/maria/pots.jpg")
          )
    maria.save!

    maria.loan_requests.each do |lr|
      category = Category.find(3, 5, 8)
      lr.categories << category
    end

    shukri = User.find_by(email: "shalashukri@example.com")
    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Tile',
          blurb:               'Help Shukri purchase tile for his kitchen and bathroom.',
          description:         'This loan would help Shukri purchase new tile for his kitchen and bathroom. His tiles are currently broken in many places and need to be replaced. He plans to buy simple marble stone tile by the case and will also need trim pieces, grout, backerboard, thinset and installation tools.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/tile.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Concrete Mix',
          blurb:               'Help Shukri purchase concrete mix for various indoor and outdoor home repairs.',
          description:         'This loan would help Shukri purchase new tile for his kitchen and bathroom. His tiles are currently broken in many places and need to be replaced. He plans to buy simple marble stone tile by the case and will also need trim pieces, grout, backerboard, thinset and installation tools.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/concrete.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Plumbing Materials',
          blurb:               'Help Shukri purchase plumbing materials for home repairs.',
          description:         'This loan would help Shukri purchase pipes, valves and fittings for basic plumbing installation and plumbing repairs in his home.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/plumbing.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Exhaust Fan',
          blurb:               'Help Shukri purchase an exhaust fan for his home.',
          description:         'This loan would help Shukri purchase an exhaust fan to ventilate his home during renovation. Shukri has four young children and is concerned for their health during construction.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/fan.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Dining Table',
          blurb:               'Help Shukri purchase a replacement dining table for his family.',
          description:         'This loan would help Shukri purchase a new table. He has a wife and four young children, and their old small table was damaged. The table serves not just as a dining table but also as a hub for family time, homework and business.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/table.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Toilet',
          blurb:               'Help Shukri purchase a new toilet for his family’s home.',
          description:         'This loan would help Shukri purchase a new toilet. Shukri’s family shares one small bathroom with an old and often malfunctioning toilet. Improving sanitation is high priority for this father of four.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/toilet.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Tub',
          blurb:               'Help Shukri purchase a tub for his children.',
          description:         'This loan would help Shukri purchase a bath tub. The family currently has only a small shower and a tub would both make bathing four children easier but also conserve water.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/tub.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Heater',
          blurb:               'Help Shukri purchase a small space heater for his children.',
          description:         'This loan would help Shukri purchase a space heater for use in his children’s bedroom. He hopes to buy the safest model possible, one with automatic shut-off and specifically for use in living areas.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/heater.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Towel Bars',
          blurb:               'Help Shukri purchase towel bars and other functional accessories for his home.',
          description:         'This loan would help Shukri purchase a variety of small items like towel bars, hooks, knobs, handles and childproof locks for cabinets.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/towelbar.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Light Fixtures',
          blurb:               'Help Shukri purchase a variety of basic light fixtures for his home.',
          description:         'This loan would help Shukri purchase what he needs to repair several damaged or broken lights throughout the house, including safety lights on the exterior of the home.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/lightfixture.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Shower Heads and Faucets',
          blurb:               'Help Shukri purchase shower heads and faucets for his home.',
          description:         'This loan would help Shukri purchase replacement faucets for his bathroom kitchen and a new shower head for the family’s shared bathroom. The fixtures he has now are worn out and inefficient, leaking frequently and sorely in need of an upgrade.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/faucet.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Paint and Primer',
          blurb:               'Help Shukri purchase supplies to give his home a much-needed coat of paint.',
          description:         'This loan would help Shukri purchase paint and primer for both the interior and exterior of his house. The house has not been painted since Shukri and his family moved in, and he is concerned about lead and mold around his children.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/paint.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Demolition Costs',
          blurb:               'Help Shukri purchase the hired help he needs to remove a dangerous outbuilding from his property.',
          description:         'This loan would help Shukri purchase demolition help. There is a small building on the back of his plot that is in severe disrepair. Shukri is concerned for the safety of his children. It is more cost-effective to tear the building down than it is to try and repair it. Shukri hopes to be able to reuse many of the materials.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/demolition.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Grout',
          blurb:               'Help Shukri purchase grout for various areas of his home.',
          description:         'This loan would help Shukri purchase grout. He plans to do bathroom, kitchen and basement repair and thus needs to budget for lots of grout.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/grout.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Cleaning Supplies',
          blurb:               'Help Shukri purchase supplies to keep his home clean and livable during and after construction.',
          description:         'This loan would help Shukri purchase various cleaning supplies. There will be a lot of construction going on and, with four small children, Shukri and his wife need to keep their home clean, safe and livable both during and after construction.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/cleaningsupplies.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Plumber',
          blurb:               'Help Shukri purchase the aid of a plumber for larger home repairs.',
          description:         'This loan would help Shukri purchase plumbing services. Though he is capable of doing basic plumbing repairs himself, he needs to call in a professional for some major renovations in the bathroom and kitchen.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/plumber.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Tools',
          blurb:               'Help Shukri purchase the basic household tools he needs for home repair.',
          description:         'This loan would help Shukri purchase a set of basic tools and hardware to use during renovation. He does not have a complete set of tools and is missing several important pieces.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/tools.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Cords, Cables and Wiring',
          blurb:               'Help Shukri purchase the supplies he needs for basic electrical repairs.',
          description:         'This loan would help Shukri purchase the cords, cables and wiring required for basic electrical installation and repair.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/cords.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Hardware and Fittings',
          blurb:               'Help Shukri purchase hardware such as small power tools and fittings.',
          description:         'This loan would help Shukri purchase or rent some small power tools needed for his home repairs. He also needs to outfit his workbench with fittings and accessories such as hinges, nails and screws.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/hardware.jpg")
          )
    shukri.save!

    shukri.loan_requests.create!(
          user_id:             shukri.id,
          title:               'Circular Saw',
          blurb:               'Help Shukri purchase a circular saw for use during his home reconstruction and repair.',
          description:         'This loan would help Shukri purchase the one major power tool he needs for reconstruction — a circular saw and a pair of sawhorses.',
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/shukri/saw.jpg")
          )
    shukri.save!

    shukri.loan_requests.each do |lr|
      category = Category.find(4, 7, 8)
      lr.categories << category
    end


    rachel = User.find_by(email: "demo+rachel@jumpstartlab.com")
    5.times do |i|
      LoanRequest.create!(
          user_id:             rachel.id,
          title:               Faker::Company.bs,
          blurb:               Faker::Lorem.sentence,
          description:         Faker::Lorem.paragraph(3),
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/placeholder.jpg")
          )
    end
    rachel.save!

    rachel.loan_requests.each do |lr|
      category = Category.find(2, 3, 5)
      lr.categories << category
    end

    jeff = User.find_by(email: "demo+jeff@jumpstartlab.com")
    5.times do |i|
      LoanRequest.create!(
          user_id:             jeff.id,
          title:               Faker::Company.bs,
          blurb:               Faker::Lorem.sentence,
          description:         Faker::Lorem.paragraph(3),
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/placeholder.jpg")
          )
    end
    jeff.save!

    jeff.loan_requests.each do |lr|
      category = Category.find(1, 2, 4)
      lr.categories << category
    end

    jorge = User.find_by(email: "demo+jorge@jumpstartlab.com")
    5.times do |i|
      LoanRequest.create!(
          user_id:             jorge.id,
          title:               Faker::Company.bs,
          blurb:               Faker::Lorem.sentence,
          description:         Faker::Lorem.paragraph(3),
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/placeholder.jpg")
          )
    end
    jorge.save!

    jorge.loan_requests.each do |lr|
      category = Category.find(2, 4)
      lr.categories << category
    end

    steve = User.find_by(email: "demo+steve@jumpstartlab.com")
    5.times do |i|
      LoanRequest.create!(
          user_id:             steve.id,
          title:               Faker::Company.bs,
          blurb:               Faker::Lorem.sentence,
          description:         Faker::Lorem.paragraph(3),
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/placeholder.jpg")
          )
    end
    steve.save!

    steve.loan_requests.each do |lr|
      category = Category.find(2, 4, 7)
      lr.categories << category
    end

    ben = User.find_by(email: "demo+ben@jumpstartlab.com")
    5.times do |i|
      LoanRequest.create!(
          user_id:             ben.id,
          title:               Faker::Company.bs,
          blurb:               Faker::Lorem.sentence,
          description:         Faker::Lorem.paragraph(3),
          borrowing_amount:    rand(40..60) * 25.to_i,
          amount_funded:       rand(20..30) * 25.to_i,
          requested_by_date:   DateTime.now,
          payments_begin_date: DateTime.now.months_since(1),
          payments_end_date:   DateTime.now.months_since(7),
          status:              'open',
          image:               open("app/assets/images/tenants/placeholder.jpg")
          )
    end
    ben.save!

    ben.loan_requests.each do |lr|
      category = Category.find(2, 4, 8)
      lr.categories << category
    end

    puts 'Categories added to loan requests!'

  end

  def generate_loans
    status = %w(ordered completed canceled paid)
    Tenant.all.each do |tenant|
      2.times do |i|
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
    end

    puts 'Users with loans generated!'
    puts 'Loans generated!'
  end
end

Seed.new
