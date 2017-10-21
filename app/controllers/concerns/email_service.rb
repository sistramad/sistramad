module EmailService 
  extend ActiveSupport::Concern

  def send_email(email_data)
    SendEmailJob.set(wait: 10.seconds).perform_later(email_data)
  end

  def send_emails(users, mail_template)
    users.each do |user|
      SendEmailJob.set(wait: 10.seconds).perform_later(user, mail_template)
    end
  end
  
end