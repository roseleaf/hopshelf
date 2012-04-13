class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :create_login_user
  helper_method :current_user, :is_me?, :is_admin?
  #after_filter :store_location
  helper_method :show_modal_login

  private

    def create_login_user
      @user_session = UserSession.new
    end

    def show_modal_login
      logger.info session[:show_modal_login]
      # Save the value of the sesison var
      ret = session[:show_modal_login]
      # Set the session var to false, for next time, so modals only show once
      # I moved this from being inside create_login_user, because we only want to set show_modal_login
      # to false, AFTER we get it's value, which could potentially have been set to true during require_user
      session[:show_modal_login] = false
      return ret
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_stored_location
      session[:return_to] = nil
    end

    def redirect_back_or_to(alternate)
      redirect_to(session[:return_to] || alternate)
      clear_stored_location
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end


    def require_user
      unless current_user
        store_location
        flash[:notice]="You must be logged in to view this page"
        # Set the show modal session var to true!
        session[:show_modal_login] = true
        logger.info '--------------------- set modal true'
        redirect_to :root
        return false
      end
    end


    def is_admin?
        current_user && current_user.id == 1 
    end

    def is_me?(user)
        current_user && user && user.to_i == current_user.id
    end

    def slide
    end
end