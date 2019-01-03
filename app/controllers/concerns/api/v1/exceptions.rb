module Api::V1::Exceptions
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
    rescue_from ActionController::RoutingError, with: :render_routing_error
  end

  private

  def render_record_not_found(error)
    render json: { success: false, message: 'record not found', error: error.message }, status: 404
  end

  def render_record_invalid(error)
    render json: { success: false, message: 'record invalid', errors: error.record.errors }, status: 422
  end

  def render_routing_error(error)
    render json: { success: false, message: 'routing error', error: error.message }, status: 404
  end
end
