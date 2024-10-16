# frozen_string_literal: true

namespace :admin do
  resources :faqs, only: [:index, :new, :create, :edit, :update, :destroy] do
    patch :swap_positions, on: :member
  end
end

namespace :api do
  namespace :vnext do
    resources :faqs, only: [:index, :show, :update, :destroy]
  end
end

get '/api/v1/instance/faqs', to: 'api/vnext/faqs#index'
