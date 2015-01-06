require "rails_helper"

RSpec.describe LoanMailer, :type => :mailer do
  it "sends an email to the user giving money" do
    checkout_loans = []

    current_tenant = Tenant.create!( name: 'My Store',
                                     description: 'Good Stuff',
                                     blurb: 'blurb'
                                    )
    current_user = User.create!(  first_name: 'Bruce',
                                  last_name:  'Wayne',
                                  email:      'bruce_wayne@waynewnterprises.com',
                                  username:   'batman',
                                  password:   'password',
                                  tenant_id: current_tenant.id
                                 )

    loan_request1 = LoanRequest.create!(user_id:             current_user.id,
                                        title:               "Hello",
                                        blurb:               'This is a blurb.',
                                        description:         "nice",
                                        borrowing_amount:    100,
                                        amount_funded:       0,
                                        requested_by_date:   DateTime.now,
                                        payments_begin_date: DateTime.now.months_since(1),
                                        payments_end_date:   DateTime.now.months_since(7),
                                        status:              'open'
                           )
    loan_request2 = LoanRequest.create!(user_id:             current_user.id,
                                        title:               "Goodbye",
                                        blurb:               'This is a blurb.',
                                        description:         "bad",
                                        borrowing_amount:    1000,
                                        amount_funded:       0,
                                        requested_by_date:   DateTime.now,
                                        payments_begin_date: DateTime.now.months_since(1),
                                        payments_end_date:   DateTime.now.months_since(7),
                                        status:              'open'
                           )

    checkout_amounts = ["25", "25"]
    checkout_loans << loan_request1
    checkout_loans << loan_request2

    LoanMailer.lent_money(current_user, checkout_loans, checkout_amounts).deliver
    result = ActionMailer::Base.deliveries.last

    expect(result).not_to be_nil
    expect(result.to).to include("bruce_wayne@waynewnterprises.com")
    expect(result.from).to include("chase@example.com")
    expect(result.subject).to eq("Your order has been processed.")
  end

  it "sends an email to the tenant receiving money" do
    checkout_loans = []

    current_tenant = Tenant.create!( name: 'My Store',
                                     description: 'Good Stuff',
                                     blurb: 'blurb'
                                    )
    current_user = User.create!(  first_name: 'Bruce',
                                  last_name:  'Wayne',
                                  email:      'bruce_wayne@waynewnterprises.com',
                                  username:   'batman',
                                  password:   'password',
                                  tenant_id: current_tenant.id
                                 )

    current_user2= User.create!(  first_name: 'Tim',
                                  last_name:  'Billy',
                                  email:      'tim@gmail.com',
                                  username:   'superman',
                                  password:   'password',
                                 )

    loan_request1 = LoanRequest.create!(user_id:             current_user.id,
                                        title:               "Hello",
                                        blurb:               'This is a blurb.',
                                        description:         "nice",
                                        borrowing_amount:    100,
                                        amount_funded:       0,
                                        requested_by_date:   DateTime.now,
                                        payments_begin_date: DateTime.now.months_since(1),
                                        payments_end_date:   DateTime.now.months_since(7),
                                        status:              'open'
                           )
    loan_request2 = LoanRequest.create!(user_id:             current_user.id,
                                        title:               "Goodbye",
                                        blurb:               'This is a blurb.',
                                        description:         "bad",
                                        borrowing_amount:    1000,
                                        amount_funded:       0,
                                        requested_by_date:   DateTime.now,
                                        payments_begin_date: DateTime.now.months_since(1),
                                        payments_end_date:   DateTime.now.months_since(7),
                                        status:              'open'
                           )

    checkout_amounts = ["25", "25"]
    checkout_loans << loan_request1
    checkout_loans << loan_request2

    LoanMailer.received_money(current_user2, checkout_loans, checkout_amounts).deliver
    result = ActionMailer::Base.deliveries.last

    expect(result).not_to be_nil
    expect(result.to).to include("bruce_wayne@waynewnterprises.com")
    expect(result.from).to include("chase@example.com")
    expect(result.subject).to eq("You have received funding.")
  end
end
