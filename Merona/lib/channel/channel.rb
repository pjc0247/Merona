class Channel
	def initialize
		@clients = Array.new
	end
	def dispose
	end

	def subscribe(client)
		@clients.push client
	end
	def unsubscribe(client)
		@clients.delete client
		
		if @clients.size == 0
			return nil
		else
			return true
		end
	end
	def publish(packet)
		@clients.each do |client|
			client.send packet
		end
	end
end