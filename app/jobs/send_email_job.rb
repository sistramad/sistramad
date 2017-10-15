class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(user, mail_template)
    @user = user
    @mail_template = mail_template
    send_mail()
  end

  def send_mail()
    case @mail_template
      when 'initial_validation_success' then 
        NotificationMailer.initial_validation_success_email(@user).deliver_later
      when 'need_to_approve'  then
        NotificationMailer.need_to_approve_email(@user).deliver_later
      when 'step_approved'  then
      NotificationMailer.step_approved_email(@user).deliver_later
    end
  end
end
