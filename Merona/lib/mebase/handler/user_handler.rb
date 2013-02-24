class UserHandler < Handler
	def recv(server,connection,packet)
		case packet.id
			when Protocol::REGIST
			when Protocol::UNREGIST
			when Protocol::LOGIN
				rs = connection.db.select("account", "*", "id=#{packet["id"]} and pw=#{paacket["pw"]}")
				row = rs.next
				
				reply = Packet.new
				reply.id = LOGIN_RESULT
				if row == nil
					reply["result"] = nil
				else
					reply["result"] = true
					connection.id = packet["id"]
				end
				
				rs.close
				connection.send reply
			when Protocol::LOGOUT
		end
	end
end