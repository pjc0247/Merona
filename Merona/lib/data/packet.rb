class Packet
	attr_accessor :id
	attr_accessor :size
	attr_accessor :data
	
	def initialize
		@data = {}
	end
	def dispose
	end
	
	def push(name,data)
		if name == nil
			return
		end
		
		@data[name] = data
	end
end