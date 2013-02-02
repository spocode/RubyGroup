class UserMailer < ActionMailer::Base
  default from: "volunteers@spocode-inetdavid.rhcloud.com"
  
  def welcome_email(user)
    @user = user
    @url = 'http://spocode-inetdavid.rhcloud.com'
    mail(to: user.email, subject: 'Welcome to Volunteers R U')
  end
end
