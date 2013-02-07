class ChatPacket < Packet
	def initialize
		super
		@id = Protocol.CHAT
	end
	
	def msg=(msg)
		@data["msg"] = msg
	end
	def msg
		@data["msg"]
	end
	
	def sender=(id)
		@data["sender"] = id
	end
	def sender
		@data["sender"]
	end
	def receiver(id)
		@data["receiver"] = id
	end
	def receiver
		@data["receiver"]
	end
end