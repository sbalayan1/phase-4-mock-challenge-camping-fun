require 'pry'

class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  private

  def render_not_found(invalid)
    render json: { error: invalid.message }, status: :not_found
  end

  def render_invalid(invalid)
    render json: { errors: ['validation errors'] }, status: :unprocessable_entity
  end
end
