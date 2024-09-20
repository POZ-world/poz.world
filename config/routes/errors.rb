# frozen_string_literal: true

get '/400', to: 'application#bad_request'
get '/403', to: 'application#forbidden'
get '/404', to: 'application#not_found'
get '/406', to: 'application#not_acceptable'
get '/410', to: 'application#gone'
get '/418', to: 'application#im_a_teapot'
get '/422', to: 'application#unprocessable_entity'
get '/429', to: 'application#too_many_requests'
get '/500', to: 'application#internal_server_error'
get '/502', to: 'application#bad_gateway'
get '/503', to: 'application#service_unavailable'
