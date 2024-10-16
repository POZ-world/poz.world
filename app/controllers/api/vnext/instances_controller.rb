# frozen_string_literal: true

class Api::Vnext::InstancesController < Api::V2::InstancesController
  def show
    render json: InstancePresenter.new, serializer: REST::Vnext::InstanceSerializer
  end
end
