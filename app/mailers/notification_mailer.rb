class NotificationMailer < ApplicationMailer
  default from: "sistramad@gmail.com"
  
  def initial_validation_success_email(user)
    @user = user
    mail(to: @user.email, subject: 'Notificación de Trámite')
  end

  def need_to_approve_email(user)
    @user = user
    mail(to: @user.email, subject: 'Notificación de solicitud de aprobación de Tŕamite')
  end

end
