# frozen_string_literal: true

scope path: '.well-known' do
  scope module: :well_known do
    get :did, to: 'did#did', as: :did, defaults: { format: 'json' }
    get 'did-configuration', to: 'did#configuration', as: :configuration, defaults: { format: 'json' }
  end
end
