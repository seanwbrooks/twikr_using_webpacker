class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Unauthorized user with the below line (https://github.com/plataformatec/devise#configuring-controllers)
  before_action :authenticate_user!

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :username, :profile_photo])
   devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :email, :profile_photo])
 end
end
