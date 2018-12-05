class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController
  include Subdomains

  respond_to :json
  before_action :require_token, only: [:new, :create]
  skip_before_action :verify_authenticity_token

private

  def require_token
    type = resource_class.to_s.parameterize
    token = params[:token]
    if token.nil?
      raise ActionController::RoutingError.new('Missing token')
    end

    @ost = OrganizationUserToken.find_by(token: token, token_type: type)
    if !@ost
      raise ActionController::RoutingError.new('Invalid token')
    end

    build_resource
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :organization_id)
  end

end
