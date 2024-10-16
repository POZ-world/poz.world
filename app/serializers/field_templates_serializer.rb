# frozen_string_literal: true

# app/serializers/field_template_serializer.rb
# Serializer for FieldTemplate model
class FieldTemplatesSerializer < ActiveModel::Serializer
  has_many :field_templates
end
