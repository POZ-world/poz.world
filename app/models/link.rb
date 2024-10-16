# frozen_string_literal: true

class Link < ApplicationRecord
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :title, presence: true
  validates :position, presence: true
  validates :group, presence: true

  def self.sorted
    order(position: :asc)
  end
end
