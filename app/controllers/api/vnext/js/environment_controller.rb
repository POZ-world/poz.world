# frozen_string_literal: true

class Api::Vnext::Js::EnvironmentController < ApplicationController
  def js
    render js: script_content, content_type: 'application/javascript'
  end

  def script_content
    <<~JAVASCRIPT
      const env =
              {
                API_BASE_URL: "#{ENV.fetch('API_BASE_URL', nil)}",
                GOOGLE_ANALYTICS_ENABLED: "#{ENV.fetch('GOOGLE_ANALYTICS_ENABLED', nil)}",
                GOOGLE_ANALYTICS_TRACKING_ID: "#{ENV.fetch('GOOGLE_ANALYTICS_TRACKING_ID', nil)}",
                GOOGLE_TAG_MANAGER_ENABLED: "#{ENV.fetch('GOOGLE_TAG_MANAGER_ENABLED', nil)}",
                GOOGLE_TAG_MANAGER_ID: "#{ENV.fetch('GOOGLE_TAG_MANAGER_ID', nil)}",
                MATOMO_ENABLED: "#{ENV.fetch('MATOMO_ENABLED', nil)}",
                MS_CLARITY_ENABLED: "#{ENV.fetch('MS_CLARITY_ENABLED', nil)}",
                MS_CLARITY_ID: "#{ENV.fetch('MS_CLARITY_ID', nil)}",
                GOOGLE_MAPS_API_KEY: "#{ENV.fetch('GOOGLE_MAPS_API_KEY', nil)}"
              }
      window.env = env
    JAVASCRIPT
  end
end
