class UserNotifier < ActionMailer::Base
  default from: 'Patrick Hidalgo <m.patrick.hidalgo@gmail.com>'

  def signed_up(user)
    @user = user
    mail to: @user.email
  end

  def verified(user)
    @user = user
    mail to: @user.email
  end

  def verify(user)
    @user = user
    mail to: @user.email
  end
end
