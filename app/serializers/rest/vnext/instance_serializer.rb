# frozen_string_literal: true

# config/initializers/markdown_helper.rb
require_relative '../../../helpers/markdown_helper'

class REST::Vnext::InstanceSerializer < ActiveModel::Serializer
  include MarkdownHelper
  include Rails.application.routes.url_helpers

  attributes :domain, :version, :tagline, :title, :description, :short_description, :icons, :stats, :urls

  def initialize(*args)
    default_url_options[:host] = web_domain
    super
  end

  def domain
    Rails.configuration.x.local_domain
  end

  def version
    Mastodon::Version.to_s
  end

  def tagline
    Setting.site_tagline
  end

  def title
    Setting.site_title
  end

  def description
    as_html(Setting.site_extended_description)
  end

  def short_description
    as_html(Setting.site_short_description)
  end

  has_one :contact, serializer: REST::InstanceSerializer::ContactSerializer
  has_many :rules, serializer: REST::RuleSerializer
  has_many :faqs, serializer: REST::FaqSerializer

  def icons
    ManifestSerializer.new(object).icons
  end

  def stats
    {
      user_count: instance_presenter.user_count,
      status_count: instance_presenter.status_count,
      domain_count: instance_presenter.domain_count,
    }
  end

  def urls
    {
      home: Setting.home_page_url,
      status_page: instance_presenter.status_page_url,
      source: Mastodon::Version.source_url,
      member_directory: api_v1_directory_url { web_domain },
      sign_up: url('/auth/sign_up'),
      log_in: url('/auth/sign_in'),
    }
  end

  private

  def instance_presenter
    @instance_presenter ||= InstancePresenter.new
  end

  def web_domain
    ENV.fetch('WEB_DOMAIN', Rails.configuration.x.local_domain)
  end

  def url(path)
    URI.join("https://#{web_domain}", path).to_s
  end
end
