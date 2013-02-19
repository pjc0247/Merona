class Channel
	def initialize
		@channel = {}
	end
	def dispose
	end
	
	def subscribe(ch)
		if @channel[ch] == nil
			@channel[ch] = Array.new
		end
		
		@channel[ch].push name
	end
	def unsubscribe(ch)
		@channel[ch].delete name
		
		if @channel[ch].size == 0
			@channel[ch] = nil
		end
	end
	def publish(ch, packet)
		if @channel[ch] == nil
			@channel[ch] = Array.new
		end
		
		@channel[ch].each do |client|
			client.send packet
		end
	end
end