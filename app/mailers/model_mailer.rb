class ModelMailer < ActionMailer::Base
  default from: "no-reply@email.altijdheerlijk.nl"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
 

  def new_like_notification(pin, follower, current_user)
    @pin = pin
    @follower = follower
    @current_user = current_user
    mail to: @follower.email, subject: "Chef #{@current_user.name} heeft recept #{@pin.description} geliked.", bcc: "oliviervanhees@gmail.com"
  end

  def new_follower_notification(user, current_user)
    @user = user
    @current_user = current_user
    mail to: user.email, subject: "#{@user.name}, je bent nu toegevoegd door #{current_user.name}.", bcc: "oliviervanhees@gmail.com"
  end

  def new_user_account_notification(user)
    @user = user
    mail to: @user.email, subject: "Welkom bij Altijd Heerlijk.", bcc: "oliviervanhees@gmail.com"
  end

end

