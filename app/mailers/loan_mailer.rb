class LoanMailer < ActionMailer::Base
  default from: "chase@example.com"

  def lent_money(user, loan_request_ids, checkout_amounts)
    @user = user
    @loans = loan_request_ids.map do |loan_request_id|
      get_loan_request_object_from_id(loan_request_id)
    end
    @amounts = checkout_amounts
    mail(to: @user.email, subject: "Your order has been processed.")
  end

  def received_money(user, loan_request_id, checkout_amount)
    @user = user
    @loan = get_loan_request_object_from_id(loan_request_id)
    @amount = checkout_amount
      mail(to: @loan.user.email, subject: "You have received funding.")
  end

  def get_loan_request_object_from_id(loan_request_id)
    loan_request = LoanRequest.find_by(id: loan_request_id)
  end
end

