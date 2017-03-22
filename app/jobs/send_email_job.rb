class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user, mail_format)
    @user = user
    @mail_format = mail_format
    send_mail()
  end

  def send_mail()
    case @mail_format
      when 'initial_validation_success' then 
        NotificationMailer.initial_validation_success_email(@user).deliver_later
      when 'need_to_approve'  then
        NotificationMailer.need_to_approve_email(@user).deliver_later
    end
  end
end
