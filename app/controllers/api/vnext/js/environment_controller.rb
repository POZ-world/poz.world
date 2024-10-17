# frozen_string_literal: true

class Api::Vnext::Js::EnvironmentController < ApplicationController
  def serve
    respond_to do |format|
      format.js { render js: script_content, content_type: 'application/javascript' }
      format.json { render json: json_content, content_type: 'application/environment+json' }
    end
  end

  private

  def json_content
    {
      API_BASE_URL: ENV.fetch('API_BASE_URL', nil).to_s,
      GOOGLE_ANALYTICS_ENABLED: ENV.fetch('GOOGLE_ANALYTICS_ENABLED', nil).to_s,
      GOOGLE_ANALYTICS_TRACKING_ID: ENV.fetch('GOOGLE_ANALYTICS_TRACKING_ID', nil).to_s,
      GOOGLE_TAG_MANAGER_ENABLED: ENV.fetch('GOOGLE_TAG_MANAGER_ENABLED', nil).to_s,
      GOOGLE_TAG_MANAGER_ID: ENV.fetch('GOOGLE_TAG_MANAGER_ID', nil).to_s,
      MATOMO_ENABLED: ENV.fetch('MATOMO_ENABLED', nil).to_s,
      MS_CLARITY_ENABLED: ENV.fetch('MS_CLARITY_ENABLED', nil).to_s,
      MS_CLARITY_ID: ENV.fetch('MS_CLARITY_ID', nil).to_s,
      GOOGLE_MAPS_API_KEY: ENV.fetch('GOOGLE_MAPS_API_KEY', nil).to_s,
    }
  end

  def script_content
    <<~JAVASCRIPT
      const env = #{json_content.to_json};
      window.env = env
    JAVASCRIPT
  end
end
