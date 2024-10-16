# frozen_string_literal: true

class REST::FaqSerializer < ActiveModel::Serializer
  include MarkdownHelper
  attributes :id, :number, :question, :answer

  def question
    as_html(object.question)
  end

  def answer
    as_html(object.answer)
  end
end
