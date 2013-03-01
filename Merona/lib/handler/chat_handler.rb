class ChatHandler < Handler
	def recv(server,connection,packet)
		case packet.id
			when Protocol::CHAT
				#puts "[#{packet["sender"]}] : #{packet["msg"]}"
				
				reply = Packet.new
				reply.id = Protocol::CHAT
				reply["sender"] = packet["sender"]
				reply["msg"] = packet["msg"]
				
				server.pubsub.publish(packet.ch, reply)
		end
	end
end