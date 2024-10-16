# frozen_string_literal: true

module ErrorTranslatorHelper
  ERROR_CODE_MAP = {
    'ActiveRecord::RecordNotFound' => 404,
    'ActionController::RoutingError' => 404,
    'ActionController::UnknownFormat' => 406,
    'ActionController::InvalidAuthenticityToken' => 403,
    'ActiveRecord::RecordInvalid' => 422,
    'Mastodon::RateLimitExceededError' => 429,
    'Pundit::NotAuthorizedError' => 403,
    'ActionController::ParameterMissing' => 400,
    'HTTP::Error' => 500,
    'OpenSSL::SSL::SSLError' => 495,
    'Mastodon::RaceConditionError' => 409,
    'Mastodon::NotPermittedError' => 403,
    'Stoplight::Error::RedLight' => 503,
    'ActiveRecord::SerializationFailure' => 409,
    'Seahorse::Client::NetworkingError' => 502,
    'StandardError' => 500,
    'Exception' => 500,
    # Add more mappings as necessary
  }.freeze

  def to_error_code(*args)
    to_error_code(args[0].class.to_s) if args.length == 1 && args[0].is_a?(Exception)
    ERROR_CODE_MAP[args[0].to_s] if args.length == 1 && args[0].is_a?(String) && ERROR_CODE_MAP.key?(args[0].to_s)
    500 unless args.length == 1 && (args[0].is_a?(Exception) || args[0].is_a?(String))
  end
end
