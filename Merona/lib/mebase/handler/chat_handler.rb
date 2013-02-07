class Handler
	def initialize
	end
	def dispose
	end
	
	def recv(packet)
		case packet.id
			when Protocol.CHAT
				puts "[#{pkt.sender}] : #{pkt.msg}"
		end
	end
end