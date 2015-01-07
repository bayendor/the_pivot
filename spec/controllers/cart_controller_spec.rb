require 'rails_helper'

describe CartController do
  before(:each) do
    request.env["HTTP_REFERER"] = cart_index_path
  end

  describe "DELETE #remove_loan_request" do
    it "removes that loan request from the user's cart" do
      c = Cart.new(session)
      c.add_loan("50")
      expect(session["cart"]["loans"]["50"]).not_to be_nil
      c.add_loan("40")
      expect(session["cart"]["loans"]["40"]).not_to be_nil


      delete :remove_loan_request, :id => 50

      data = JSON.parse(response.body)
      expect(data["success"]).to eq(true)
      expect(session["cart"]["loans"]["50"]).to be_nil
      expect(session["cart"]["loans"]["40"]).not_to be_nil
    end
  end
end