module SessionsHelper
  def current_user?
    !session[:name].nil?
  end

  def current_user
    @current_user ||= User.find(user_id) if (User.id = session[:id])
  end
end
