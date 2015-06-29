module SessionsHelper

  #Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  #Returns the current logged in user (if any)
  def current_user
    #Assigns current user if it's not already been assigned
    #(only makes 1 call to db)
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
