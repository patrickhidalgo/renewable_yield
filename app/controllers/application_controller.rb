class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    @current_user = if session[:id]
                      User.find(session[:id])
                    else
                      User.new
                    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :back, :alert => exception.message
  end
  # check_authorization
end
