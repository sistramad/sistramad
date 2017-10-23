module EmailService 
  extend ActiveSupport::Concern

  def send_email(email_data)
    user = email_data[:user]
    
    SendEmailJob.set(wait: 10.seconds).perform_later(user.email, email_data)
  end

  def send_multiple_emails(users, email_data)
    if users.present?
      users.each do |user|
        SendEmailJob.set(wait: 10.seconds).perform_later(user.email, email_data)
      end
    end
  end
  
end