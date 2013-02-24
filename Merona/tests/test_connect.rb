require 'eventmachine'

load '../lib/mebase/packet/packet.rb'
load '../lib/mebase/protocol/pubsub_protocol.rb'
load '../lib/mebase/protocol/sync_protocol.rb'

load 'test_util.rb'

class Connection < EM::Connection
	include EM::P::ObjectProtocol
	
	def initialize(*args)
		p = Packet.new
		p.id = Protocol::SUBSCRIBE
		send_object p
		
		p.id = Protocol::SYNC
		p["x"] = 1
		p["y"] = 2
		p["oid"] = 3
		
		100.times do
			send_object p
		end
	end
	def unbind
	end
	
	def receive_object(obj)
		p obj
	end
end

EM::run do
	EM::connect "localhost", 9916, Connection
end

while true
	sleep 1
end

	