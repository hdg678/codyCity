class RegistrationsController < Devise::RegistrationsController
  include Subdomains

  before_action :require_token, only: [:new, :create]

  def new
    build_resource if resource.nil?
    respond_with resource
  end

  def create
    build_resource(sign_up_params.merge({ email: @ost.email }))
    resource.organization_id = @ost.organization_id
    resource.save
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

private

  def require_token
    type = build_resource.class.to_s.parameterize
    token = params[:token]
    if token.nil?
      raise ActionController::RoutingError.new('Missing token')
    end

    @ost = OrganizationUserToken.find_by(token: token, token_type: type)
    if !@ost
      raise ActionController::RoutingError.new('Invalid token')
    end

    build_resource(email: @ost.email)
  end


end