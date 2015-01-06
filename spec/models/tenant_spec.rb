require 'rails_helper'

RSpec.describe Tenant do
  let(:tenant)  { FactoryGirl.create(:tenant) }

  it "is valid" do
    expect(tenant).to be_valid
  end

  it "is invalid without a name" do
    tenant.name = nil
    expect(tenant).to_not be_valid

    tenant.name = ""
    expect(tenant).to_not be_valid
  end

  it "can parameterize the slug" do
    tenant.name = "Jorge goes to the bieber concert"
    expect(tenant.slug).to eq("mr-jorge-s-place")
  end

  it 'is invalid if a name is a reserved route' do
    tenant.name = 'cart'
    expect(tenant).to_not be_valid
    tenant.name = 'loan_requests'
    expect(tenant).to_not be_valid
  end
end
