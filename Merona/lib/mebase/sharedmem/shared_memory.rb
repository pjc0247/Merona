class SharedMemory
	attr_accessor :prefix
	
	def initialize
		@prefix = ""
	end
	def dispose
	end
	
	def push_prefix(prefix)
		@prefix += prefix
	end
	
	def get(name)
	end
	def set(name, value)
	end
	
	def [](name)
		get name
	end
	def []=(name,value)
		set name, value
	end
end