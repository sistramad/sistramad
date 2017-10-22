class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  rescue_from CanCan::AccessDenied do |exception|
    # redirect_to root_path, :alert => exception.message
    flash[:alert] = "Access denied."
    redirect_to authenticated_root_path
  end

  protected
  def configure_permitted_parameters
    # http://www.rubydoc.info/github/plataformatec/devise/Devise/ParameterSanitizer

    # Using the block form to completely override how we permit the
    # parameters for the `sign_in` action.
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end

    # Adding new parameters to be permitted in the `accept_invitation` action.
    # devise_parameter_sanitizer.for(:accept_invitation).concat [:username]
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:username])

    # Removing the `password` parameter from the `account_update` action.
    # devise_parameter_sanitizer.permit(:account_update, except: [:password])
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end
  
end
