class ApplicationController < ActionController::Base
  include Subdomains
  #protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
end
