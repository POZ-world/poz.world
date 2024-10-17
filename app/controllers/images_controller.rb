# app/controllers/images_controller.rb

class ImagesController < ApplicationController
  include RoutingHelper

  def wordmark
    respond_to do |format|
      format.svg { redirect_to frontend_asset_url('images/logo-symbol-wordmark.svg') }
      format.png { redirect_to frontend_asset_url('images/logo-symbol-wordmark.png') }
    end
  end

  def show
    filename = "#{params[:filename]}.#{params[:format]}"
    redirect_to frontend_asset_url("images/#{filename}")
  end

  private

  def image_params
    params.permit(:filename, :format)
  end
end
