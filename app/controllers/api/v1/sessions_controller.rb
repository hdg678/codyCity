class Api::V1::SessionsController < DeviseTokenAuth::SessionsController
  include Subdomains

  respond_to :json
  skip_before_action :verify_authenticity_token
end
