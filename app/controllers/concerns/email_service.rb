module EmailService 
    extend ActiveSupport::Concern
  
    def send_email(user, mail_template, transfer)
      SendEmailJob.set(wait: 10.seconds).perform_later(user, mail_template, transfer)
    end
  
    def send_emails(users, mail_template, transfer)
      users.each do |user|
        SendEmailJob.set(wait: 10.seconds).perform_later(user, mail_template, transfer)
      end
    end
    
  end