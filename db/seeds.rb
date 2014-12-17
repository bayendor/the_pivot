class Seed
  def initialize
    generate_users_and_roles
    # generate_items
    # generate_fillings
    # generate_item_fillings
    # generate_orders
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
                                  username:   "webmaster",
                                  password:   "password"
    )

    admin = Role.create!(name: "admin")
    admin_user.roles      = [admin]
    admin_user2.roles     = [admin]
    webmaster_user.roles  = [Role.create!(name: "webmaster"), admin]

    puts "Users generated!"
  end

  def generate_items
    Item.create!(name:        "Burrito",
                 price:       500,
                 description: "It's a bunch of delicious fillings inside a tortilla. Take it with you everywhere.",
                 image:       File.new("#{Rails.root}/app/assets/images/menu/items/burrito.jpg")
    )

    Item.create!(name:        "Burrito Bowl",
                 price:       175,
                 description: "It's like a burrito, but the fillings are in a bowl. It's not as portable.",
                 image:       File.new("#{Rails.root}/app/assets/images/menu/items/burrito_bowl.jpg")
    )

    Item.create!(name:        "Torta",
                 price:       400,
                 description: "It's a burrito sandwich. What more could you want?",
                 image:       File.new("#{Rails.root}/app/assets/images/menu/items/torta.jpg")
    )

    Item.create!(name:        "Taco",
                 price:       100,
                 description: "Put some fillings in it. Turn your head sideways. Eat.",
                 image:       File.new("#{Rails.root}/app/assets/images/menu/items/taco.jpg")
    )

    Item.create!(name:        "Quesadilla",
                 price:       250,
                 description: "A tortilla cheese sandwich. Other fillings optional.",
                 image:       File.new("#{Rails.root}/app/assets/images/menu/items/quesadilla.jpg")
    )

    Item.create!(name:        "Tamale",
                 price:       200,
                 description: "Meat, wrapped in corn, wrapped in corn, wrapped in corn.",
                 image:       File.new("#{Rails.root}/app/assets/images/menu/items/tamale.jpg")
    )

    Item.create!(name:        "Salad",
                 price:       300,
                 description: "Sometimes thought as real food. It's a bowl of leaves, with some meat sometimes.",
                 image:       File.new("#{Rails.root}/app/assets/images/menu/items/salad.jpg")
    )

    puts "Items generated!"
  end

  def generate_fillings
    Filling.create!(title:       "Steak",
                    description: "It's meat. From an animal.",
                    price:       100,
                    food_group:  "meats",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/steak.jpg")
    )

    Filling.create!(title:       "Chicken",
                    description: "Made from home made chickens.",
                    price:       70,
                    food_group:  "meats",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/chicken.jpg")
    )

    Filling.create!(title:       "Barbacoa",
                    description: "We think it's from goats.",
                    price:       200,
                    food_group:  "meats",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/barbacoa.jpg")
    )

    Filling.create!(title:       "Carnitas",
                    description: "Pork.",
                    price:       150,
                    food_group:  "meats",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/carnitas.jpg")
    )

    Filling.create!(title:       "Sofritas",
                    description: "It's toe and fu.",
                    price:       150,
                    food_group:  "veggies",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/sofritas.jpg")
    )

    Filling.create!(title:       "Fajita Vegetables",
                    description: "It has some different peppers.",
                    price:       100,
                    food_group:  "veggies",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/fajitas.jpg")
    )

    Filling.create!(title:       "Black Beans",
                    description: "They are black.",
                    food_group:  "veggies",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/black_beans.jpg")
    )

    Filling.create!(title:       "Pinto Beans",
                    description: "They are very pinto.",
                    food_group:  "veggies",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/pinto_beans.jpg")
    )

    Filling.create!(title:       "White Rice",
                    description: "It's white and has cilantro.",
                    food_group:  "veggies",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/white_rice.jpg")
    )

    Filling.create!(title:       "Brown Rice",
                    description: "It's brown.",
                    food_group:  "veggies",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/brown_rice.jpg")
    )

    Filling.create!(title:       "Fresh Tomato Salsa",
                    description: "Diced tomatoes and other bits.",
                    food_group:  "salsas",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/fresh_tomato.jpg")
    )

    Filling.create!(title:       "Roasted Chili-Corn Salsa",
                    description: "Sweet white corn.",
                    food_group:  "salsas",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/roasted_chili_corn.jpg")
    )

    Filling.create!(title:       "Tomatillo-Green Chili Salsa",
                    description: "Fire-roasted tomatillos? Yes please.",
                    food_group:  "salsas",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/tomatillo_green.jpg")
    )

    Filling.create!(title:       "Tomatillo-Red Chili Salsa",
                    description: "It's like the other sauce but with tabasco. Hot hot hot.",
                    food_group:  "salsas",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/tomatillo_red.jpg")
    )

    Filling.create!(title:       "Cheese",
                    description: "Literally, the best ever.",
                    food_group:  "extras",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/cheese.jpg")
    )

    Filling.create!(title:       "Guacamole",
                    description: "It's no longer avocados. It's better now.",
                    food_group:  "extras",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/guacamole.jpg")
    )

    Filling.create!(title:       "Sour Cream",
                    description: "It's sour and cream.",
                    food_group:  "extras",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/sour_cream.jpg")
    )

    Filling.create!(title:       "Queso",
                    description: "It's some melted cheese.",
                    price:       "50",
                    food_group:  "extras",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/queso.jpg")
    )

    Filling.create!(title:       "Queso Diablo",
                    description: "It's some, spicy, melted cheese.",
                    price:       "75",
                    food_group:  "extras",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/queso.jpg")
    )

    Filling.create!(title:       "Lettuce",
                    description: "Just some romaine.",
                    food_group:  "extras",
                    image:       File.new("#{Rails.root}/app/assets/images/menu/fillings/lettuce.jpg")
    )

    puts "Fillings generated!"
  end

  def generate_item_fillings
    Item.all.each do |item|
      10.times do |i|
        filling = Filling.find(Random.new.rand(1..20))
        item.fillings << filling
      end
    end
    puts "Item fillings created!"
  end

  def generate_orders
    states = %W(ordered completed canceled paid)

    User.all.each do |user|
      5.times do |i|
        order = Order.create!(user_id: user.id, state: "#{states.sample}")
        add_line_items(order.id)
      end
    end

    puts "Line item fillings created!"
    puts "Line item's created!"
    puts "Order's created!"
  end

  private

  def add_line_items(order_id)
    5.times do |i|
      item = Item.all.sample
      line_item = LineItem.create!(order_id: order_id, item_id: item.id, quantity: 1)
      add_line_item_fillings(line_item.id)
    end
  end

  def add_line_item_fillings(line_item_id)
    5.times do |i|
      filling = Filling.all.sample
      LineItemFilling.create!(line_item_id: line_item_id, filling_id: filling.id)
    end
  end
end

Seed.new
