# frozen_string_literal: true

class Api::Vnext::InitialStatesController < ApplicationController
  include InitialStateHelper

  def index
    render json: initial_state({})
  end
end
