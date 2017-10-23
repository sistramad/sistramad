module Notificable
  extend ActiveSupport::Concern

  included do
    has_many :notifications , as: :item
    after_commit :send_notification_to_user
  end

  def send_notification_to_user


    if self.respond_to? :user_ids
      NotificationSenderJob.perform_later(self)
    end

  end
end