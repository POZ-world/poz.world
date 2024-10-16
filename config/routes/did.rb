# frozen_string_literal: true

get '/.well-known/did.json', to: 'well_known/did#did'
get '/.well-known/did-configuration.json', to: 'well_known/did#configuration'
