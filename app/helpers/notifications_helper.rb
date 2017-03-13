module NotificationsHelper
  def render_notifications(notifications)
    notifications.map do |notification|
     render partial:"notifications/#{notification.item_type.downcase}", locals: {noti: notification}
    end.join(' ').html_safe
  end
end