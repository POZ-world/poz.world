# frozen_string_literal: true

require 'redis'
require 'hiredis'
require 'hiredis/connection' # Ensure hiredis is required
require 'redis-namespace' # Ensure hiredis is required

# Redis.sadd_returns_boolean = false
# Redis.current = Redis.new(url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/1'), driver: :hiredis)
