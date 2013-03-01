require 'eventmachine'

class Connection < EM::Connection
	include EM::P::ObjectProtocol
	
	attr_accessor :id
	attr_reader :ip, :port
	
	# ������ �ʱ�ȭ�� �� �ҷ����� �޼ҵ�
	def initialize(*args)
		@port, @ip = Socket.unpack_sockaddr_in(get_peername)
		@server = args[0]
		@server.clients.push self
		
		@db = DB.new DB_ACCOUNT
		@mem = SHAREDMEM.new SHAREDMEM_HOST, SHAREDMEM_PORT
		
		connect
		
		set_sock_opt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, CONNECTION_NODELAY)
	end
	# ������ ������ �� �ҷ����� �޼ҵ�
	def unbind
		@server.clients.delete self
		@db.dispose
		@mem.dispose
		
		disconnect
	end
	
	# ���� Ŭ���̾�Ʈ�� ��Ŷ�� �޾��� �� �ҷ����� �޼ҵ�
	#
	# obj : ���ŵ� ��Ŷ
	def receive_object(obj)
		@server.process.enqueue(self, obj)
	end
	
	
	# ������ �����Ǿ��� �� �ҷ����� �޼ҵ�
	def connect
		Log.output("new connection from " + @ip)
	end
	# ������ ����� �� �ҷ����� �޼ҵ�
	def disconnect
		Log.output("lost connection " + @ip)
	end
end