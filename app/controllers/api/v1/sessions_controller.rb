class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json
  skip_before_action :verify_authenticity_token

  def new
    render json: {message: "Authentication failed"}, status: 401
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  private

  def respond_with(resource, _opts={})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end
