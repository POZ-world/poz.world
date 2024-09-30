# frozen_string_literal: true

class Api::Vnext::SettingsController < ApplicationController
  class SettingWrapper
    include ActiveModel::Serialization
    include ActiveModel::Model

    attr_accessor :value

    def self.model_name
      ActiveModel::Name.new(self, nil, 'Setting')
    end

    def attributes
      { 'value' => value }
    end

    def read_attribute_for_serialization(attr)
      send(attr)
    end
  end

  def show
    var_name = params[:var_name]
    setting = Setting.find_by(var: var_name)

    if setting.nil?
      respond_to do |format|
        format.html { render html: '<p>Setting not found</p>'.html_safe } # Adjust the HTML as needed
        format.json { render json: { error: 'Setting not found' }, status: 404 }
        format.text { render plain: 'Setting not found', status: 404 }
      end
    else
      respond_to do |format|
        format.html { render html: markdown.render(format(setting.value, domain: Rails.configuration.x.local_domain)).html_safe } # rubocop:disable Rails/OutputSafety
        format.json { render json: SettingWrapper.new(value: setting.value) }
        format.text { render plain: setting.value }
      end
    end
  end

  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, escape_html: true, no_images: true)
  end
end
