class NotificationMailer < ApplicationMailer
  default from: "sistramad@gmail.com"
  
  def initial_validation_success_email(user, procedure_name)
    @user = user
    @procedure_name = procedure_name
    mail(to: @user.email, subject: 'Notificación de solicitud')
  end

  def need_to_approve_email(email_to, owner, procedure_name)
    @owner = owner
    @procedure_name = procedure_name
    mail(to: email_to, subject: 'Notificación de aprobación de solicitud')
  end

  def step_approved_email(user, procedure_name)
    @user = user
    @procedure_name = procedure_name
    mail(to: @user.email, subject: 'Notificación SISTRAMAD: paso aprobado.')
  end

  def step_deny_email(owner, responsable)
    @owner = owner
    @owner_fullname = "#{owner.first_name} #{owner.last_name}"
    @responsable_fullname = responsable
    mail(to: @owner.email, subject: 'Notificación de solicitud')
  end

  def procedure_approved_email(owner, responsable, procedure_name)
    @owner = owner
    @owner_fullname = "#{owner.first_name} #{owner.last_name}"
    @responsable_fullname = "#{responsable.first_name} #{responsable.last_name}"
    @procedure_name = procedure_name
    mail(to: @owner.email, subject: 'Notificación de solicitud: Aprobada!')
  end

  def check_comments_and_approve(email_to , owner, procedure_name, info )
    @owner = owner
    @procedure_name = procedure_name
    @info = info
    mail(to: email_to, subject: 'Notificación de aprobacion de solicitud')
  end

end
