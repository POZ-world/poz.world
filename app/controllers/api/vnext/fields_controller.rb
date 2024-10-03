# frozen_string_literal: true

class Api::Vnext::FieldsController < ApplicationController
  include HumanizerHelper

  def templates
    field_templates = FieldTemplate.all

    render json: field_templates, content_type: 'application/field-templates+json' # , each_serializer: FieldTemplateSerializer
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'FieldTemplates not found' }, status: 404
  end

  def templates_js
    js = <<~JAVASCRIPT
      var json = document.getElementById('field-templates-json').innerText;
      window.field_templates = JSON.parse(json);
    JAVASCRIPT
    render js: js, content_type: 'application/javascript'
  end
end
