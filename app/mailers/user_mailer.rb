class UserMailer < ActionMailer::Base
  default from: "richmanlikebuttah@gmail.com"

  def welcome_email(user)
    @user = user
    @url = 'http://coffeetalk.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to Coffee Talk')
  end

end
