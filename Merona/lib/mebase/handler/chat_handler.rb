class ChatHandler < Handler
	def recv(packet)
		case packet.id
			when Protocol::CHAT
				#pkt.sender = getClientNickname
				puts "[#{packet.data["sender"]}] : #{packet.data["msg"]}"
		end
	end
end