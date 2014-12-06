class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  	if resource_class == User
   		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
   			:name, 
   			:email, 
   			:password, 
   			:password_confirmation
   			)}
   	end	
  end

  # Override error message from devise
  def errors_for(model, attribute)
    if model.errors[attribute].present?
      content_tag :span, :class => 'error_explanation' do
        model.errors[attribute].join(", ")
      end
    end
  end

end
