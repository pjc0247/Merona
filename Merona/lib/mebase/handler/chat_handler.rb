class ChatHandler < Handler
	def recv(server,connection,packet)
		case packet.id
			when Protocol::CHAT
				#pkt.sender = getClientNickname
				puts "[#{packet["sender"]}] : #{packet["msg"]}"
				server.broadcast packet
		end
	end
end