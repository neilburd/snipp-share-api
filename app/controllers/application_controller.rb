class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

       def configure_permitted_parameters
         # Permit the `subscribe_newsletter` parameter along with the other
         # sign up parameters.
         devise_parameter_sanitizer.permit(:sign_up, keys: [:password, :password_confirmation])
       end
end
