# frozen_string_literal: true

# app/models/fields/field_template_rules.rb

class FieldTemplateRules
  attr_accessor :data

  DEFAULT_METHOD = :all_of
  VALID_METHODS = {
    all_of: 'all_of',
    any_of: 'any_of',
    none_of: 'none_of',
    one_of: 'one_of',
    exactly: 'exactly',
  }.freeze

  def initialize(rules = {}, method = 'all_of')
    @data = { 'rules' => rules }

    if VALID_METHODS.key?(method)
      @data['method'] = method
    else
      raise ArgumentError, 'Invalid method value. Allowed values: "all_of", "any_of", "none_of", "one_of", "exactly"'
    end
  end

  def [](key)
    @data['rules'][key.to_s]
  end

  def []=(key, value)
    @data['rules'][key.to_s] = value
  end

  def method
    @data['method']
  end

  def method=(method)
    if VALID_METHODS.key(method)
      @data['method'] = method
    else
      raise ArgumentError, 'Invalid method value. Allowed values: "all_of", "any_of", "none_of", "one_of", "exactly"'
    end
  end

  def rules
    @data.except('method')
  end

  def to_json(*_args)
    @data.to_json
  end

  def from_json(json)
    @data = JSON.parse(json)
  end
end
