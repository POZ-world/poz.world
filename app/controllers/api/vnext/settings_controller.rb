# frozen_string_literal: true

class Api::Vnext::SettingsController < ApplicationController
  class SettingWrapper
    include MarkdownHelper
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

    respond_to do |format|
      format.html { render html: MarkdownHelper.as_html(format(setting.value, domain: Rails.configuration.x.local_domain).to_s), content_type: 'application/x-setting+html' }
      format.json { render json: SettingWrapper.new(value: setting.value), content_type: 'application/setting+json' }
      format.text { render plain: setting.value, content_type: 'text/x-setting+plain' }
    end unless setting.nil?

    if setting.nil?
      respond_to do |format|
        format.html { render html: '<p>Setting not found</p>'.html_safe } # Adjust the HTML as needed
        format.json { render json: { error: 'Setting not found' }, status: 404 }
        format.text { render plain: 'Setting not found', status: 404 }
      end
    else
      
    end
  end
end
