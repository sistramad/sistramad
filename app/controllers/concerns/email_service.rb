module EmailService 
  extend ActiveSupport::Concern

  def send_email(user, mail_template)
    SendEmailJob.set(wait: 10.seconds).perform_later(user, mail_template)
  end

  def send_emails(users, mail_template)
    users.each do |user|
      SendEmailJob.set(wait: 10.seconds).perform_later(user, mail_template)
    end
  end
  
end