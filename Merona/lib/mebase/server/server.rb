require 'eventmachine'

class Connection < EM::Connection
	include EM::P::ObjectProtocol
	
	attr_reader :ip, :port
	
	@@clients = Array.new
	
	def post_init
		@port, @ip = Socket.unpack_sockaddr_in(get_peername)
		connect
		@@clients.push self
	end
	def unbind
		@@clients.delete self
		disconnect
	end
	def receive_object(obj)
		p obj
	end
	
	
	def self.clients
		@@clients
	end
	
	def connect
		Log.output("new connection from " + @ip)
	end
	def disconnect
		Log.output("lost connection " + @ip)
	end
end

class Server
	def initialize(port)
		EventMachine.start_server("127.0.0.1", port, Connection)
		@handler = Array.new
	end
	def dispose
	end
	
	def add_handler(handler)
		@handler.push(handler)
	end
	def delete_handler(handler)
		@handler.delete handler
	end
end