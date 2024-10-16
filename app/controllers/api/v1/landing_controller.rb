# frozen_string_literal: true

class Api::V1::LandingController < Api::BaseController
  def show
    render json: Account.order(created_at: :desc).limit(100), each_serializer: REST::AccountSerializer
  end
end
