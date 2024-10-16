# frozen_string_literal: true

class EnvironmentController < ApplicationController
  def show
    environment_variables = {
      api_base_url: ENV.fetch('API_BASE_URL', nil),
      google_analytics_enabled: ENV.fetch('GOOGLE_ANALYTICS_ENABLED', nil),
      matomo_enabled: ENV.fetch('MATOMO_ENABLED', nil),
      google_tag_manager_enabled: ENV.fetch('GOOGLE_TAG_MANAGER_ENABLED', nil),
      ms_clarity_enabled: ENV.fetch('MS_CLARITY_ENABLED', nil),
      currently_logged_in_user_id: current_account ? current_account.id : 'null',
      currently_logged_in_user_name: current_account ? current_user_name : 'null',
      current_session_id: current_session ? current_session.session_id : 'null',
    }

    render json: environment_variables
  end

  private

  def current_user_name
    if current_account&.domain.present?
      "#{current_account.username}@#{current_account.domain}"
    elsif current_account
      current_account.username
    else
      'null'
    end
  end

  def current_user_domain
    config.x.local_domain if current_accout.local?
    current_account.domain
  end
end
