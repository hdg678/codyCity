class Api::V1::APIController < ApplicationController
  protect_from_forgery with: :null_session
end
