# frozen_string_literal: true

module GoogleTagManagerHelper
  extend ActiveSupport::Concern
  include ActionView::Helpers::AssetTagHelper
  include RoutingHelper
  include Webpacker::Helper
  # Method to include Google Tag Manager script tag
  def google_tag_manager_script_tag
    javascript_tag '', src: '/js/google_tag_manager.js' unless google_tag_manager_id.blank? || google_tag_manager_id.nil?
  end

  # Method to include Google Tag Manager noscript tag
  def google_tag_manager_noscript_tag
    # Noscript code for Google Tag Manager
    raw noscript_content.html_safe unless google_tag_manager_id.blank? || google_tag_manager_id.nil? # rubocop:disable Rails/OutputSafety
  end

  def google_tag_manager_id
    ENV.fetch('GOOGLE_TAG_MANAGER_ID', nil)
  end

  def noscript_content
    raw <<~HTML # rubocop:disable Rails/OutputSafety
      <!-- Google Tag Manager (noscript) -->
      <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=#{google_tag_manager_id}"
      height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
      <!-- End Google Tag Manager (noscript) -->
    HTML
  end
end
