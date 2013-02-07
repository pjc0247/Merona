require 'eventmachine'

class ServerHandler < EM::Connection
	include EM::P::ObjectProtocol
	
	@@clients = Array.new
	
	def post_init
		@@clients.push self
	end
	def unbind
		@@clients.delete self
	end
	def receive_object(obj)
		p obj
	end
end

class Server
	def initialize(port)
		EventMachine.start_server("127.0.0.1", port, ServerHandler)
		
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