class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :show_errors

  private

  def show_errors(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: 422
  end
end
