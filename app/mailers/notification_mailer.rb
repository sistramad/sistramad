class NotificationMailer < ApplicationMailer
    default from: "sistramad@gmail.com"

    #e-mails de Traslados
    def initial_validation_success_email_transfer(user)
      @user = user
      mail(to: @user.email, subject: 'Notificación de solicitud')
    end

    def need_to_approve_email_transfer(user)
      @user = user
      mail(to: @user.email, subject: 'Notificación de aprobación de solicitud')
    end
  
    def step_approved_email_transfer(user)
      @user = user
      mail(to: @user.email, subject: 'Notificación SISTRAMAD: paso aprobado.')
    end
  
  end
