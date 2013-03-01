require 'eventmachine'

class Connection < EM::Connection
	include EM::P::ObjectProtocol
	
	attr_accessor :id
	attr_reader :ip, :port
	
	# 연결을 초기화할 때 불려지는 메소드
	def initialize(*args)
		@port, @ip = Socket.unpack_sockaddr_in(get_peername)
		@server = args[0]
		@server.clients.push self
		
		@db = DB.new DB_ACCOUNT
		@mem = SHAREDMEM.new SHAREDMEM_HOST, SHAREDMEM_PORT
		
		connect
		
		set_sock_opt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, CONNECTION_NODELAY)
	end
	# 연결을 정리할 때 불려지는 메소드
	def unbind
		@server.clients.delete self
		@db.dispose
		@mem.dispose
		
		disconnect
	end
	
	# 현재 클라이언트가 패킷을 받았을 때 불려지는 메소드
	#
	# obj : 수신된 패킷
	def receive_object(obj)
		@server.process.enqueue(self, obj)
	end
	
	
	# 연결이 수립되었을 때 불려지는 메소드
	def connect
		Log.output("new connection from " + @ip)
	end
	# 연결이 종료될 때 불려지는 메소드
	def disconnect
		Log.output("lost connection " + @ip)
	end
end