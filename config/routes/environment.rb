# frozen_string_literal: true

namespace :js do
  resource :environment, only: %i(js json)
  # get '/environment.js', to: 'environment#js'
  # get '/environment.json', to: 'environment#json'
  # Route to display environment variables
end
namespace :api do
  namespace :vnext do
    namespace :js do
      resource :environment, only: %i(js json)
      # get '/environment.js', to: 'environment#js'
      # get '/environment.json', to: 'environment#json'
      # Route to display environment variables
    end
  end
  # get '/js/environment.js', to: 'api/vnext/js/environment#js'
  # get '/api/vnext/js/environment.js', to: 'api/vnext/js/environment#js'
end
