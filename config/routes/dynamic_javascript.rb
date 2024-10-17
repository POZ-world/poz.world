# frozen_string_literal: true

namespace :api do
  namespace :vnext do
    namespace :js do
      get :google_tag_manager, to: 'google_tag_manager#serve'
      get :identify_user, to: 'analytics_identify_user#serve'
      get :environment, to: 'environment#serve'
    end
  end
end

get '/js/google_tag_manager.js', to: 'api/vnext/js/google_tag_manager#serve'
get '/js/identify_user.js', to: 'api/vnext/js/analytics_identify_user#serve'
get '/js/environment.js', to: 'api/vnext/js/environment#serve'

# Route for Google Tag Manager script at /js/gtm.js
# get '/api/vnext/js/google_tag_manager.js', to: 'api/vnext/js/google_tag_manager#serve'
# get '/js/google_tag_manager.js', to: 'api/vnext/js/google_tag_manager#serve'

# Route for User Identification script at /js/ga.js
# get '/api/vnext/js/identify_user.js', to: 'api/vnext/js/analytics_identify_user#serve'
# get '/js/identify_user.js', to: 'api/vnext/js/analytics_identify_user#serve'
