require 'eventmachine'

class Connection < EM::Connection
	include EM::P::ObjectProtocol
	
	attr_reader :ip, :port
	
	def initialize(*args)
		@port, @ip = Socket.unpack_sockaddr_in(get_peername)
		@server = args[0]
		@server.clients.push self
		
		connect
	end
	def unbind
		@server.clients.delete self
		disconnect
	end
	
	def send(packet)
		send_object packet
	end
	def receive_object(obj)
		@server.handler.each do |handler|
			handler.recv(@server, self, obj)
		end
	end
	
	def connect
		Log.output("new connection from " + @ip)
	end
	def disconnect
		Log.output("lost connection " + @ip)
	end
end