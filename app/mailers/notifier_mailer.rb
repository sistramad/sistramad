class NotifierMailer  < ActionMailer::Base
  default :from => 'any_from_address@example.com'
  # send a signup email to the user, pass in the user object that   contains the user's email address

  def send_notification_email

    dates = JointPlan.all.pluck(:end_plan,:user_id)
    dates.each do |d|
      if (d.at(0) - Date.today ).to_i < 7
        @user = User.find(d.at(1))

        mail( :to => @user.email,
              :subject => 'Thanks for signing up for our amazing app')
      end


    end

  end
end