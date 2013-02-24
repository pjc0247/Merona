require 'redis'

class RedisMemory < SharedMemory
	def initialize(host="localhost", port=6679)
		@redis = Redis.new(:host => host, :port => port)
	end
	def dispose
	end
	
	def get(name)
		@redis.get name
	end
	def set(name, value)
		@redis.set name, value
	end
end