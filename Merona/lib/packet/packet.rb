class Packet
	attr_accessor :id
	attr_accessor :size
	attr_accessor :data
	attr_accessor :ch
	
	def initialize(id = 0, ch = "*")
		@data = {}
		
		@id = id
		@ch = ch
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

	def ch=(ch)
		@ch = ch
	end
	def ch
		@ch
	end
	
	def type=(type)
		@data["type"] = type
	end
	def type
		@data["type"]
	end
end