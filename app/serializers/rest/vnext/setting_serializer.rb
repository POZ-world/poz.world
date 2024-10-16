# frozen_string_literal: true

class REST::Vnext::SettingSerializer < ActiveModel::Serializer
  attributes :id, :var, :value, :thing_type, :thing_id
end
