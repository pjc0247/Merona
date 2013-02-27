$server = {}

class Server
	attr_reader :name
	attr_reader :port
	attr_reader :handler, :process
	attr_reader :pubsub
	
	attr_accessor :clients
	
	# 서버를 생성한다
	#
	# name : 서버의 이름
	# port : 서버의 포트
	# klass : Connection 핸들러 클래스
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
	
	# 서버의 자원을 정리한다
	def dispose
		$server.delete @name
	end
	
	# 서버에 핸들러를 추가한다
	#
	# handler : 추가할 핸들러 클래스
	def add_handler(handler)
		@handler.push handler.new
	end
	
	# 서버에 등록된 핸들러를 제거한다
	#
	# handler : 제거할 핸들러 클래스
	def delete_handler(handler)
		@handler.each do |value|
			if value.class == handler
				@handler.delete value
			end
		end
	end
	
	# 해당 연결을 제외한 클라이언트 목록을 얻어온다
	#
	# connection : 제외할 연결
	def exclude(connection)
		@clients.reject { |c| connection == c }
	end
	
	# 모든 클라이언트에게 패킷을 브로드캐스팅한다
	#
	# packet : 브로드캐스팅할 패킷
	# exclusion : 제외할 클라이언트
	def broadcast(packet, exclusion = nil)
		(exclusion ? exclude(exclusion) : @clients).each do |client|
			client.send packet
		end
	end
end