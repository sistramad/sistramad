class NotificationsController < ApplicationController

  def index

    @notifications = Notification.where(user_id: current_user).where(viewed: false)
    respond_to do |format|
      format.html
      format.js
    end
  end

end