class Handler
	def initialize
	end
	def dispose
	end
	
	def recv(packet)
		case packet.id
			when Protocol.CHAT
				#pkt.sender = getClientNickname
				puts "[#{pkt.sender}] : #{pkt.msg}"
		end
	end
end