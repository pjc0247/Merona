class Handler
	attr_accessor :connection
	
	def initialize
	end
	def dispose
	end
	
	def recv(packet)
		#case packet.id
		#	when Protocol.PacketID
		#		process code here
		#end
	end
	
	
	def send(obj)
		
	end
end