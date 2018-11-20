class ApplicationController < ActionController::Base
  include Subdomains
  protect_from_forgery with: :exception
end
