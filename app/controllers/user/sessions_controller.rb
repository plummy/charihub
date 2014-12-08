class User::SessionsController < Devise::SessionsController
  before_filter :configure_sign_in_params, only: [:create]

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => '#{controller_path}#failure')
    sign_in_and_redirect(resource_name, resource)
  end
  
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    return render :json => {:success => true}
  end

  def failure
    return render :json => {:success => false, :errors => ["Login failed."]}
  end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
  end
end
