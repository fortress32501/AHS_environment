# frozen_string_literal: true

class UserMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  
  def forgot_password(user)
    @user = user
    @greeting = "Hi"
    
    mail to: user.email, :subject => 'Reset password instructions'
  end
end
