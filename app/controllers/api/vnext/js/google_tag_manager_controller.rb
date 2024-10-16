# frozen_string_literal: true

class Api::Vnext::Js::GoogleTagManagerController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: :serve
  # Method to serve the GTM JavaScript
  def serve
    if google_tag_manager_id.blank? || google_tag_manager_id.nil?
      render js: "console.warn('GOOGLE_TAG_MANAGER_ID is required but was not found.');"
      return
    end

    render js: script_content, content_type: 'application/javascript'
  end

  def script_content
    <<~JS
      (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
      new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
      j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
      'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
      })(window,document,'script','dataLayer','#{google_tag_manager_id}');
    JS
  end

  private

  def google_tag_manager_id
    ENV.fetch('GOOGLE_TAG_MANAGER_ID', nil)
  end

  def google_tag_manager_enabled
    ENV.fetch('GOOGLE_TAG_MANAGER_ENABLED', 'false') == 'true' && !google_tag_manager_id.nil?
  end
end
