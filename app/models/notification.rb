class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :item , polymorphic: true
  after_commit {NotificationBroadcastJob.perform_later(self)}

  def self.for_user(user_id)

    Notification.where(user_id: user_id).where(viewed:false).count
  end
end
