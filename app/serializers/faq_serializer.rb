# frozen_string_literal: true

# app/serializers/faq_serializer.rb
class FaqSerializer < ActiveModel::Serializer
  attributes :id, :number, :question, :answer
end
