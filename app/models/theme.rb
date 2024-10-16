# frozen_string_literal: true

# app/models/theme.rb

class Theme < ApplicationRecord
  attribute :name, :string
  attribute :path, :string
  attribute :dark, :boolean, default: false

  def initialize(yaml = {})
    super
    @data = yaml
  end

  def name
    
  end
end
