require 'redis'

class Redis
	def dispose
	end
	
	def [](name)
		get name
	end
	def []=(name, value)
		set name, value
	end
end