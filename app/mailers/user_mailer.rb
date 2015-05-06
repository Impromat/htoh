class UserMailer < ApplicationMailer

  default from: 'lhoste.mathieu@gmail.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    mail to: @user.email, subject: "Bienvenu sur QstomR"
  end

  def task_create(user)
    @user = user
    mail to: @user.email, subject: "votre tâche a été crée"
  end

  def booking_create(user)
    @user = user
    mail to: @user.email, subject: "Votre proposition a été envoyée"
  end

  def proposition_made(user)
    @user = user
    mail to: @user.email, subject: "Vous avez reçu une offre"
  end

  def proposition_accepted(user)
    @user = user
    mail to: @user.email, subject: "Votre offre a été accéptée"
  end

end
