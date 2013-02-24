class PubsubHandler
	def recv(server,connection,packet)
		case packet.id
			when Protocol::SUBSCRIBE
				server.pubsub.subscribe(packet.ch, connection)
				puts "sub"
			when Protocol::UNSUBSCRIBE
				server.pubsub.unsubscribe(packet.ch, connection)
			when Protocol::PUBLISH
			
		end
	end
end