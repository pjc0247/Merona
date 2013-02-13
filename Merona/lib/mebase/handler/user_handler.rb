class UserHandler < Handler
	def recv(server,connection,packet)
		case packet.id
			when Protocol::REGIST
			when Protocol::UNREGIST
			when Protocol::LOGIN
			when Protocol::LOGOUT
		end
	end
end