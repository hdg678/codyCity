module Subdomains
  extend ActiveSupport::Concern

  included do
    before_action :load_organization
  end

  private

  def load_organization
    @organization ||= Organization.find_by(name: request.subdomain)
    print(request.subdomain)
    print("\n")
    if @organization.nil?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
