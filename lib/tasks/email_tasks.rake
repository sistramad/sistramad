desc 'send digest email'
task send_digest_email: :environment do
  # ... set options if any
  NotifierMailer.send_notification_email.deliver!
end