class LoanMailer < ActionMailer::Base
  default from: "chase@example.com"

  # def created_email(user_email = "cvh1717@gmail.com")
  #   @user_email = user_email
  #   attachments["rails_logo.png"] = File.read("#{Rails.root}/app/assets/images/rails.png")
  #   mail(to: @user_email, subject:"An article has been created")
  # end

  # def updated_email(user_email = "cvh1717@gmail.com")
  #   @user_email = user_email
  #   attachments["rails_logo.png"] = File.read("#{Rails.root}/app/assets/images/rails.png")
  #   mail(to: @user_email, subject:"An article has been UPDATED!!!!!")
  # end

  # def deleted_email(user_email = "cvh1717@gmail.com")
  #   @user_email = user_email
  #   attachments["rails_logo.png"] = File.read("#{Rails.root}/app/assets/images/rails.png")
  #   mail(to: @user_email, subject:"An article has been DELETED!!!!!!!!!!")
  # end

  def lent_money(user, loan_requests, checkout_amounts)
    @user = user
    @loans = loan_requests
    @amounts = checkout_amounts
    mail(to: @user.email, subject: "Your order has been processed.")
  end

  def received_money

  end
end
