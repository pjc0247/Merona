$server = {}

class Server
	attr_reader :name
	attr_reader :port
	attr_reader :handler, :process
	attr_reader :pubsub
	
	attr_accessor :clients
	
	def initialize(name,port,klass=Connection)
		EventMachine.start_server("localhost", port, klass, self)

		@clients = Array.new
		@handler = Array.new
		
		@pubsub = ChannelPool.new
		@process = ProcessPool.new(self)
		@process.create_worker SERVER_WORKERS
		
		@name = name
		@port = port
		
		$server[@name] = self
	end
	def dispose
		$server.delete @name
	end
	
	def add_handler(handler)
		@handler.push handler.new
	end
	def delete_handler(handler)
		@handler.each do |value|
			if value.class == handler
				@handler.delete value
			end
		end
	end
	
	def exclude(connection)
		@clients.reject { |c| connection == c }
	end
	def broadcast(packet, exclusion = nil)
		(exclusion ? exclude(exclusion) : @clients).each do |client|
			client.send packet
		end
	end
end