module Subdomains
  extend ActiveSupport::Concern

  included do
    before_action :load_organization
  end

  private

  def load_organization
    @organization ||= Organization.find_by(name: request.subdomain)
  end
end
