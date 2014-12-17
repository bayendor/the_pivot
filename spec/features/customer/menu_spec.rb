# require "rails_helper"
#
# describe 'unregistered user', type: :feature do
#
#   let(:item) {Item.create!(name: "Burrito", price: 500)}
#   let(:filling) {Filling.create!(title:       "Steak",
#                      description: "It's meat. From an animal.",
#                      price:       100,
#                      food_group:  "meats",
#                  )}
#
#   before(:each) do
#       item.filling_ids = [filling.id]
#   end
#
#   it "can browse the menu" do
#     visit '/'
#     click_link_or_button("Browse Full Menu")
#     expect(page).to have_text("Which will you choose?")
#
#     click_link_or_button("Show")
#     expect(page).to have_text("Steak")
#   end
#
#   it 'can build an item' do
#     visit '/'
#     click_link_or_button("Build a Burrito")
#     expect(page).to have_text("Burrito Builder")
#
#     check("Steak")
#     click_link_or_button("Add to Cart")
#     expect(current_path).to eq("/cart")
#     expect(page).to have_text("Please log in above")
#   end
#
# end
#
# describe 'registered user', type: :feature do
#
#     let(:item) {Item.create!(name: "Burrito", price: 500)}
#     let(:filling) {Filling.create!(title:       "Steak",
#                        description: "It's meat. From an animal.",
#                        price:       100,
#                        food_group:  "meats",
#                    )}
#
#      before(:each) do
#       visit '/'
#       fill_in "username", with: "j3"
#       fill_in "password", with: "password"
#       find('input[type="submit"]').click
#       item.filling_ids = [filling.id]
#     end
#
#   it "can browse the menu" do
#     visit '/'
#     click_link_or_button("Browse Full Menu")
#     expect(page).to have_text("Which will you choose?")
#
#     click_link_or_button("Show")
#     expect(page).to have_text("Steak")
#   end
#
#   it 'can build an item' do
#     visit '/'
#     click_link_or_button("Build a Burrito")
#     expect(page).to have_text("Burrito Builder")
#
#     check("Steak")
#     click_link_or_button("Add to Cart")
#     expect(current_path).to eq("/cart")
#     expect(page).to have_text("Your Cart")
#   end
#
# end
