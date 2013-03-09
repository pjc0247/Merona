class EchoHandler < Handler
	def recv(server,connection,packet)
		case packet.id
			when Protocol::ECHO
				connection.send packet
		end
	end
end