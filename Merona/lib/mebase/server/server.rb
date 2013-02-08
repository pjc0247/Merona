require 'eventmachine'

$server = {}

class Connection < EM::Connection
	include EM::P::ObjectProtocol
	
	attr_reader :ip, :port
	
	@@clients = Array.new
	
	def initialize(*args)
		@port, @ip = Socket.unpack_sockaddr_in(get_peername)
		connect
		@@clients.push self
		
		@server = $server[args[0]]
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
	attr_reader :name
	attr_reader :port
	
	def initialize(name,port,klass=Connection)
		EventMachine.start_server("127.0.0.1", port, klass, name)
		
		@handler = Array.new
		
		@name = name
		@port = port
		
		$server[@name] = self
	end
	def dispose
		$server.delete @name
	end
	
	def add_handler(handler)
		@handler.push(handler)
	end
	def delete_handler(handler)
		@handler.delete handler
	end
end