class ChannelPool
	def initialize
		@channel = {}
	end
	def dispose
	end
	
	def create_channel
	end
	
	def subscribe(name, client)
		if @channel[name] == nil
			@channel[name] = Array.new
		end
		
		@channel[name].push client
	end
	def unsubscribe(name, client)
		@channel[name].delete client
		
		if @channel[name].size == 0
			@channel[name] = nil
		end
	end
	def publish(name, packet)
		if @channel[name] == nil
		else
			@channel[name].each do |client|
				client.send packet
			end
		end
	end
end