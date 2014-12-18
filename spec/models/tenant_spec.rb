require 'rails_helper'

RSpec.describe Tenant do
  let(:tenant) do
    Tenant.create(name:        "Mr. Jorge's Place",
                  description: "It's filled with beiber!"
                 )
  end

  it "is valid" do
    expect(tenant).to be_valid
  end

  it "is valid without a name" do
    tenant.name = nil
    expect(tenant).to be_valid

    tenant.name = ""
    expect(tenant).to be_valid
  end

  it "can paramterize" do
    tenant.name = "Jorge goes to the bieber concert"
    expect(tenant.slug).to eq("mr-jorge-s-place")
  end

end
