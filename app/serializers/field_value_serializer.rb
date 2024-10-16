# frozen_string_literal: true

# app/serializers/field_value_serializer.rb
# Serializer for FieldValue model
class FieldValueSerializer < ActiveModel::Serializer
  attributes :default, :order, :value, :description,
             :first_person_singular_description, :second_person_singular_description,
             :third_person_masculine_description, :display_value,
             :first_person_singular_display_value, :second_person_singular_display_value,
             :third_person_masculine_display_value
end
