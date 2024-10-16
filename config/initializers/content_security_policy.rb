# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

require_relative '../../app/lib/content_security_policy'

policy = ContentSecurityPolicy.new
assets_host = policy.assets_host
media_hosts = policy.media_hosts

def sso_host
  return unless ENV['ONE_CLICK_SSO_LOGIN'] == 'true'
  return unless ENV['OMNIAUTH_ONLY'] == 'true'
  return unless Devise.omniauth_providers.length == 1

  provider = Devise.omniauth_configs[Devise.omniauth_providers[0]]
  @sso_host ||= begin
    case provider.provider
    when :cas
      provider.cas_url
    when :saml
      provider.options[:idp_sso_target_url]
    when :openid_connect
      provider.options.dig(:client_options, :authorization_endpoint) || OpenIDConnect::Discovery::Provider::Config.discover!(provider.options[:issuer]).authorization_endpoint
    end
  end
end

# ENV.each do |key, value|
#   if key.start_with?('CSP_')
#     # Emit a debug message with the key and its value
#     Rails.logger.debug { "#{key}: #{value} (#{value.split})" }
#   end
# end

def get_csp_source(key, default = "'unsafe-inline' http: https: *")
  ENV.fetch(key, default).split.compact
end

def csp_script_src
  # Rails.logger.debug { "ENV['CSP_SCRIPT_SRC'] raw value: #{ENV.fetch('CSP_SCRIPT_SRC', "'unsafe-inline' http https *")}" }
  ENV.fetch('CSP_SCRIPT_SRC', "'unsafe-inline' http https *").split.compact
  # Rails.logger.debug { "Calculated csp_script_src: #{logger_output.inspect}" }
end

def csp_content_src
  get_csp_source('CSP_CONTENT_SRC')
end

def csp_frame_src
  get_csp_source('CSP_FRAME_SRC')
end

def csp_media_src
  get_csp_source('CSP_MEDIA_SRC', '*')
end

def csp_style_src
  get_csp_source('CSP_STYLE_SRC', "'unsafe-inline' http: https: *")
end

def csp_img_src
  get_csp_source('CSP_IMG_SRC', '*')
end

def csp_font_src
  get_csp_source('CSP_FONT_SRC', '*')
end

def csp_child_src
  get_csp_source('CSP_CHILD_SRC', '*')
end

def csp_worker_src
  get_csp_source('CSP_WORKER_SRC', '*')
end

def csp_connect_src
  get_csp_source('CSP_CONNECT_SRC', '*')
end

# Rails.logger.debug { "assets_host = #{assets_host}, media_hosts = #{media_hosts}" }
# Rails.logger.debug { "SSO host = #{sso_host}" } if sso_host.present?
# Rails.logger.debug { "csp_content_src = #{csp_content_src}, csp_script_src = #{csp_script_src}, csp_connect_src = #{csp_connect_src}, csp_img_src = #{csp_img_src}" }

Rails.application.config.content_security_policy do |p|
  p.base_uri        :none
  p.default_src     :none
  p.frame_ancestors :none
  p.font_src        :self, assets_host, *csp_font_src
  p.img_src         :self, :data, :blob, *media_hosts, *csp_img_src
  p.style_src       :self, assets_host, *csp_style_src
  p.media_src       :self, :data, *media_hosts, *csp_media_src
  p.frame_src       :self, :https, *csp_frame_src
  p.manifest_src    :self, assets_host

  if policy.sso_host.present?
    p.form_action :self, policy.sso_host
  else
    p.form_action :self
  end

  p.child_src       :self, :blob, assets_host, *csp_child_src
  p.worker_src      :self, :blob, assets_host, *csp_worker_src

  if Rails.env.development?
    webpacker_public_host = ENV.fetch('WEBPACKER_DEV_SERVER_PUBLIC', Webpacker.config.dev_server[:public])
    front_end_build_urls = %w(ws http).map { |protocol| "#{protocol}#{Webpacker.dev_server.https? ? 's' : ''}://#{webpacker_public_host}" }

    p.connect_src :self, :data, :blob, *media_hosts, Rails.configuration.x.streaming_api_base_url, *front_end_build_urls, *csp_connect_src
    p.script_src  :self, :unsafe_inline, :unsafe_eval, assets_host, *csp_script_src
    p.frame_src   :self, :https, :http
  else
    p.connect_src :self, :data, :blob, *media_hosts, Rails.configuration.x.streaming_api_base_url, *csp_connect_src
    p.script_src  :self, assets_host, "'wasm-unsafe-eval'", *csp_script_src
    p.frame_src   :self, :https
  end
end

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
Rails.application.config.content_security_policy_report_only = true

# Rails.application.config.content_security_policy_nonce_generator = ->(_request) { SecureRandom.base64(16) }

# Rails.application.config.content_security_policy_nonce_directives = %w(style-src)

Rails.application.reloader.to_prepare do
  PgHero::HomeController.content_security_policy do |p|
    p.script_src :self, :unsafe - inline, assets_host
    p.style_src  :self, :unsafe - inline, assets_host
  end

  PgHero::HomeController.after_action do
    request.content_security_policy_nonce_generator = nil
  end

  if Rails.env.development?
    LetterOpenerWeb::LettersController.content_security_policy do |p|
      p.child_src       :self
      p.connect_src     :none
      p.frame_ancestors :self
      p.frame_src       :self
      p.script_src      :unsafe - inline
      p.style_src       :unsafe - inline
      p.worker_src      :none
    end

    # LetterOpenerWeb::LettersController.after_action do
    #   # request.content_security_policy_nonce_directives = %w(script-src)
    # end
  end
end
