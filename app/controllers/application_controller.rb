# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
   # include all helpers, all the time
   # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  protect_from_forgery 
  before_filter :verify_logged_in
  around_filter :catch_not_found
  #filter_parameter_logging :password, :password_confirmation # there are underscores :-|

  helper_method :current_user_session, :current_user

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      logger.debug "ApplicationController::require_user"
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      logger.debug "ApplicationController::require_no_user"
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
       # redirect_to home_index_path
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def verify_logged_in
      if not current_user.present?
        flash[:notice]= "You must be logged in to perform this action"
        redirect_back_or_default root_path
      end
    end

    def catch_not_found
        yield
          rescue ActiveRecord::RecordNotFound
          redirect_to root_url, :flash => { :error => "Record not found." }
    end
end
