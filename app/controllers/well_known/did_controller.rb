# frozen_string_literal: true

module WellKnown
  class DidController < ActionController::Base # rubocop:disable Rails/ApplicationController
    def did
      json = ENV.fetch('DID_DOCUMENT', nil)

      render json: json, content_type: 'application/did+json'
    end
  end
end
