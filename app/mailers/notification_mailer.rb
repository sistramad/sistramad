class NotificationMailer < ApplicationMailer
  default from: "sistramad@gmail.com"
  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Notificación de Trámite')
  end

end
