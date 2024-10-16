# frozen_string_literal: true

module Api
  module Vnext
    class LinksController < ApplicationController
      # before_action :set_link # , only: %i(show update destroy)

      def index
        # authorize Link
        @links = Link.sorted.map do |link|
          {
            id: link.id,
            url: link.url,
            title: link.title,
            position: link.position,
            group: link.group,
          }
        end
        render json: @links
      end

      # Ensure you have a `set_link` method if you uncomment the before_action
      # private
      # def set_link
      #   @link = Link.find(params[:id])
      # end
    end
  end
end
