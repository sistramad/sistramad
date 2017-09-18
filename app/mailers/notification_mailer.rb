class NotificationMailer < ApplicationMailer
    default from: "sistramad@gmail.com"
    
    def initial_validation_success_email(user)
      @user = user
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

    #e-mails de Traslados
    def initial_validation_success_email_translate(user)
      @user = user
      mail(to: @user.email, subject: 'Notificación de solicitud')
    end
  
  end
