class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    @user = user
    NotificationMailer.sample_email(@user).deliver_later
  end
end
