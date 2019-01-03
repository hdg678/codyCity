class Api::V1::APIController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Api::V1::Exceptions
end
