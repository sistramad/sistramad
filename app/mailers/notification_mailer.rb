class NotificationMailer < ApplicationMailer
  default from: "sistramad@gmail.com"
  
  def initial_validation_success_email(user, procedure_name)
    @user = user
    @procedure_name = procedure_name
    mail(to: @user.email, subject: 'Notificación de solicitud')
  end

  def need_to_approve_email(user)
    @user = user
    mail(to: @user.email, subject: 'Notificación de aprobación de solicitud')
  end

  def step_approved_email(user)
    @user = user
    mail(to: @user.email, subject: 'Notificación SISTRAMAD: paso aprobado.')
  end

  def step_deny_email(user, procedure)
    @user = user
    @procedure = procedure
    byebug
    mail(to: @user.email, subject: 'Notificación de solicitud')
  end

end
