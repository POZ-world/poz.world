# frozen_string_literal: true

class REST::RuleSerializer < ActiveModel::Serializer
  include MarkdownHelper
  attributes :id, :text, :hint

  def id
    object.id.to_s
  end

  def text
    as_html(object.text)
  end

  def hint
    as_html(object.hint)
  end
end
