class SyncHandler < Handler
	def recv(server,connection,packet)
		case packet.id
			when Protocol::SYNC
				reply = Packet.new
				reply.id = Protocol::SYNC
				reply["x"] = packet["x"]
				reply["y"] = packet["y"]
				reply["oid"] = packet["oid"]
				
				server.pubsub.publish(packet.ch, reply)
			when Protocol::PUSH_OBJECT
				reply = Packet.new
				reply.id = Protocol::OBJECT_ID
				reply["oid"] = $oid
				$oid += 1	

				connection.send reply
				
				reply.id = Protocol::PUSH_OBJECT
				reply["x"] = packet["x"]
				reply["y"] = packet["y"]
				
				server.pubsub.publish(packet.ch, reply)
			when Protocol::DELETE_OBJECT
				reply = Packet.new
				reply.id = Protocol::DELETE_OBJECT
				reply["oid"] = packet["old"]
				
				server.pubsub.publish(packet.ch, reply)
		end
	end
end