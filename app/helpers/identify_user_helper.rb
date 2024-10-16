# frozen_string_literal: true

module IdentifyUserHelper
  # Method to include Google Analytics script with user identification
  def identify_user_javascript_tag
    return '' if google_analytics_tracking_id.nil?

    javascript_tag '', src: "https://www.googletagmanager.com/gtag/js?id=#{google_analytics_tracking_id}"
    javascript_tag '', src: '/js/identify_user.js', crossorigin: 'anonymous'
  end

  def script_content
    <<~JS
      #{identify_user_javascript}
      #{google_analytics_identify_user_javascript}
      #{microsoft_clarity_identify_user_javascript}
      #{matomo_identify_user_javascript}
    JS
  end

  private

  def identify_user_javascript_url
    URI.join(base_url)
  end

  def identify_user_javascript
    return 'console.log("No currently logged-in user");' if user_info.empty?

    <<~JS
      /* Identify User */
      window.currentlyLoggedInUserId = "#{user_id}";
      window.currentlyLoggedInUserSessionId = "#{session_id}";
      /* End Identify User */
    JS
  end

  def matomo_site_id
    ENV.fetch('MATOMO_SITE_ID', nil)
  end

  def matomo_enabled
    ENV.fetch('MATOMO_ENABLED', 'false') == 'true' #  && matomo_site_id.present?
  end

  def session_id
    current_session.session_id
  end

  def matomo_identify_user_javascript
    return 'console.log("Matomo is not enabled");' unless matomo_enabled
    return 'console.log("No currently logged-in user");' if user_info.empty?

    <<~JS
      /* Matomo identify user */
      let _paq1 = window._paq = window._paq || [];
      _paq1.push('setUserId', window.currentlyLoggedInUserId)
      /* End Matomo identify user */
    JS
  end

  def user_id
    return nil if user_info.empty?

    user_info[:id]
  end

  def user_info
    current_user ? { id: current_account.id, name: "#{current_account.username}@#{current_account.domain}" } : {}
  end

  def google_analytics_tracking_id
    ENV.fetch('GOOGLE_ANALYTICS_TRACKING_ID', nil)
  end

  def google_analytics_enabled
    ENV.fetch('GOOGLE_ANALYTICS_ENABLED', 'false') == 'true' # && google_analytics_tracking_id.present?
  end

  def ms_clarity_id
    ENV.fetch('MS_CLARITY_ID', nil)
  end

  def ms_clarity_enabled
    ENV.fetch('MS_CLARITY_ENABLED', 'false') == 'true' # && ms_clarity_id.present?
  end

  def microsoft_clarity_identify_user_javascript
    return 'console.log("Microsoft Clarity Identify user is not enabled.");' unless ms_clarity_enabled
    return 'console.log("There\s nobody signed in right now.");' if user_info.empty?

    <<~JS
      /* Microsoft Clarity identify user */
      if(window.clarity) {
        window.clarity("identify", window.currentlyLoggedInUserId, window.currentlyLoggedInUserSessionId);
      }
      else {
        console.error("Microsoft Clarity is 'enabled' but the 'window.clarity' object was not found.");
      }
      /* End Microsoft Clarity identify user */
    JS
  end

  # Method to embed user information into the gtag script
  def google_analytics_identify_user_javascript
    return 'console.log("Google Analytics Identify user is not enabled.");' unless google_analytics_enabled
    return 'console.log("There\s nobody signed in right now.");' if user_info.empty?

    <<~JS
      /* Google Analytics identify user */
      if(dataLayer) {
        dataLayer.push({
          'user_id': window.currentlyLoggedInUserId
        });
      }
      else {
        console.error('Google Analytics Identify user is enabled but the gtag was not found on the page.');
      }
      /* End Google Analytics identify user */
    JS
  end
end
