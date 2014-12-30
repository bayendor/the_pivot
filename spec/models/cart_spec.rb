require 'rails_helper'

RSpec.describe Cart do

  let(:cart) do
    session = {}
    cart = Cart.new(session)
  end

  it "can create a new cart" do
    expect(cart.session).to eq("cart" => {"loans"=>{}})
  end

  it "can add a loan" do
    loan_id = 1
    amount = 500
    cart.add_loan(loan_id, amount)

    expect(cart.session).to eq("cart" => {"loans"=>{1=>500}})
  end

  it "can add multiple loans" do
    loan_1 = 1
    amount_1 = 500

    loan_2 = 2
    amount_2 = 1000

    cart.add_loan(loan_1, amount_1)
    expect(cart.session).to eq("cart" => {"loans"=>{1=>500}})

    cart.add_loan(loan_2, amount_2)
    expect(cart.session).to eq("cart" => {"loans"=>{1=>500, 2=>1000}})
  end

end
