# frozen_string_literal: true

module RedisHelper
  def self.safe_redis_call(redis, *args)
    # Debug arguments and their types
    args.each do |arg|
      Rails.logger.debug("Redis Argument: #{arg.inspect} | Type: #{arg.class}")
    end

    redis.call(*args)
  end

  def process_data_for_redis(data)
    case data
    when TrueClass
      '1'
    when FalseClass
      '0'
    else
      data
    end
  end
end
