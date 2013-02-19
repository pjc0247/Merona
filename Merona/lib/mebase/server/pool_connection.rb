require 'eventmachine'

class PoolConnection < Connection
	def initialize(*args)
		@server = args[0]
	end
	def unbind
	end
	
	def send(packet)
		send_object packet
	end
	def receive_object(obj)
		@server.pubsub.recv @server, self, obj
	end
	
	def connect
		Log.output("new connection from " + @ip)
	end
	def disconnect
		Log.output("lost connection " + @ip)
	end
end