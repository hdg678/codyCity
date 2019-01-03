class Api::V1::SessionsController < DeviseTokenAuth::SessionsController
  include Subdomains
  include Api::V1::Exceptions

  respond_to :json
  skip_before_action :verify_authenticity_token
end
