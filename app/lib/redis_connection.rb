# frozen_string_literal: true

class RedisConnection
  class << self
    def establish_pool(new_pool_size)
      @pool&.shutdown(&:close)
      @pool = ConnectionPool.new(size: new_pool_size) { new.connection }
    end

    delegate :with, to: :pool

    def pool
      @pool ||= establish_pool(pool_size)
    end

    def pool_size
      if Sidekiq.server?
        Sidekiq[:concurrency]
      else
        ENV['MAX_THREADS'] || 5
      end
    end
  end

  attr_reader :config

  def initialize
    # Fetch configuration and remove namespace from config hash if exists
    base_config = REDIS_CONFIGURATION.base
    @config = base_config.except(:namespace)
    @namespace = base_config[:namespace]
  end

  def connection
    if namespace.present?
      Redis::Namespace.new(namespace, redis: raw_connection)
    else
      raw_connection
    end
  end

  private

  def raw_connection
    Redis.new(**config)
  end

  # Add a reader for namespace
  attr_reader :namespace
end
