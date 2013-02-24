require 'eventmachine'

class Connection < EM::Connection
	include EM::P::ObjectProtocol
	
	attr_accessor :id
	attr_reader :ip, :port
	
	def initialize(*args)
		@port, @ip = Socket.unpack_sockaddr_in(get_peername)
		@server = args[0]
		@server.clients.push self
		
		@db = DB.new DB_ACCOUNT
		@mem = SHAREDMEM.new SHAREDMEM_HOST, SHAREDMEM_PORT
		
		connect
		
		set_sock_opt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, CONNECTION_NODELAY)
	end
	def unbind
		@server.clients.delete self
		@db.dispose
		@mem.dispose
		
		disconnect
	end
	
	def send(packet)
		send_object packet
	end
	def receive_object(obj)
		p obj
		@server.process.enqueue(self, obj)
	end
	
	def connect
		Log.output("new connection from " + @ip)
	end
	def disconnect
		Log.output("lost connection " + @ip)
	end
end