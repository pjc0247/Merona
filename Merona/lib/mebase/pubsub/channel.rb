class Channel
	def initialize
		@channel = {}
	end
	def dispose
	end
	
	def subscribe(name)
		if @channel[name] == nil
			@channel[name] = Array.new
		end
		
		@channel[name].push name
	end
	def unsubscribe(name)
		@channel[name].delete name
		
		if @channel[name].size == 0
			@channel[name] = nil
		end
	end
	def publish(name, packet)
		if @channel[name] == nil
			@channel[name] = Array.new
		end
		
		@channel[name].each do |client|
			client.send packet
		end
	end
end