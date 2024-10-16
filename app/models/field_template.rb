# frozen_string_literal: true

# app/models/fields/field_template.rb
class FieldTemplate < ApplicationRecord
  include Discard::Model
  include HumanizerHelper

  self.discard_column = :deleted_at

  # Define relationships if needed
  has_many :field_values, dependent: :destroy

  # Explicitly declare the 'field_type' attribute with `attribute` method
  attribute :field_type, :string
  attribute :deleted_at, :datetime
  attribute :rules, :jsonb

  enum :field_type, { string: 'string', float: 'float', integer: 'integer', boolean: 'boolean', object: 'object', url: 'url', date: 'date', datetime: 'datetime', location: 'location' } # Enum backed by string

  # Validations
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true
  validates :multiple, inclusion: { in: [true, false] }
  validates :field_type, inclusion: { in: field_types.keys }
  validates :third_person_masculine_description, presence: true, allow_blank: false
  validates :second_person_singular_description, presence: true, allow_blank: false
  validates :first_person_singular_description, presence: true, allow_blank: false

  def description=(description)
    write_attribute(:description, description)
    self[:third_person_masculine_description] = translate(description, :third_singular_masculine)
    self[:second_person_singular_description] = translate(description, :second_singular)
    self[:first_person_singular_description] = translate(description, :first_singular)
  end

  # Methods for retrieving drop-down options
  def dropdown_options
    field_values.order(:value)
  end

  # Method to retrieve the default value
  def default_value
    field_values.find_by(default: true)&.value
  end

  def third_person_masculine_description
    translate(description, :third_singular_masculine)
  end

  def second_person_singular_description
    translate(description, :second_singular)
  end

  def first_person_singular_description
    translate(description, :first_singular)
  end

  # Custom getter for rules
  def rules
    jsonb_data = read_attribute(:rules) || {}
    @rules ||= FieldTemplateRules.new(jsonb_data['rules'] || {})
  end

  # Custom setter for rules
  def rules=(value)
    if value.is_a?(FieldTemplateRules)
      write_attribute(:rules, { rules: value.rules, combiner: value.combiner })
    elsif value.is_a?(String)
      write_attribute(:rules, value)
    elsif value.nil?
      write_attribute(:rules, {})
    elsif value.is_a?(Hash) # rubocop:disable Lint/DuplicateBranch
      write_attribute(:rules, value)
    else
      raise ArgumentError, "Expected a FieldTemplateRules object, but found #{value.class}"
    end
  end

  def as_json(*_args)
    {
      id: object.id,
      name: object.name,
      field_type: object.field_type,
      category: object.category,
      dropdown: object.dropdown,
      multiple: object.multiple,
      description: object.description,
      first_person_singular_description: object.first_person_singular_description,
      second_person_singular_description: object.second_person_singular_description,
      third_person_masculine_description: object.third_person_masculine_description,
    }
  end

  # Method to check if the user's account fields match the template's rules
  def rules_match?(account_fields)
    return true if rules.empty?

    account_fields_hash = account_fields.each_with_object({}) { |field, hash| hash[field.name] = field.value }

    rules.rules.all? do |field_name, expected_value|
      account_fields_hash[field_name] == expected_value
    end
  end

  # Define the method as a class method using `self.`
  def self.seed_field_templates_from_yaml(file_path)
    # Convert the relative path to an absolute path
    absolute_path = Rails.root.join(file_path).to_s

    # Ensure the file exists before attempting to load it
    raise "File not found: #{absolute_path}" unless File.exist?(absolute_path)

    yaml_content = YAML.load_file(absolute_path)

    yaml_content.each do |field_data|
      FieldTemplate.find_or_create_by(name: field_data['name']) do |template|
        template.dropdown = field_data['dropdown']
        template.description = field_data['description']
        template.multiple = field_data['multiple']
        template.field_type = field_data['type']
        template.category = field_data['category']
        template.rules = field_data['rules']
        template.save!
        FieldValue.seed_field_values_from_yaml(field_data['name'], field_data['source'])
      end
    end
  end
end
