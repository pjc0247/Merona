class ChannelPool
	def initialize
		@channel = {}
	end
	def dispose
	end
	
	def tokenize(name, &block)
		token = name.split(".")
		if token.size > 1
			ch = ""
			for i in 0..token.size-2
				ch += token[i] + "."
			end
			ch = ch[0..ch.length-2]
			
			block.call ch
		end
	end
	
	def subscribe(name, client)
		tokenize(name) do |t|
			subscribe t, client
		end
		
		if @channel[name] == nil
			@channel[name] = Array.new
		end
		
		@channel[name].push client
	end
	def unsubscribe(name, client)
		tokenize(name) do |t|
			unsubscribe t, client
		end
		
		return if @channel[name] == nil
		
		@channel[name].delete client
		
		if @channel[name].size == 0
			@channel[name] = nil
		end
	end
	def publish(name, packet)
		tokenize(name) do |t|
			publish t, packet
		end
		
		return if @channel[name] == nil
		
		@channel[name].each do |client|
			client.send packet
		end
	end
end