# frozen_string_literal: true

class MascotController < ApplicationController
  include MascotHelper

  def serve
    redirect_to my_mascot_image_url
    # if mascot_images.any?
    #   random_image = mascot_images.sample
    #   file_extension = File.extname(random_image)
    #   mime_type = case file_extension
    #               when '.jpg', '.jpeg' then 'image/jpeg'
    #               when '.png' then 'image/png'
    #               when '.gif' then 'image/gif'
    #               else 'application/octet-stream'
    #               end

    #   send_file(random_image, type: mime_type, disposition: 'inline')
    # else
    #   render plain: 'No images found', status: 404
    # end
  end
end
