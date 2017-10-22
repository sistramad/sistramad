class NotificationMailer < ApplicationMailer
    default from: "sistramad@gmail.com"

    #e-mails de Traslados
    def initial_validation_success_email_transfer(user,transfer)
      @user = user
      @transfer = transfer
      mail(to: @user.email, subject: 'Notificación de solicitud')
    end

    def need_to_approve_email_transfer(user,transfer)
      @user = user
      @transfer = transfer
      mail(to: @user.email, subject: 'Notificación de aprobación de solicitud')
    end

    def approve_email_transfer(user,transfer)
      @user = user
      @transfer = transfer
      mail(to: @user.email, subject: 'Notificación de aprobación completa de solicitud')
    end

    def decline_email_transfer(user,transfer)
      @user = user
      @transfer = transfer
      mail(to: @user.email, subject: 'Notificación de declinación de solicitud')
    end
  
    def step_approved_email_transfer(user)
      @user = user
      mail(to: @user.email, subject: 'Notificación SISTRAMAD: paso aprobado.')
    end
  
  end
