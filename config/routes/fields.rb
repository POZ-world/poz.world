# frozen_string_literal: true

get '/settings/profile/css', to: 'settings/profile#css'
get '/settings/profile/js', to: 'settings/profile#js'

namespace :api do
  namespace :vnext do
   resources :field_templates, only: [:index, :show]
  end
end

namespace :admin do
  resources :field_templates do
    resources :field_values, except: [:index]
  end
  get '/field_values', to: 'field_values#index', as: 'field_values'
end
# get '/field_values', to: 'field_values#index', as: 'field_values'
# get '/field_values/new', to: 'field_values#new', as: 'new_field_value'
# get '/field_values/:field_template_id/:id/edit', to: 'field_values#edit', as: 'edit_field_value'
# get '/field_values/:field_template_id/:id', to: 'field_values#show', as: 'get_field_value'
# post '/field_values/:field_template_id', to: 'field_values#create', as: 'create_field_value'
# put '/field_values/:field_template_id/:id', to: 'field_values#update', as: 'update_field_value'
# delete '/field_values/:field_template_id/:id', to: 'field_values#destroy', as: 'delete_field_value'
