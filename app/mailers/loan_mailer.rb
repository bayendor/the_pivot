class LoanMailer < ActionMailer::Base
  default from: "chase@example.com"

  def lent_money(user, loan_requests, checkout_amounts)
    @user = user
    @loans = loan_requests
    @amounts = checkout_amounts
    mail(to: @user.email, subject: "Your order has been processed.")
  end

  def received_money(user, loan_requests, checkout_amounts)
    @user = user
    @loans = loan_requests
    @amounts = checkout_amounts
    @loans.each do |loan|
      @recipient = loan.user.email
      binding.pry
      mail(to: loan.user.email, subject: "You have received funding.")
      sleep(10)
    end
  end

end

