class SendEmailJob < ApplicationJob
    queue_as :default
  
    def perform(user, mail_template,transfer)
      @user = user
      @mail_template = mail_template
      @transfer = transfer
      send_mail()
    end
  
    def send_mail()
      case @mail_template
        when 'initial_validation_success' then 
          NotificationMailer.initial_validation_success_email_transfer(@user,@transfer).deliver_later
        when 'need_to_approve'  then
          NotificationMailer.need_to_approve_email_transfer(@user,@transfer).deliver_later
        when 'approve'  then
          NotificationMailer.approve_email_transfer(@user,@transfer).deliver_later  
        when 'decline'  then
          NotificationMailer.decline_email_transfer(@user,@transfer).deliver_later
        when 'step_approved'  then
        NotificationMailer.step_approved_email_transfer(@user).deliver_later
      end
    end
  end