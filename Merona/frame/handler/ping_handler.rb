class PingHandler < Handler
	def recv(server,connection,packet)
		case packet.id
			when Protocol::PING
				connection.send packet
		end
	end
end