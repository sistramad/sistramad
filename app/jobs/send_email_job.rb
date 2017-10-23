class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(email_to, email_data)
    @email_to = email_to
    @user = email_data[:user]
    @procedure_name = email_data[:procedure_name]
    @owner = email_data[:owner]
    @responsable = email_data[:responsable]
    @info = email_data[:info]
    mail_template = email_data[:template]
    
    send_mail(mail_template)
    
  end

  def send_mail(mail_template)
    case mail_template
      when 'initial_validation_success' then 
        NotificationMailer.initial_validation_success_email(@user, @procedure_name).deliver_later
      when 'need_to_approve'  then
        NotificationMailer.need_to_approve_email(@email_to, @owner, @procedure_name).deliver_later
      when 'step_approved'  then
        NotificationMailer.step_approved_email(@user, @procedure_name).deliver_later
      when 'step_deny'  then
        NotificationMailer.step_deny_email(@owner, @responsable).deliver_later
      when 'procedure_approved'  then
        NotificationMailer.procedure_approved_email(@owner, @responsable, @procedure_name).deliver_later
      when 'check_comments_and_approve' then
        NotificationMailer.check_comments_and_approve(@email_to, @owner, @procedure_name, @info ).deliver_later
    end
  end
end
