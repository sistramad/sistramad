module Notificable
  extend ActiveSupport::Concern

  included do
    has_many :notifications , as: :item
    after_create :send_notification_to_user
  end

  def send_notification_to_user

    noti = NotificationSenderJob.perform_now
    if self.respond_to? :user_ids
      noti.perform_now
    end

  end
end