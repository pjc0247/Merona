class ChatHandler < Handler
	def recv(packet)
		case packet.id
			when Protocol.CHAT
				#pkt.sender = getClientNickname
				puts "[#{pkt.sender}] : #{pkt.msg}"
		end
	end
end