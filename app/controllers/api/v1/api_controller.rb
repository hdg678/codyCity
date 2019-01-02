class Api::V1::APIController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid

  def render_record_not_found(error)
    render json: { success: false, message: 'record not found', error: error.message }, status: 404
  end

  def render_record_invalid(error)
    render json: { success: false, message: 'record invalid', errors: error.record.errors }, status: 422
  end
end
