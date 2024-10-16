# frozen_string_literal: true

class ImagesController < ApplicationController
  include RoutingHelper
  def wordmark
    redirect_to frontend_asset_url('images/logo-symbol-wordmark.svg')
  end
end
