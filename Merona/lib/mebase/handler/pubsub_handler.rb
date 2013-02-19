class PubsubHandler
	def recv(server,connection,packet)
		case packet.id
			when Protocol::SUBSCRIBE
				
			when Protocol::UNSUBSCRIBE
				
			when Protocol::PUBLISH
			
		end
	end
end