class Handler
	def initialize
	end
	def dispose
	end
	
	# 패킷을 수신했을 때 불려지는 메소드
	#
	# server : 수신한 서버
	# connection : 패킷을 보낸 클라이언트
	# packet : 수신한 패킷
	def recv(server,connection,packet)
		#case packet.id
		#	when Protocol::PacketID
		#		process code here
		#end
	end
end