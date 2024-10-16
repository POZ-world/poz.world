# # frozen_string_literal: true

# # app/controllers/errors_controller.rb
class ErrorsController < ApplicationController
  # skip_before_action :verify_authenticity_token

  # def show
  #   # Capture the error details from the request's env
  #   @exception = request.env['action_dispatch.exception']
  #   Rack::Utils.status_code
  #   @code = ActionDispatch::ExceptionWrapper.status_code_for_exception(@exception.class.name)

  #   # Log the error
  #   logger.error "Error #{@status_code}: #{@exception.message}"
  #   logger.error @exception.backtrace.join("\n") if @exception.backtrace

  #   respond_to do |format|
  #     format.any { render "errors/#{@code}", layout: 'error', status: @code, formats: [:html] }
  #     format.json { render json: { error: Rack::Utils::HTTP_STATUS_CODES[@code] }, status: @code }
  #   end
  # end

  # def _400
  #   bad_request
  # end

  # def _429
  #   too_many_requests
  # end

  # def _406
  #   not_acceptable
  # end

  # def _404
  #   not_found
  # end

  # def _403
  #   forbidden
  # end

  # def _410
  #   gone
  # end

  # def _500
  #   internal_server_error
  # end

  # def _503
  #   service_unavailable
  # end

  # def _422
  #   unprocessable_entity
  # end
end
