# frozen_string_literal: true

resource :wordmark, to: 'images#wordmark', as: 'wordmark', defaults: { format: '.svg' }

scope :images do
  get '/:filename', to: 'images#show', as: 'image', defaults: { format: 'png' }
end
