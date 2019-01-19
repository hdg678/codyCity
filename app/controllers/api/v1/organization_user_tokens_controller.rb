class Api::OrganizationUserTokensController < Api::V1::APIController
  # Authenicate!

  def generate
    token = OrganizationUserToken.generate(params[:organization_id], params[:email], params[:user_type])
    render json: { token: token }
  end
end
