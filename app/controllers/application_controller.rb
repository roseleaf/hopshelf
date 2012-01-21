class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :is_me?, :is_admin?
  
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

    def is_admin?
        current_user && current_user.id == 1 
    end

    def is_me?(user)
        current_user && user && user.to_i == current_user.id
    end
end