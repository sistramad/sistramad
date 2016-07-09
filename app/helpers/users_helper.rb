module UsersHelper
  def employee? user
    user.employee ? true : false
  end
end