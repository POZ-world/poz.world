# frozen_string_literal: true

namespace :api do
  namespace :vnext do
    resource :instance, only: [:show]
    # get 'settings/:var_name', to: 'settings#show'
    resources :settings, only: [:show], param: :var_name
    resources :links, only: [:index]
    get '/initial_state', to: 'initial_states#index'
  end
end
