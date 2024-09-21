# frozen_string_literal: true

namespace :admin do
  resources :faqs, only: [:index, :new, :create, :edit, :update, :destroy]
end

namespace :api do
  namespace :vnext do
    resources :faqs, only: [:index, :show, :update, :destroy]
  end
end
