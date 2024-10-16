# frozen_string_literal: true

# config/initializers/redis_client_patch.rb

module RedisClientPatch
  def generate(args, kwargs = nil)
    command = args.flat_map do |element|
      case element
      when Hash
        element.flatten
      else
        element
      end
    end

    kwargs&.each do |key, value|
      case value
      when true
        command << key.name
      when false
        # Skip or handle false values as needed
        next
      else
        command << key.name << value
      end
    end

    command.map! do |element|
      case element
      when String
        element
      when Symbol
        element.name
      when Integer, Float, TrueClass, FalseClass
        element.to_s
      when NilClass
        ''
      else
        raise TypeError, "Unsupported command argument type: #{element.class}"
      end
    end

    raise ArgumentError, "can't issue an empty redis command" if command.empty?

    command
  end
end

# Reopen the class and apply the patch
RedisClient::CommandBuilder.singleton_class.prepend(RedisClientPatch)
