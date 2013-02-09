class Packet
	attr_accessor :id
	attr_accessor :size
	attr_accessor :data
	
	def initialize
		@data = {}
		
		@id = -1
	end
	def dispose
	end
	
	def push(name,data)
		if name == nil
			return
		end
		
		@data[name] = data
	end
	def get(name)
		if name == nil
			return
		end
		
		@data[name]
	end
	
	def []=(name,data)
		push(name, data)
	end
	def [](name)
		get(name)
	end

	def type=(type)
		@data["type"] = type
	end
	def type
		@data["type"]
	end
end