class LoanMailer < ActionMailer::Base
  default from: "chase@example.com"

  def lent_money(user, loan_requests, checkout_amounts)
    @user = user
    @loans = loan_requests
    @amounts = checkout_amounts
    mail(to: @user.email, subject: "Your order has been processed.")
  end

  def received_money

  end

  def send_email(user = "cvh1717@gmail.com")
    @user = user
    mail(to: @user, subject: "Your order has been processed.")
  end
end

