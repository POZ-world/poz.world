# frozen_string_literal: true

# app/serializers/field_template_serializer.rb
# Serializer for FieldTemplate model
class FieldTemplateSerializer < ActiveModel::Serializer
  attributes :name, :field_type, :category, :dropdown, :multiple, :description,
             :first_person_singular_description, :second_person_singular_description,
             :third_person_masculine_description

  has_many :field_values

  def as_json(*_args)
    {
      name: object.name,
      field_type: object.field_type,
      category: object.category,
      dropdown: object.dropdown,
      multiple: object.multiple,
      description: object.description,
      first_person_singular_description: object.first_person_singular_description,
      second_person_singular_description: object.second_person_singular_description,
      third_person_masculine_description: object.third_person_masculine_description,
      values: object.field_values.order(:value).map do |field_value|
        {
          default: field_value.default,
          order: field_value.order,
          value: field_value.value,
          description: field_value.description,
          first_person_singular_description: field_value.first_person_singular_description,
          second_person_singular_description: field_value.second_person_singular_description,
          third_person_masculine_description: field_value.third_person_masculine_description,
          display_value: field_value.display_value,
          first_person_singular_display_value: field_value.first_person_singular_display_value,
          second_person_singular_display_value: field_value.second_person_singular_display_value,
          third_person_masculine_display_value: field_value.third_person_masculine_display_value,
        }
      end,
    }
  end
end
