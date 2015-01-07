require 'rails_helper'

RSpec.describe Cart do

  let(:loan_1)   { 1 }
  let(:loan_2)   { 2 }
  let(:amounts) { [50, 500] }

  let(:cart) do
    session = {}
    cart = Cart.new(session)
  end

  it "can create a new cart" do
    expect(cart.session).to eq("cart" => {"loans"=>{}})
  end

  it "can add a loan" do
    cart.add_loan(loan_1)

    expect(cart.session).to eq("cart" => {"loans"=>{1=>"0"}})
  end

  it "can add multiple loans" do
    cart.add_loan(loan_1)
    expect(cart.session).to eq("cart" => {"loans"=>{1=>"0"}})

    cart.add_loan(loan_2)
    expect(cart.session).to eq("cart" => {"loans"=>{1=>"0", 2=>"0"}})
  end

  it "can add amounts to multiple loans" do
    cart.add_loan(loan_1)
    cart.add_loan(loan_2)
    expect(cart.session).to eq("cart" => {"loans"=>{1=>"0", 2=>"0"}})

    cart.add_amounts_to_loans(amounts)
    expect(cart.session).to eq("cart" => {"loans"=>{1=>50, 2=>500}})
  end

  context "#remove_loan" do
    it "deletes the provided id from the cart" do
      cart.add_loan(loan_1)
      cart.add_loan(loan_2)

      expect(cart.session).to eq("cart" => {"loans"=>{1=>"0", 2 => "0"}})
      cart.remove_loan(loan_1)
      expect(cart.session).to eq("cart" => {"loans"=>{2 => "0"}})
    end
  end
end
